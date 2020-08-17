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


Page 
{
	id: page
	title: "UBUCON"

    ListView 
    {
        focus: true
        currentIndex: 1
        anchors.fill: parent

        delegate: ItemDelegate 
        {
            width: parent.width
            height: image.height + text.height + 30

            Image 
            {
                id: image
                width: page.width
                source: model.image
                fillMode: Image.PreserveAspectFit
                anchors.top: parent.top
                anchors.right: parent.right
                anchors.left: parent.left
                //anchors.margins: page.width / 10
            }

            Text
            {
                id: text
                width: page.width
                text: model.text
                wrapMode: Text.WordWrap
                anchors.top: image.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                //anchors.margins: page.width / 10
            }
        }

        model: ListModel 
        {
            ListElement 
            {
                image: "/media/art/data/SourceCode/UBUCON/images/cuddle.jpeg"
                text: "Ipsum lorem molor smit ahmend funida masala bepoz"
            }
            ListElement 
            {
                image: "/media/art/data/SourceCode/UBUCON/images/ubuntu_banner.png"
            	text: "Ipsum lorem molor smit ahmend funida masala bepoz"
            }
        }
    }
} 