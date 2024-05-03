import QtQuick

Window {
  id: root
  minimumWidth: 300
  minimumHeight: 420
  maximumWidth: minimumWidth
  maximumHeight: minimumHeight
  visible: true
  title: qsTr("Guitar Pedal")

  color: "white"

  FontLoader {
    id: russoFontLoader
    source: "fonts/RussoOne-Regular.ttf"
  }

  FontLoader {
    id: prismaFontLoader
    source: "fonts/Prisma.ttf"
  }

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

    component DeviceText: Text {
      property int fontSize: 20

      color: "#191919"
      font.family: russoFontLoader.font.family
      font.weight: russoFontLoader.font.weight
      font.pixelSize: fontSize
    }

    Item {
      anchors.fill: parent
      anchors.leftMargin: 15
      anchors.rightMargin: 15
      anchors.topMargin: 17
      anchors.bottomMargin: 17

      component ScrewImage: Image {
        source: "assets/Screw.png"
      }

      ScrewImage {
        anchors.left: parent.left
        anchors.top: parent.top
      }

      ScrewImage {
        anchors.right: parent.right
        anchors.top: parent.top
      }

      ScrewImage {
        anchors.left: parent.left
        anchors.bottom: parent.bottom
      }

      ScrewImage {
        anchors.right: parent.right
        anchors.bottom: parent.bottom
      }

      component InfoText: Column {
        id: infoLabel
        spacing: 6

        property alias text: label.text
        property alias font: label.font
        property alias fontSize: label.fontSize
        property int lineWidth: 200
        property int lineHeight: 2

        property color lineColor: "black"

        Rectangle {
          width: infoLabel.lineWidth
          height: infoLabel.lineHeight
          color: infoLabel.lineColor
        }

        DeviceText {
          id: label
          text: "Time Killer"
          anchors.horizontalCenter: parent.horizontalCenter
        }

        Rectangle {
          width: infoLabel.lineWidth
          height: infoLabel.lineHeight
          color: infoLabel.lineColor
        }
      }

      InfoText {
        text: "Time Killer"
        spacing: 10
        anchors {
          top: parent.verticalCenter
          topMargin: 20
          horizontalCenter: parent.horizontalCenter
        }
      }

      InfoText {
        text: "Input"
        spacing: 4
        lineWidth: 40
        fontSize: 10

        anchors {
          top: parent.top
          topMargin: 20
          right: parent.right
        }
      }

      InfoText {
        text: "Output"
        spacing: 4
        lineWidth: 40
        fontSize: 10

        anchors {
          top: parent.top
          topMargin: 20
          left: parent.left
        }
      }
    }
  }
}
