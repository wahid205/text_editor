import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:text_editor/view/try.dart';
import 'package:text_editor/widget/colorpicker.dart';

import '../model/data.dart';

class Orders extends StatefulWidget {
  const Orders({
    super.key,
  });

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    final classInstancee = Provider.of<Data>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SizedBox(
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      child: Container(
                          width: double.maxFinite,
                          height: 350,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: ListView.builder(
                              itemCount: classInstancee.quilData.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: 100,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                    child: Text(
                                      '${classInstancee.quilData[index]}',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: classInstancee.quilColor[index],
                                      ),
                                    ),
                                  ),
                                );
                              })),
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.add)),
                        const Text(
                          'Type or Paste Text On The Left Side Of The Editor ',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
      
                                          
                            },
                            icon: const Icon(Icons.color_lens_rounded)),
                        const Text(
                          'Add Color and Tag ',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.lightbulb)),
                        const Text(
                          'Select text and double click boom, ypu are taking your first note  ',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
