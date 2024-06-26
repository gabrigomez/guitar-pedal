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

    Item {
      anchors.fill: parent
      anchors.leftMargin: 15
      anchors.rightMargin: 15
      anchors.topMargin: 17
      anchors.bottomMargin: 17

      Screw {
        anchors.left: parent.left
        anchors.top: parent.top
      }

      Screw {
        anchors.right: parent.right
        anchors.top: parent.top
      }

      Screw {
        anchors.left: parent.left
        anchors.bottom: parent.bottom
      }

      Screw {
        anchors.right: parent.right
        anchors.bottom: parent.bottom
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
          topMargin: 40
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
          topMargin: 40
          left: parent.left
        }
      }

      Switch {
        x: parent.width * 0.33 - width / 2
        y: 2
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
        y: 2
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
          right: parent.right
          left: parent.left
          bottomMargin: 17
          leftMargin: 10
          rightMargin: 10
        }
      }

      DeviceKnob {
        anchors.horizontalCenter: parent.horizontalCenter
        y: 30
        text: "LEVEL"
      }

      DeviceKnob {
        anchors.left: footSwitch.left
        y: 100
        text: "TIME"
      }

      DeviceKnob {
        anchors.right: footSwitch.right
        y: 100
        text: "FEEDBACK"
      }
    }
  }
}
