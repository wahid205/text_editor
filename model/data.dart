import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class Data extends ChangeNotifier {
  dynamic text;
  Color color=Colors.red;
  Data({this.text});
  List<dynamic> quilData = [];
  List<dynamic> quilColor = [];
  add(dynamic data) {
    quilData.add(data);
    notifyListeners();
  }

  addColor(dynamic data) {
    quilColor.add(data);
    notifyListeners();
  }

  delete() {
    quilData.clear();
    notifyListeners();
  }

  write(quilData) async {
    final File file = File('lib/model/data.txt');
    await file.writeAsString(quilData);
  }
}
