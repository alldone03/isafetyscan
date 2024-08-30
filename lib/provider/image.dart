import 'package:flutter/material.dart';

class ImgProvider with ChangeNotifier {
  String _pickedImage = "";

  // int get count => _count;
  String get pickedImage => _pickedImage;

  void insert(String file) {
    _pickedImage = file;
    // print(_pickedImage);
    notifyListeners();
  }

  // void decrement() {
  //   _count--;
  //   notifyListeners();
  // }
}
