/****************************************************************************
* Copyright (C) 2021 CrowdWare
*
* This file is part of UBUCON.
*
*  UBUCON is free software: you can redistribute it and/or modify
*  it under the terms of the GNU General Public License as published by
*  the Free Software Foundation, either version 3 of the License, or
*  (at your option) any later version.
*
*  UBUCON is distributed in the hope that it will be useful,
*  but WITHOUT ANY WARRANTY; without even the implied warranty of
*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*  GNU General Public License for more details.
*
*  You should have received a copy of the GNU General Public License
*  along with UBUCON.  If not, see <http://www.gnu.org/licenses/>.
*
****************************************************************************/

import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtLocation 5.6
import QtPositioning 5.6

Page 
{
	id: page
	title: "HOUSE"

    PositionSource 
    {
        id: src
        active: true
    }

    Plugin 
    {
        id: mapPlugin
        preferred: ["osm", "here"]
    }

    Map 
    {
        anchors.fill: parent
        plugin: mapPlugin
        center: src.position.coordinate
        zoomLevel: 14
    }

    Button
    {
        text: "Tag Location"
        anchors.top: text.bottom
        onClicked: request('http://artanidosatubuconat.pythonanywhere.com/register', function (o) 
        {
            text.text = o.responseText;
        });
    }

    function request(url, callback) 
    {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = (function(myxhr) 
        {
            return function() 
            {
                callback(myxhr);
            }
        })(xhr);
        xhr.open('POST', url, true);
        xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
        xhr.send(JSON.stringify(
        { 
            "uuid": "1234", 
            "name" : "Test", 
            "tags" : "#house", 
            "description" : "bla bla", 
            "coordinates" : "POINT(2 3)", 
            "test": "false"
        }));
    }
}