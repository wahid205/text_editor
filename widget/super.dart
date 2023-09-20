import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:text_editor/model/data.dart';
import 'package:text_editor/widget/colorpicker.dart';

class Editor extends StatefulWidget {
  @override
  _Editor createState() => _Editor();
}

class _Editor extends State<Editor> {
  late TextEditingController superEditorController;
  late TextEditingController mirroredTextController;

  @override
  Data data = Data();
  void initState() {
    super.initState();
    superEditorController = TextEditingController();
    mirroredTextController = TextEditingController();

    // Add a listener to the superEditorController
    superEditorController.addListener(() {
      final highlightedText = _getHighlightedText(
          superEditorController.text, superEditorController.selection);
      print(highlightedText);
      mirroredTextController.text = highlightedText;
    });
  }

  String _getHighlightedText(String text, TextSelection selection) {
    if (selection.baseOffset != selection.extentOffset) {
      return text.substring(selection.baseOffset, selection.extentOffset);
    } else {
      // return text.substring(selection.baseOffset, selection.extentOffset);
      return '';
    }
  }

  @override
  void dispose() {
    super.dispose();
    superEditorController.dispose();
    mirroredTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final classInstancee = Provider.of<Data>(context);
    
    TextStyle highlightedTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      color: classInstancee.color,
    );

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: superEditorController,
              maxLines: 5,
              decoration: const InputDecoration(
                labelText: 'Input Text',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 200,
              height: 40,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(166, 166, 232, 0.631),
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                onPressed: () {
                  setState(() {
                    classInstancee.add(mirroredTextController.text);
                    classInstancee.addColor(highlightedTextStyle.color);
                  });
                },
                child: const Text('Submit',
                    style: TextStyle(fontSize: 25, color: Colors.white)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 200,
              height: 40,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(166, 166, 232, 0.631),
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                onPressed: () {
                  setState(() {
                    classInstancee.delete();
                  });
                },
                child: const Text('Delete All',
                    style: TextStyle(fontSize: 25, color: Colors.white)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
