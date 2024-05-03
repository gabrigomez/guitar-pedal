import QtQuick

Window {
  minimumWidth: 300
  minimumHeight: 420
  maximumWidth: minimumWidth
  maximumHeight: minimumHeight
  visible: true
  title: qsTr("Guitar Pedal")

  color: "white"

  Item {
    height: 420
    width: 300

    anchors {
      verticalCenter: parent.verticalCenter
      horizontalCenter: parent.horizontalCenter
    }

    Image {
      source: "assets/Guitar-Pedal-Background.png"
      anchors.fill: parent
    }

    Item {
      anchors.fill: parent
      anchors.leftMargin: 15
      anchors.rightMargin: 15
      anchors.topMargin: 17
      anchors.bottomMargin: 17

      Image {
        source: "assets/Screw.png"
        anchors.left: parent.left
        anchors.top: parent.top
      }

      Image {
        source: "assets/Screw.png"
        anchors.right: parent.right
        anchors.top: parent.top
      }

      Image {
        source: "assets/Screw.png"
        anchors.left: parent.left
        anchors.bottom: parent.bottom
      }

      Image {
        source: "assets/Screw.png"
        anchors.right: parent.right
        anchors.bottom: parent.bottom
      }
    }
  }
}
