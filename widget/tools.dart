import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Tools extends StatefulWidget {
  const Tools({super.key});

  @override
  State<Tools> createState() => _ToolsState();
}

class _ToolsState extends State<Tools> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
               const Text(
            'Editor',
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Row(children:   [
            IconButton(onPressed: (){}, icon: const Icon(Icons.add)),
          const  Text(
            'Add Color',
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),)
          ],)
            ],),
    ),);
  }
}