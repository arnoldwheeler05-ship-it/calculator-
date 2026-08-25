import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

ApplicationWindow {
    id: window
    width: 450
    height: 700
    visible: true
    title: "Calculator"

    property string displayText: "0"
    property double firstNumber: 0
    property string operatorSymbol: ""
    property bool newNumber: true

    function numberPressed(number) {
        if (newNumber || displayText === "0" || displayText === "Error") {
            displayText = number
            newNumber = false
        } else {
            displayText += number
        }
    }

    function operatorPressed(op) {
        firstNumber = Number(displayText)
        operatorSymbol = op
        newNumber = true
    }

    function calculate() {
        if (operatorSymbol === "")
            return

        var secondNumber = Number(displayText)
        var result

        if (operatorSymbol === "+")
            result = firstNumber + secondNumber
        else if (operatorSymbol === "-")
            result = firstNumber - secondNumber
        else if (operatorSymbol === "*")
            result = firstNumber * secondNumber
        else if (operatorSymbol === "/") {
            if (secondNumber === 0) {
                displayText = "Error"
                newNumber = true
                operatorSymbol = ""
                return
            }
            result = firstNumber / secondNumber
        }

        displayText = String(result)
        newNumber = true
        operatorSymbol = ""
    }

    Rectangle {
        anchors.fill: parent
        color: "#202124"

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 20
            spacing: 15

            // DISPLAY SCREEN
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 150

                color: "white"
                radius: 15

                border.color: "#888888"
                border.width: 2

                Text {
                    anchors.fill: parent
                    anchors.margins: 20

                    text: displayText
                    color: "black"

                    // BIG DISPLAY NUMBERS
                    font.pixelSize: 65
                    font.bold: true

                    horizontalAlignment: Text.AlignRight
                    verticalAlignment: Text.AlignVCenter

                    elide: Text.ElideLeft
                }
            }

            // BUTTONS
            GridLayout {
                Layout.fillWidth: true
                Layout.fillHeight: true

                columns: 4
                rowSpacing: 12
                columnSpacing: 12

                Button {
                    text: "C"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    font.pixelSize: 28
                    font.bold: true

                    onClicked: {
                        displayText = "0"
                        firstNumber = 0
                        operatorSymbol = ""
                        newNumber = true
                    }
                }

                Button {
                    text: "⌫"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    font.pixelSize: 28

                    onClicked: {
                        if (displayText.length > 1)
                            displayText = displayText.slice(0, -1)
                        else
                            displayText = "0"
                    }
                }

                Button {
                    text: "±"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    font.pixelSize: 28

                    onClicked: {
                        displayText = String(-Number(displayText))
                    }
                }

                Button {
                    text: "÷"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    font.pixelSize: 32
                    font.bold: true

                    onClicked: operatorPressed("/")
                }

                Button {
                    text: "7"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    font.pixelSize: 32
                    font.bold: true
                    onClicked: numberPressed("7")
                }

                Button {
                    text: "8"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    font.pixelSize: 32
                    font.bold: true
                    onClicked: numberPressed("8")
                }

                Button {
                    text: "9"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    font.pixelSize: 32
                    font.bold: true
                    onClicked: numberPressed("9")
                }

                Button {
                    text: "×"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    font.pixelSize: 32
                    font.bold: true
                    onClicked: operatorPressed("*")
                }

                Button {
                    text: "4"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    font.pixelSize: 32
                    font.bold: true
                    onClicked: numberPressed("4")
                }

                Button {
                    text: "5"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    font.pixelSize: 32
                    font.bold: true
                    onClicked: numberPressed("5")
                }

                Button {
                    text: "6"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    font.pixelSize: 32
                    font.bold: true
                    onClicked: numberPressed("6")
                }

                Button {
                    text: "-"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    font.pixelSize: 32
                    font.bold: true
                    onClicked: operatorPressed("-")
                }

                Button {
                    text: "1"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    font.pixelSize: 32
                    font.bold: true
                    onClicked: numberPressed("1")
                }

                Button {
                    text: "2"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    font.pixelSize: 32
                    font.bold: true
                    onClicked: numberPressed("2")
                }

                Button {
                    text: "3"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    font.pixelSize: 32
                    font.bold: true
                    onClicked: numberPressed("3")
                }

                Button {
                    text: "+"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    font.pixelSize: 32
                    font.bold: true
                    onClicked: operatorPressed("+")
                }

                Button {
                    text: "0"
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    font.pixelSize: 32
                    font.bold: true
                    onClicked: numberPressed("0")
                }

                Button {
                    text: "."
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    font.pixelSize: 32
                    font.bold: true

                    onClicked: {
                        if (newNumber) {
                            displayText = "0."
                            newNumber = false
                        } else if (!displayText.includes(".")) {
                            displayText += "."
                        }
                    }
                }

                Button {
                    text: "="

                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.columnSpan: 2

                    font.pixelSize: 35
                    font.bold: true

                    onClicked: calculate()
                }
            }
        }
    }
}