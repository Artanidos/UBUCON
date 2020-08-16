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
import QtQuick.Layouts 1.11


Page
{
    id: page
    title: "UBUCON"

    ToolBar {
        id: toolBar
        Material.background: Material.Grey
        height: 40
        position: ToolBar.Header
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.left: parent.left

        ToolButton 
        {
            id: homeButton
            Image 
            {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "images/home.svg"
            }
        }

        ToolButton 
        {
            id: searchButton
            x: 40
            Image 
            {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "images/search.svg"
            }
        }

        

        ToolButton 
        {
            id: addButton
            x: 120
            y: 0
            text: "+"
        }

        ToolButton 
        {
            id: notifyButton
            x: 160
            Image 
            {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "images/notify.svg"
            }
        }

        ToolButton 
        {
            id: chatButton
            x: 200
            y: 0
            Image 
            {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                source: "images/chat.svg"
            }
        }
    }

    ToolButton 
    {
        id: profileButton
        x: 6
        y: 40

        Image 
        {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            source: "images/profile.svg"
        }
    }

    TextField 
    {
        id: textField
        x: 52
        y: 46
        anchors.rightMargin: 6
        anchors.left: profileButton.right
        anchors.right: parent.right
        placeholderText: qsTr("What are you doing right now?")
    }


    

    Image
    {
        id: image
        source: "/media/art/data/SourceCode/UBUCON/images/cuddle.jpeg"
        width: parent.width - page.width / 20 * 2
        height: width / 2
        anchors.top: profileButton.bottom
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.margins: page.width / 20
    }

    Text
    {
        width: parent.width - page.width / 10
        text: "Ipsum lorem molor smit ahmend funida masala bepoz"
        anchors.rightMargin: page.width / 20
        anchors.leftMargin: page.width / 20
        wrapMode: Text.WordWrap
        anchors.top: image.bottom
        anchors.left: parent.left
        anchors.right: parent.right
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:300}D{i:1;anchors_width:625;anchors_x:6;anchors_y:6}
}
##^##*/
