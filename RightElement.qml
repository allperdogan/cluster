import QtQuick 2.0
import QtGraphicalEffects 1.0

Rectangle {
    id: container
    color: "black"

    property int seconds
    property int tenseconds
    property int minutes
    width: 196
    height: 430

    Image {
        anchors.verticalCenter: parent.verticalCenter
        x: (parent.width - 250) - width/2
        fillMode: Image.PreserveAspectFit
        scale: 1.15
        source: "/images/call.png"

        Text {
            id:callTime
            y: 165; x: 128
            font.family: "Eurostile"; color: "white"; font.pixelSize: 13
            text: minutes + ":" + tenseconds + seconds
        }
    }

    Timer {
        //update Calltime, calculate 60 seconds into 1 minute etc.
           interval: 1000; running: true; repeat: true
           onTriggered: {seconds++;

           if(seconds == 10){
               tenseconds += 1
               seconds = 0
           }
           if(seconds == 0 && tenseconds==6){
               minutes += 1
               seconds = 0
               tenseconds = 0
           }
           }
       }
}
