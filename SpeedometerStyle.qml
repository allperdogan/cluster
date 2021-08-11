import QtQuick 2.0
import QtQuick.Controls.Styles 1.4

CircularGaugeStyle
{
    id: speedometerStyle
    labelStepSize: 20
    tickmarkStepSize: 10
    function degree2Rad(deg)
    {
        return deg * (Math.PI / 180);
    }

    background: Canvas {
        onPaint: {
            var ctr = getContext("2d");
            ctr.reset();
            ctr.beginPath();

            ctr.strokeStyle = "red";
            ctr.linewidth = outerRadius * 0.02;

            ctr.arc(outerRadius, outerRadius, outerRadius - ctr.lineWidth / 2,
                    degree2Rad(valueToAngle(130) - 90), degree2Rad(valueToAngle(240) - 90))
            ctr.stroke();
        }

        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.verticalCenter
            anchors.topMargin: outerRadius * 0.2

            Text {
                id : speedText
                color: "white"
                font.pixelSize: outerRadius * 0.1
                horizontalAlignment: Text.AlignRight
                text:kphValue
                readonly property int  kphValue: speedometer.value

            }
            Text {
                id: unitSpeed
                text: " Km/h"
                color: "white"
                font.pixelSize: outerRadius * 0.1

            }
        }
        Text {
            id: gearText
            color: "white"
            text: gear
            font.pixelSize: outerRadius * 0.1
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.verticalCenter
            anchors.topMargin: outerRadius * 0.4


            readonly property string gear: valueSource.gear

        }
    }

    tickmark: Rectangle {
        visible: styleData.value < 130 || styleData.value % 5 == 0
        implicitWidth: outerRadius * 0.02
        antialiasing: true
        implicitHeight: outerRadius * 0.06
        color: styleData.value >= 130 ? "#e34c22" : "#e5e5e5"
    }

    foreground: Item {
        Rectangle{
            width: outerRadius * 0.2
            height: width
            radius: width /2
            color: "#003366"
            anchors.centerIn: parent
        }
    }
}
