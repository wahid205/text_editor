import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_editor/model/data.dart';
import 'package:text_editor/view/mainPge.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => Data(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}
