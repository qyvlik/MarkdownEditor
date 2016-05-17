import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2

Dialog {
    id: inputDialog
    title: qsTr("插入链接")
    modality: Qt.WindowModal

    property bool __model: false            // for link or image

    contentItem: Item {
        implicitWidth: 360
        implicitHeight: 100
        GridLayout {
            anchors.fill: parent
            anchors.margins: 10
            columns: 2
            Item {
                Layout.columnSpan: 2
                Layout.fillHeight: true
                Layout.fillWidth: true
            }
            Text {
                text: qsTr("标题")
                Layout.fillWidth: true
                
            }
            TextField {
                id: linkTitle
                Layout.fillWidth: true
            }
            Text {
                text: qsTr("链接")
            }
            TextField {
                id: linkUrl
                Layout.fillWidth: true
            }
            Button {
                text: qsTr("插入")
                Layout.alignment: Qt.AlignLeft
                onClicked: {
                    if(__model) {
                        添加图片链接(editor, linkTitle.text, linkUrl.text);
                    } else {
                        添加链接(editor, linkTitle.text, linkUrl.text);
                    }

                    inputDialog.close();
                    linkTitle.text = "";
                    linkUrl.text = "";
                }
            }
            Button {
                text: qsTr("取消")
                Layout.alignment: Qt.AlignRight
                onClicked: {
                    close();
                }
            }
            Item {
                Layout.columnSpan: 2
                Layout.fillHeight: true
                Layout.fillWidth: true
            }
        }
    }

    function addLink() {
        __model = false;
        open();
    }

    function addImageLink() {
        __model = true;
        open();
    }

}
