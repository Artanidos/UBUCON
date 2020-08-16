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

    Image 
    {
        id: image
        height: page.height / 4
        source: "/media/art/data/SourceCode/UBUCON/images/cuddle.jpeg"
        fillMode: Image.PreserveAspectFit
        anchors.top: parent.top
    	anchors.right: parent.right
    	anchors.left: parent.left
    	anchors.margins: page.width / 10
    }

    Text
    {
        width: parent.width - page.width / 5
        text: "Ipsum lorem molor smit ahmend funida masala bepoz"
        wrapMode: Text.WordWrap
        anchors.top: image.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: page.width / 10
    }
} 