import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

import '../model/data.dart';

class ColorChoice extends StatefulWidget {
  const ColorChoice({super.key});

  @override
  State<ColorChoice> createState() => _ColorChoiceState();
}

class _ColorChoiceState extends State<ColorChoice> {
  
  Color pickerColor = const Color(0xff443a49);
  Color currentColor = const Color(0xff443a49);
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  @override
  Widget build(BuildContext context) {
    final classInstancee = Provider.of<Data>(context);
    return Scaffold(
        body: Container(
      color: classInstancee.color, //background color of app from color picker
      alignment: Alignment.center,
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Pick a color!'),
                    content: SingleChildScrollView(
                        child: MaterialPicker(
                      onColorChanged: changeColor,
                      pickerColor: classInstancee.color,
                    )),
                    actions: <Widget>[
                      ElevatedButton(
                        child: const Text('DONE'),
                        onPressed: () {
                          setState(() {
                            classInstancee.color = pickerColor;
                          });
                          Navigator.of(context)
                              .pop();
                              Navigator.of(context)
                              .pop();  //dismiss the color picker
                        },
                      ),
                    ],
                  );
                });
          },
          child: null,
        ),
      ]),
    ));
  }
}
class Colorpick extends StatefulWidget {
  const Colorpick({super.key});

  @override
  State<Colorpick> createState() => _ColorpickState();
}

class _ColorpickState extends State<Colorpick> {
  @override
  Widget build(BuildContext context) {
    return const ColorChoice();
  }
}