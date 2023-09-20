import 'package:flutter/material.dart';

import 'package:text_editor/widget/rightside.dart';
import 'package:text_editor/widget/tools.dart';

import '../widget/super.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: const Color.fromRGBO(166, 166, 232, 0.631),
      appBar: AppBar(
        title: const Text(
          'Editor',
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromRGBO(166, 166, 232, 0.631),
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        children: [
          
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                shape: BoxShape.rectangle,
                color: Colors.white),
            child:  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Editor(),
            ),
          ),
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                shape: BoxShape.rectangle,
                color: Colors.white),
            child:  const Padding(
              padding: EdgeInsets.all(8.0),
              child: Orders(),
            ),
          ),
        ],
      ),
    );
  }
}
