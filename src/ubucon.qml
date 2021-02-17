/****************************************************************************
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
****************************************************************************/

import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import at.crowdware.backend 1.0

ApplicationWindow 
{
    id: window
    width: 360
    height: 520
    visible: true
    title: "UBUCON"
    
    Material.theme: Material.System
    Material.accent: "#28a9e0"
    Material.primary: "#28a9e0"
    
    Shortcut 
    {
        sequences: ["Esc", "Back"]
        enabled: stackView.depth > 1
        onActivated: 
        {
            stackView.pop()
            listView.currentIndex = -1
        }
    }

    Shortcut 
    {
        sequence: "Menu"
        onActivated: optionsMenu.open()
    }

    header: ToolBar 
    {
        Material.foreground: "white"

        RowLayout 
        {
            spacing: 20
            anchors.fill: parent

            ToolButton 
            {
                id: drawerButton
                visible: false
                icon.name: stackView.depth > 1 ? "back" : "drawer"
                onClicked: 
                {
                    if (stackView.depth > 1) 
                    {
                        stackView.pop()
                        listView.currentIndex = -1
                    } 
                    else 
                    {
                        drawer.open()
                    }
                }
            }

            Label 
            {
                id: titleLabel
                text: listView.currentItem ? listView.currentItem.text : "UBUCON"
                font.pixelSize: 20
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }

            ToolButton 
            {
                icon.name: "menu"
                onClicked: optionsMenu.open()

                Menu 
                {
                    id: optionsMenu
                    x: parent.width - width
                    transformOrigin: Menu.TopRight

                    MenuItem 
                    {
                        text: "About"
                        onTriggered: aboutDialog.open()
                    }
                    MenuItem 
                    {
                        text: "Last Error"
                        onTriggered: errorDialog.open()
                        visible: backend.lastError != ""
                        height: visible ? implicitHeight : 0
                    }
                }
            }
        }
    }

    Drawer 
    {
        id: drawer
        width: Math.min(window.width, window.height) / 3 * 2
        height: window.height
        interactive: stackView.depth === 1

        ListView 
        {
            id: listView

            focus: true
            currentIndex: -1
            anchors.fill: parent

            delegate: ItemDelegate 
            {
                width: parent.width
                text: model.title
                highlighted: ListView.isCurrentItem
                onClicked: 
                {
                    if (model.title != "Home")
                    {
                        listView.currentIndex = index
                        stackView.push(model.source)
                    }
                    drawer.close()
                }
            }
            model: backend.menuModel
            ScrollIndicator.vertical: ScrollIndicator { }
        }
    }

    StackView 
    {
        id: stackView
        anchors.fill: parent
        initialItem: Pane 
        {
            id: pane

            Image 
            {
                id: logo
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                fillMode: Image.PreserveAspectFit
                source: "qrc:/images/logo.png"

                MouseArea
                {
                    enabled: backend.writepermission
                    anchors.fill: parent
                    onClicked:
                    {
                        stackView.replace("qrc:/Home.qml")
                        drawerButton.visible = true
                    }
                }
            }

            Text 
            {
                id: label
                text: backend.message
                textFormat: Text.RichText
                anchors.margins: 0
                anchors.top: logo.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                horizontalAlignment: Label.AlignHCenter
                verticalAlignment: Label.AlignVCenter
                wrapMode: Label.Wrap
                onLinkActivated: Qt.openUrlExternally(link)
            }
        }
    }

    Dialog 
    {
        id: aboutDialog
        modal: true
        focus: true
        title: "About UBUCON " + backend.version
        x: (window.width - width) / 2
        y: window.height / 6
        width: Math.min(window.width, window.height) / 3 * 2
        contentHeight: aboutColumn.height

        Column 
        {
            id: aboutColumn
            spacing: 20

            Label 
            {
                width: aboutDialog.availableWidth
                text: "UBUCON CONNECTS US ALL"
                wrapMode: Label.Wrap
                font.pixelSize: 15
            }

            Label 
            {
                width: aboutDialog.availableWidth
                text: "TODO"
                wrapMode: Label.Wrap
                font.pixelSize: 15
            }
        }
    }
    
    Dialog 
    {
        id: errorDialog
        modal: true
        focus: true
        title: "Last Errors"
        x: (window.width - width) / 2
        y: window.height / 6
        width: Math.min(window.width, window.height) / 3 * 2
        contentHeight: Math.min(window.width, window.height) / 3 * 2

        ScrollView 
        {
            width: parent.width
            anchors.fill: parent
            clip: true
            
            Text
            {
                anchors.fill: parent
                text: backend.lastError
                font.pixelSize: 15
                wrapMode: Text.Wrap
            }
        }
    }
}