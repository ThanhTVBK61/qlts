import 'package:flutter/cupertino.dart';
import 'package:qlts/data_sources/data_source_inventory/inventory_model.dart';

class InventoryData extends ChangeNotifier{
  var list = [];
  var errorDesc = '';
  var errorCode = '200';
  var currentId = -1;
  //Vị trí của đợt kiểm kê hiện tại
  var currentIndex = -1;

  update(InventoryModel inventoryModel){
    list = inventoryModel.listInventory;
    errorDesc = inventoryModel.errorDesc;
    errorCode = inventoryModel.errorCode;
    notifyListeners();
  }

  updateId(int index){
    currentId = list[index].id;
    currentIndex = index;
    notifyListeners();
  }

  clear(){
    list.clear();
    errorCode = '200';
    errorDesc = '';
    currentId = -1;
    currentIndex = -1;
    notifyListeners();
  }
}