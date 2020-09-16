/****************************************************************************
# Copyright (C) 2020 Olaf Japp
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
import QtQuick.Controls.Universal 2.12
import Qt.labs.settings 1.0

ApplicationWindow 
{
    id: window
    width: 360
    height: 520
    visible: true
    title: "UBUCON"

    Settings 
    {
        id: settings
        property string style: "Default"
    }

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
                        text: "Settings"
                        onTriggered: settingsDialog.open()
                    }
                    MenuItem 
                    {
                        text: "About"
                        onTriggered: aboutDialog.open()
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
                    listView.currentIndex = index
                    stackView.push(model.source)
                    drawer.close()
                }
            }

            model: ListModel 
            {
                ListElement { title: "Home"; source: "qrc:/gui/Home.qml" }
            }

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
                width: pane.availableWidth / 2
                height: pane.availableHeight / 2
                anchors.centerIn: parent
                anchors.verticalCenterOffset: -50
                fillMode: Image.PreserveAspectFit
                source: "images/logo.png"
            }

            Label 
            {
                text: "You cannot delete posts, so think twice before posting bullshit."
                anchors.margins: 20
                anchors.top: logo.bottom
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: arrow.top
                horizontalAlignment: Label.AlignHCenter
                verticalAlignment: Label.AlignVCenter
                wrapMode: Label.Wrap
            }

            Image 
            {
                id: arrow
                source: "images/arrow.png"
                anchors.left: parent.left
                anchors.bottom: parent.bottom
            }
        }
        
    }

    Dialog 
    {
        id: settingsDialog
        x: Math.round((window.width - width) / 2)
        y: Math.round(window.height / 6)
        width: Math.round(Math.min(window.width, window.height) / 3 * 2)
        modal: true
        focus: true
        title: "Settings"

        standardButtons: Dialog.Ok | Dialog.Cancel
        onAccepted: 
        {
            settings.style = styleBox.displayText
            settingsDialog.close()
        }
        onRejected: {
            styleBox.currentIndex = styleBox.styleIndex
            settingsDialog.close()
        }

        contentItem: ColumnLayout 
        {
            id: settingsColumn
            spacing: 20

            RowLayout 
            {
                spacing: 10

                Label 
                {
                    text: "Style:"
                }

                ComboBox 
                {
                    id: styleBox
                    property int styleIndex: -1
                    model: availableStyles
                    Component.onCompleted: 
                    {
                        styleIndex = find(settings.style, Qt.MatchFixedString)
                        if (styleIndex !== -1)
                            currentIndex = styleIndex
                    }
                    Layout.fillWidth: true
                }
            }

            Label 
            {
                text: "Restart required"
                color: "#e41e25"
                opacity: styleBox.currentIndex !== styleBox.styleIndex ? 1.0 : 0.0
                horizontalAlignment: Label.AlignHCenter
                verticalAlignment: Label.AlignVCenter
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }
    }

    Dialog 
    {
        id: aboutDialog
        modal: true
        focus: true
        title: "About"
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
                text: "UBUCON connects us all, until everybody is able to use the innernet."
                wrapMode: Label.Wrap
                font.pixelSize: 12
            }

            Label 
            {
                width: aboutDialog.availableWidth
                text: "UBUCON is decentral and is not using a single server only."
                    + " UBUCON is anonymous, only your real friends you connect with know your account."
                    + " No registration needed."
                    + " No server means, also no censorship. No ads."
                    + " Post cannot be deleted, so don't write bullshit."
                wrapMode: Label.Wrap
                font.pixelSize: 12
            }
        }
    }
}
