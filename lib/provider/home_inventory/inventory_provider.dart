import 'package:flutter/cupertino.dart';
import 'package:qlts/data_sources/data_source_inventory/inventory_model.dart';

class InventoryData extends ChangeNotifier{
  var list = [];
  var currentId = -1;
  //Vị trí của đợt kiểm kê hiện tại
  var currentIndex = -1;
  var online = true;
  var changeStatusOnline = false;

  var emptySqflite = true;

  update(InventoryModel inventoryModel){
    list = inventoryModel.listInventoryRound;
    notifyListeners();
  }

  updateIndex(int index){
    currentId = list[index].id;
    currentIndex = index;
    notifyListeners();
  }

  updateOnlineState(bool newState){
    online = newState;
    changeStatusOnline = true;
    notifyListeners();
  }

  updateChangeStatus(){
    changeStatusOnline = false;
    notifyListeners();
  }

  clear(){
    list.clear();
    currentId = -1;
    currentIndex = -1;
    online = true;
    changeStatusOnline = false;
    notifyListeners();
  }

}