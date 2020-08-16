/****************************************************************************
* Copyright (C) 2020 Olaf Japp
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

import QtQuick 2.5
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.1

ApplicationWindow 
{
    id: window
    visible: true
    width: 320
    height: 600

    header: ToolBar 
    {
    	height: window.height / 20
    	Material.background: Material.Green

        ToolButton 
        {
            id: menuButton
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            text: stackview.depth > 1 ? "￩" : "≡"  //"⟵⬅￩
            font.pixelSize: window.height / 20
            onClicked: 
            {
                if (stackview.depth > 1) 
                {
                    stackview.pop()
                } 
                else 
                {
                    drawer.open()
                }
            }    
        }   

        Label 
        {
            id: label
            anchors.centerIn: parent
            text: stackview.currentItem.title
            font.pixelSize: window.height / 30
            elide: Label.ElideRight
        }     
    }

    StackView 
    {
    	id: stackview
    	initialItem: Home {}
    	anchors.fill: parent
    }

    Drawer 
    {
        id: drawer

        width: Math.min(window.width, window.height) / 3 * 2
        height: window.height

        ListView 
        {
            focus: true
            currentIndex: -1
            anchors.fill: parent

            delegate: ItemDelegate 
            {
                width: parent.width
                text: model.text
                font.pixelSize: window.height / 30
                highlighted: ListView.isCurrentItem
                onClicked: 
                {
                    drawer.close()
                    //model.triggered()
                    //stackview.push("Receive.qml")
                }
            }

            model: ListModel 
            {
                ListElement 
                {
                    text: "Open... "
                }
                ListElement 
                {
                	text: "About... "
                }
            }
        }
    }

    function init()
    {
        bridge.queryServer()
    }

    function message(text)
    {
        txt.text = text
    }
}