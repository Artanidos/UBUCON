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
    }

    Plugin 
    {
        id: mapPlugin
        name: "osm"
        PluginParameter { name: "osm.mapping.providersrepository.disabled"; value: true }
        
    }

    Text
    {
        id: text
        text: "Bla"
    }
    Map 
    {
        id: mapview
        //anchors.fill: parent
        anchors.top: text.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        plugin: mapPlugin
        center: src.position.coordinate
        zoomLevel: 14

        MapItemView
        {
            model: markerModel
            delegate: mapcomponent
        }
    }

    Component 
    {
        id: mapcomponent
        MapQuickItem 
        {
            id: marker
            anchorPoint.x: image.width/4
            anchorPoint.y: image.height
            coordinate: position

            sourceItem: Image 
            {
                id: image
                source: "http://maps.gstatic.com/mapfiles/ridefinder-images/mm_20_red.png"
            }
        }
    }

    MouseArea 
    {
        anchors.fill: parent

        onPressAndHold:  {
            var coordinate = mapview.toCoordinate(Qt.point(mouse.x,mouse.y))
            markerModel.addMarker(coordinate)
        }
        onClicked: mouse.accepted = false;
        onPressed: mouse.accepted = false;
        onReleased: mouse.accepted = false;
        onDoubleClicked: mouse.accepted = false;
        onPositionChanged: mouse.accepted = false;
    }

    Button
    {
        text: "Tag Location"
        anchors.top: text.bottom
        onClicked: register();
    }

    function register() 
    {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = (function(myxhr) 
        {
            text.text = myxhr.responseText;
        })(xhr);
        xhr.open('POST', 'http://artanidosatubuconat.pythonanywhere.com/register', true);
        xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
        xhr.send(JSON.stringify(
        { 
            "uuid": backend.CreateUuid(), 
            "name" : "Test", 
            "tags" : "#house", 
            "description" : "bla bla", 
            "latitude" : src.position.coordinate.latitude, 
            "longitude" : src.position.coordinate.longitude,
            "test": "false"
        }));
    }

    function loadLocations()
    {
        text.text = "Loading...";
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function()
        {
            if ( xhr.readyState == xhr.DONE)
            {
                if ( xhr.status == 200)
                {
                    var jsonObject = JSON.parse(xhr.responseText)
                    for (var i = 0; i < jsonObject.data.length; i++) 
                    {
                        markerModel.addMarker(jsonObject.data[i].latitude, jsonObject.data[i].longitude);
                    } 
                }
                text.text = "Ready";
            }
        }
        xhr.open('POST', 'http://artanidosatubuconat.pythonanywhere.com/location_list', true);
        xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
        xhr.send(JSON.stringify(
        { 
            "tags" : "#house", 
            "latitude" : src.position.coordinate.latitude,
            "longitude" : src.position.coordinate.longitude
        }));
    }

    Component.onCompleted : 
    {
        loadLocations()
    }
}