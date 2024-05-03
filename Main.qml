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

    component SwitchImage: Image {
      required property string sourceBaseName
      property bool checked

      source: `assets/${sourceBaseName}${checked ? "-Checked" : ""}.png`
    }

    component DeviceSwitch: SwitchImage {
      property alias tapMargin: tapHandler.margin

      TapHandler {
        id: tapHandler
        onTapped: parent.checked = !parent.checked
      }
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

      SwitchImage {
        x: parent.width * 0.33 - width / 2
        y: 14
        sourceBaseName: "LED"
        checked: footSwitch.checked

        DeviceText {
          text: qsTr("ON")
          fontSize: 12
          anchors {
            top: parent.bottom
            topMargin: 2
            horizontalCenter: parent.horizontalCenter
          }
        }
      }

      DeviceSwitch {
        x: parent.width * 0.66
        y: 14
        sourceBaseName: "Switch"
        tapMargin: 16

        DeviceText {
          text: "MODE"
          fontSize: 12
          anchors {
            top: parent.bottom
            topMargin: 4
            horizontalCenter: parent.horizontalCenter
          }
        }
      }

      DeviceSwitch {
        id: footSwitch
        sourceBaseName: "Button-Pedal"
        anchors {
          bottom: parent.bottom
          bottomMargin: 17
          horizontalCenter: parent.horizontalCenter
        }
      }
    }
  }
}
