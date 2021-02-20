#############################################################################
# Copyright (C) 2021 CrowdWare
#
# This file is part of UBUCON.
#
#  UBUCON is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  UBUCON is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with UBUCON.  If not, see <http://www.gnu.org/licenses/>.
#
#############################################################################

from flask import Flask
from flask import request
from flask import jsonify
from ubucon_keys import UBUCON_DB_PWD
from ubucon_keys import UBUCON_DB_HOST
from ubucon_keys import UBUCON_DB_USER
from ubucon_keys import UBUCON_DATABASE
from mysql.connector import connect
from mysql.connector.errors import IntegrityError

def dbConnect():
    db = connect(host=UBUCON_DB_HOST,
                 user=UBUCON_DB_USER,
                 password=UBUCON_DB_PWD,
                 database=UBUCON_DATABASE)
    return db


app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello here is the webservice of UBUCON!'


@app.route('/register', methods=['POST'])
def register():
    content = request.json
    uuid = content['uuid']
    name = content['name']
    tags = content['tags']
    description = content['description']
    coordinates = content['coordinates']
    test = content["test"] # used only for unit testing

    if test != "true":
        try:
            conn = dbConnect()
            curs = conn.cursor()
            query = 'INSERT INTO location(uuid, name, tags, description, coordinates) VALUES("' + uuid + '", "' + name + '", "' + tags + '","' + description + '", GeomFromText("' + coordinates +'"))'
            curs.execute(query)
            conn.commit()
        except IntegrityError as error:
            return jsonify(isError=True, message=error.msg, statusCode=200)
        finally:
            conn.close()

    return jsonify(isError=False, message="Success", statusCode=200)

@app.route('/location_list', methods=['POST'])
def location_list():
    content = request.json
    latitude = content['latitude']
    longitude = content['longitude']
    tags = content['tags']
    locations = []
    try:
        conn = dbConnect()
        curs = conn.cursor(dictionary=True)
        query = 'SELECT uuid, name, tags, description, ST_X(coordinates) as latitude, ST_Y(coordinates) as longitude FROM location WHERE ST_Distance_Sphere(coordinates, GeomFromText("POINT(' + str(latitude) + ' ' + str(longitude) + ')")) < 100000'
        curs.execute(query)
        for row in curs:
            locations.append({'uuid' : row['uuid'], 'name' : row['name'], 'tags' : row['tags'], 'description' : row['description'], 'latitude' : row['latitude'], 'longitude' : row['longitude']})
    except IntegrityError as error:
        return jsonify(isError=True, message=error.msg, statusCode=200)
    finally:
        conn.close()

    return jsonify(isError=False,
        message="Success",
        statusCode=200, data=locations)