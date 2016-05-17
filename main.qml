import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1
import QtQuick.Dialogs 1.2

// import "./markdonwconverter.js" as Converter

import org.gdpurjyfs.markdown 1.0

Window {
    visible: true
    width: 1280
    height: 600
    title: qsTr("MarkDownEdit")

    HoedownMarkdownConverter {
        id: converter
    }

    ColumnLayout {
        anchors.fill: parent

        Rectangle {
            Layout.fillWidth: true
            height: 60
            color: "#ccc"

            RowLayout {
                anchors.fill: parent
                Button {
                    text: qsTr("加粗")
                    onClicked:{
                        加粗(editor);
                    }
                }

                Button {
                    text: qsTr("斜体")
                    onClicked:{
                        斜体(editor);
                    }
                }

                Button {
                    text: qsTr("链接")
                    onClicked: {
                        inputDialog.addLink();
                    }
                }

                Button {
                    text: qsTr("图片")
                    onClicked: {
                        inputDialog.addImageLink();
                    }
                }

                Button {
                    text: qsTr("关于")
                    onClicked: {
                        aobut.open();
                    }
                }

                Button {
                    text: qsTr("get rich text")
                    onClicked: {
                        console.log(review.text)
                    }
                }

            }
        }

        SplitView {
            Layout.fillHeight: true
            Layout.fillWidth: true
            orientation: Qt.Horizontal

            TextArea {
                id: editor
                Layout.fillHeight: true
                //                Layout.fillWidth: true
                width: parent.width * 0.5
                selectByMouse: true
                font.pixelSize: 20
                wrapMode: TextEdit.WrapAtWordBoundaryOrAnywhere
                onTextChanged: {
                    //review.text = Converter.markdown2html(editor.text)
                    if(editor.text != "") {
                        //review.textFormat = Text.PlainText;
                        review.text =
                                // css +
                                converter.markdown2html(editor.text);
//                        lazyer.lazyDo(100, function(){
//                            review.textFormat = Text.RichText;
////                            lazyer.lazyDo(5000, function(){
////                                review.textFormat = Text.PlainText;
////                            });
//                        });
                    }
                }
            }
            TextArea {
                id: review
                Layout.fillHeight: true
                width: parent.width * 0.5
                // selectByMouse: true
                // font.pixelSize: 20
                textFormat: TextEdit.RichText
                wrapMode: TextEdit.WrapAtWordBoundaryOrAnywhere
                onLinkActivated: {
                    Qt.openUrlExternally(link);
                }
            }
        }
    }

    Timer {
        id: lazyer
        property var __callable
        interval: 100
        repeat: false
        onTriggered: {
            __callable();
        }
        function lazyDo(time, callable) {
            interval = time;
            __callable = callable;
            start();
        }
    }

    function 添加链接(textEdit, linkTitle, linkUrl){
        var markdownLink = "["+linkTitle+"]"
                +"("+linkUrl+")";
        textEdit.insert(textEdit.cursorPosition, markdownLink);
    }

    function 添加图片链接(textEdit, linkTitle, linkUrl){
        var markdownLink = "!["+linkTitle+"]"
                +"("+linkUrl+")";
        textEdit.insert(textEdit.cursorPosition, markdownLink);
    }

    function 斜体(textEdit) {
        addMarkdownBlock(textEdit, "*");

    }

    function 加粗(textEdit) {
        addMarkdownBlock(textEdit, "**");
    }

    function addMarkdownBlock(textEdit, addText) {
        var selectionStart = textEdit.selectionStart;
        var selectionEnd = textEdit.selectionEnd;
        var smallPos = Math.min(selectionStart, selectionEnd);
        var bigPos = Math.max(selectionStart, selectionEnd) + addText.length;
        textEdit.insert(smallPos, addText);
        textEdit.insert(bigPos, addText);
        textEdit.deselect();
        textEdit.cursorPosition = bigPos + addText.length;
    }

    InputLinkDialog {
        id: inputDialog
    }

    MessageDialog {
        id: aobut
        text: "使用Markdown.Converter.js作为 `html2markdow` 的函数核心"
    }
}
