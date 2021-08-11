import QtQuick 2.2
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4

CircularGaugeStyle {
    id: rpmMeterStyle
    tickmarkStepSize: 0.5
    labelStepSize: 1


    tickmark: Rectangle {
        implicitWidth: outerRadius * 0.02
        antialiasing: true
        implicitHeight: outerRadius * 0.06
        color: styleData.index === 13 || styleData.index === 14 || styleData.index === 15 || styleData.index === 16 ? "#e34c22" : "#c8c8c8"
    }

    minorTickmark: Rectangle {
        implicitWidth: outerRadius * 0.01
        antialiasing: true
        implicitHeight: outerRadius * 0.02
        color: styleData.index === 63 || styleData.index === 62 || styleData.index === 61
               || styleData.index === 60 || styleData.index === 59 || styleData.index === 58
               || styleData.index === 57 || styleData.index === 56 || styleData.index === 55
               || styleData.index === 54 || styleData.index === 53 || styleData.index === 52 ? "#e34c22" : "#c8c8c8"
    }

    tickmarkLabel: Text {
        font.pixelSize: outerRadius * 0.12
        text: styleData.value
        color: styleData.index === 7 || styleData.index === 8 ? "#e34c22" : "#c8c8c8"
        antialiasing: true
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

    background: Canvas {
        onPaint: {
            var ctx = getContext("2d");
            ctx.reset();


            ctx.beginPath();
            ctx.lineWidth = outerRadius * 0.02;
            ctx.strokeStyle = Qt.rgba(0.5, 0, 0, 1);
            var warningCircumference = maximumValueAngle - minimumValueAngle * 0.1;
            var startAngle = maximumValueAngle - 90;
            ctx.stroke();
        }
        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.verticalCenter
            anchors.topMargin: outerRadius * 0.2

            Text {
                id: rpmText
                font.pixelSize: outerRadius * 0.1
                text: rpmInt
                color: "white"
                horizontalAlignment: Text.AlignRight
                readonly property int rpmInt: valueSource.rpm*1000
            }
            Text {
                text: " RPM"
                color: "white"
                font.pixelSize: outerRadius * 0.1
            }
        }

        Text {
            text: "x1000"
            color: "white"
            font.pixelSize: outerRadius * 0.1
            anchors.top: parent.top
            anchors.topMargin: parent.height / 4
            anchors.horizontalCenter: parent.horizontalCenter
        }

    }
}
