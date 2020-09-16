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

import QtQuick 2.10
import QtQuick.Controls 2.3


Page
{
    id: page
    title: "UBUCON"

    Column
    {
        id: col
        width: parent.width
        
        Column
        {
            id: column
            width: parent.width
            height: 100
            Menubar
            {
                id: menubar
                height: 50
                width: parent.width
            }

            Searchpanel
            {
                id: searchpanel
                height: 50
                width: parent.width
            }
        }
        
        Flickable
        {
            flickableDirection: Flickable.VerticalFlick
            width: parent.width
            height: 700
            boundsBehavior: Flickable.DragOverBounds
            boundsMovement: Flickable.FollowBoundsBehavior
            contentHeight: 2000 // todo: calc feed height
            clip: true

            Column
            {
                width: parent.width
                Feed
                {
                    width: parent.width
                    feed_caption: "Cuddle Puddle"
                    feed_text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
                    feed_image: "qrc:/images/cuddle.jpeg"
                }

                Feed
                {
                    width: parent.width
                    feed_caption: "I like to live in the Nature"
                    feed_text: "Impsum lorem dolor simit ahmem"
                    feed_image: "qrc:/images/natur.jpg"
                }

                Feed
                {
                    width: parent.width
                    feed_caption: "UBUNTU"
                    feed_text: "Impsum lorem dolor simit ahmem"
                    feed_image: "qrc:/images/ubuntu_banner.png"
                }
            }
        }
    }
}
