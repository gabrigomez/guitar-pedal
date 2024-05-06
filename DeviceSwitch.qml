import QtQuick

Switch {
  property alias tapMargin: tapHandler.margin

  TapHandler {
    id: tapHandler
    onTapped: parent.checked = !parent.checked
  }
}
