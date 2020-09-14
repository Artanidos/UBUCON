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


Item
{
    property string feed_text: ""
    property string feed_image: ""
    property string feed_caption: ""
    height: txt.height //+ image.height + profileButton.height

    Column
    {
        width: parent.width
        
        Row
        {
             width: parent.width
            /*ToolButton 
            {
                id: profileButton
                width: 50
                height: 50
                Image 
                {
                    source: "qrc:/images/profile.svg"
                }
            }*/

            Text
            {
                id: caption
                width: parent.width - 50
                text: feed_caption
                font.bold: true
                wrapMode: Text.WordWrap
            }
        }
        Text
        {
            id: txt
            width: parent.width
            text: feed_text
            wrapMode: Text.WordWrap
        }

        /*Image
        {
            id: image
            source: feed_image
            width: parent.width
            fillMode: Image.PreserveAspectFit
        }*/
    }
}

