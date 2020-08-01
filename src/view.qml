import QtQuick 2.5
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.0
import QtMultimedia 5.4

ApplicationWindow 
{
    visible: true

    function init()
    {
        bridge.queryServer()
    }

    function message(text)
    {
        txt.text = text
    }

    Text 
    {
        id: txt
        anchors.centerIn: parent
        text: "UBUCON"
    }
}