import QtQuick 2.0
import QtQuick.Window 2.0
import QtQuick.VirtualKeyboard 2.0
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4
import QtQml.Models 2.0

Item {
    ValueSource {
        id: valueSource
    }

    IndicatorModel {
        id:indicatorModel
    }

    Rectangle {
        id: dashboard
        anchors.centerIn: parent
        height: 800
        width: 1564
        color: "black";

        Row {
            id: indicatorRow
            spacing: dashboard.width * 0.02
            anchors.top: parent.top
            anchors.topMargin: dashboard.width * 0.02
            anchors.horizontalCenter: parent.horizontalCenter

            ArrowIndicator {
                id: leftindicator
                height: dashboard.height * 0.05
                width: height * 1.5
                direction: Qt.LeftArrow

            }
            Rectangle{
                height: dashboard.height * 0.05
                width: height
                color: "black"
                Image {
                    id: iconImageLight
                    anchors.fill: parent
                    source: "images/light.svg"
                    visible: false
                }
            }

            ArrowIndicator{
                id: rightIndicator
                height: dashboard.height * 0.05
                width: height * 1.5
                direction: Qt.RightArrow
            }

        }

        Row {
            id: dashboardRow
            spacing: dashboard.width * 0.02
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top : indicatorRow.bottom

            TextEdit {
                id: gear
            }

            CircularGauge {
                id: tempMeter
                anchors.bottom: parent.bottom
                width: height
                height: dashboard.height * 0.3
                value: valueSource.temperature
                maximumValue: 140
                minimumValue: 50

                style: TempGaugeStyle {}

            }

            CircularGauge {
                id: rpmMeter
                width: height
                height: dashboard.height * 0.6
                value: valueSource.rpm
                maximumValue: 8
                property bool acceleration: false
                style: RPMMeterStyle {}
                Component.onCompleted:  forceActiveFocus();
            }

            CircularGauge {
                id: speedometer
                value: valueSource.kph
                width: height
                height: dashboard.height * 0.6
                maximumValue: 200
                property bool acceleration: false
                style: SpeedometerStyle {}
                Component.onCompleted:  forceActiveFocus();
            }

            CircularGauge {
                id: fuelGauge
                anchors.bottom: parent.bottom
                width: height
                height: dashboard.height * 0.3
                value: valueSource.fuel
                maximumValue: 100

                style: FuelGaugeStyle {}

                onValueChanged: {
                    if (value < 20)
                    {
                        indicatorModel.setIconVisibilty("gasoline", true);
                    }
                    else
                    {
                        indicatorModel.setIconVisibilty("gasoline", false);
                    }
                }
            }
        }

        Rectangle {
            id: speedrect
            x: 967
            height: dashboard.height * 0.05;
            width: dashboard.width * 0.1
            color: "#327dc8"
            radius: height * 0.2

            anchors.right: parent.right
            anchors.top: dashboardRow.bottom
            anchors.rightMargin: 441
            anchors.topMargin: -26

            Text{
                x: 8
                y: 6
                width: 128
                height: 29
                text: "   5035 km"
                font.pointSize: 18
                color: "white"
            }
        }

        Rectangle{
            height: dashboard.height * 0.1
            width: height
            anchors.top: dashboardRow.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            color: "black"
            Image {
                id: iconOverspeed
                anchors.fill: parent
                source: "images/speed130.svg"
                visible: speedometer.value > 130
            }
        }
        DashboardIndicators {
            id: leftBottomrow

            iconModel: indicatorModel.leftIcons
            height: dashboard.height * 0.1
            anchors.top: dashboardRow.bottom
            anchors.leftMargin: 8
            anchors.topMargin: 60
            anchors.left: parent.left

        }

        DashboardIndicators {
            id: rightBottomrow
            x: 1188
            iconModel: indicatorModel.rightIcons
            height: dashboard.height * 0.1
            anchors.top: dashboardRow.bottom
            anchors.rightMargin: 8
            anchors.topMargin: 60
            anchors.right: parent.right

        }
        
        ToggleButton {
            id: toggleButton
            x: 1512
            y: 0
            width: 52
            height: 48
            text: qsTr("Quit")
            onClicked: close()
        }
        
        Keys.onLeftPressed: {
            leftindicator.on = true;
            rightIndicator.on = false;
        }

        Keys.onRightPressed: {
            rightIndicator.on = true;
            leftindicator.on = false;
        }
/*
        Keys.onUpPressed: {
            speedometer.acceleration = true
            rpmMeter.acceleration = true
        }

        Keys.onReleased: {
            if (event.key === Qt.Key_Up)
            {
                speedometer.acceleration = false;
                rpmMeter.acceleration = false;
                event.accepted = true;
            }
        }
*/
        Keys.onPressed: {
            if (event.key === Qt.Key_D)
            {
                indicatorModel.setIconVisibilty("windowDefrost", !indicatorModel.getIconVisibility("windowDefrost"));
            }
            else  if (event.key === Qt.Key_A)
            {
                indicatorModel.setIconVisibilty("acin", !indicatorModel.getIconVisibility("acin"));
            }
            else  if (event.key === Qt.Key_W)
            {
                indicatorModel.setIconVisibilty("wiper", !indicatorModel.getIconVisibility("wiper"));
            }
            else  if (event.key === Qt.Key_L)
            {
                iconImageLight.visible = !iconImageLight.visible
            }
            else  if (event.key === Qt.Key_Z)
            {
                indicatorModel.setIconVisibilty("battery", !indicatorModel.getIconVisibility("battery"));
            }
            else  if (event.key === Qt.Key_X)
            {
                indicatorModel.setIconVisibilty("settings", !indicatorModel.getIconVisibility("settings"));
            }
            else  if (event.key === Qt.Key_C)
            {
                indicatorModel.setIconVisibilty("enginefault", !indicatorModel.getIconVisibility("enginefault"));
            }
        }
    }
}




/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.5;height:480;width:640}
}
##^##*/
