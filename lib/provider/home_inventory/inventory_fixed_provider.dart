import 'package:flutter/cupertino.dart';
import 'package:qlts/data_sources/data_source_inventory/inventory_fixed_model.dart';

class InventoryFixedDataProvider extends ChangeNotifier {
  var listInventoryFixed = [];
  var currentId = -1;

  //Vị trí của đợt kiểm kê hiện tại
  var currentIndex = -1;

  update(InventoryFixedModel inventoryFixedModel) {
    listInventoryFixed = inventoryFixedModel.listInventoryFixed;
    notifyListeners();
  }

  updateId(int index) {
    currentId = listInventoryFixed[index].id;
    currentIndex = index;
    notifyListeners();
  }

  clear() {
    listInventoryFixed.clear();
    currentId = -1;
    currentIndex = -1;
    notifyListeners();
  }
}
