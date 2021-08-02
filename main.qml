import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.VirtualKeyboard 2.0
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4

Window {
    id: root
    visible: true
    width: 1024
    height: 600
    color: "black"
    title: qsTr("Automobile Dashboard")


    Loader {
        id: centralPanelLoader
        anchors.centerIn: parent
        DashboardSimulator{}
    }

}


