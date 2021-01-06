import 'package:flutter/cupertino.dart';

class InventoryImageProvider extends ChangeNotifier{
  String imageBase64;

  update(String newImageBase64){
    imageBase64 = newImageBase64;
    notifyListeners();
  }

  clear(){
    imageBase64 = null;
    notifyListeners();
  }

  bool isEmpty() {
    if (imageBase64 != null) return false;
    return true;
  }
}