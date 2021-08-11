import QtQuick 2.0
import QtGraphicalEffects 1.0
import QtQml.Models 2.15

Rectangle {
    id: container
    color: "black"

    Rectangle {
        id: appWindow
        x: 7
        y: 44
        color: "#000000"
        width: 178
        height: 137
        Image {
            id: appWindowImage
            anchors.verticalCenter: parent.verticalCenter
            x: (parent.width - 250) / 2 - width /2
            fillMode: Image.PreserveAspectFit
            scale: 1.2
        }
    }


    Image {
        id: hoverIcon
        x: 34//
        y: 27
        width: 127
        height: 128
        source: "/images/Tile.png"
    }


    property int pathMargin: 470
    y: 1
    width: 192
    height: 225

        PathView {
         id: menu
         x: -1
         y: 84
         width: 193
         height: 56

         model: LElementsModel {}
         delegate: Rectangle {height: 150; width: height; color:"transparent"
                    Image {source: isource; fillMode: Image.PreserveAspectFit; anchors.horizontalCenter: parent.horizontalCenter;}
                    Text {id:desc; text: name;
                        anchors.horizontalCenter: parent.horizontalCenter; y: 88;
                        font.pixelSize: 18; font.family: "Eurostile"; font.bold: true; color: "black";
                    }
         }


         path: Path {
             startX: 103
             startY: 24

             PathCubic {
                 x: 73
                 y: -2655
                 control2X: 89.11
                 control2Y: -1579.81
                 control1Y: -916.1
                 control1X: 96.3
             }

          //pathMargin
         }

         //focus: false
         //Keys.onDownPressed: decrementCurrentIndex()
         //Keys.onUpPressed: incrementCurrentIndex()
         Keys.onDownPressed: {
             decrementCurrentIndex()
         }
         Keys.onUpPressed: {
             incrementCurrentIndex()
         }
         Keys.onReturnPressed: if(menu.opacity == 1) {selectApp(menu.currentIndex)} else {hideApp()}
    }

        function selectApp(ind) {
            switch(ind) {
                case 1: appWindowImage.source ="/images/Efficiency.png"; appWindowImage.scale = 1.2;
                    showApp()
                    break;

                case 2: appWindowImage.source = "/images/Music.png"; appWindowImage.scale = 1.4;
                    showApp()
                    break;

                case 0: appWindowImage.source = "/images/Range.png"; appWindowImage.scale = 1.2;
                    showApp()
                    break;

                case 6: appWindowImage.source = "/images/Numbers.png"; appWindowImage.scale = 1.2;
                   showApp()
                    break;

                default:
                    break;
            }
        }

        function showApp() {
            animateOpacity.start()
            animateHover.start()
            appWindow.opacity = 1
            animateWindow.start()
        }

        function hideApp() {
            deanimateOpacity.start()
            deanimateHover.start()
            deanimateWindow.start()
        }

        NumberAnimation {
               id: animateOpacity; target: menu; properties: "opacity"; from: 1.00; to: 0.0; duration: 50
          }
        NumberAnimation {
               id: deanimateOpacity; target: menu; properties: "opacity"; from: 0.0; to: 1.0; duration: 500
          }
        NumberAnimation {
               id: animateHover; target: hoverIcon; properties: "opacity"; from: 1.00; to: 0.0; duration: 50
          }
        NumberAnimation {
               id: deanimateHover; target: hoverIcon; properties: "opacity"; from: 0.0; to: 1.0; duration: 500
          }
        NumberAnimation {
               id: animateWindow; target: appWindow; properties: "y"; from: parent.height; to: 0.0; duration: 1000; easing.type: Easing.OutExpo
          }
        NumberAnimation {
               id: deanimateWindow; target: appWindow; properties: "opacity"; from: 1.00; to: 0.0; duration: 500
          }
}


/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
