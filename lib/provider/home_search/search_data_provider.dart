import 'package:flutter/cupertino.dart';
import 'package:qlts/data_sources/data_source_search/item_search_model.dart';

class SearchDataModel extends ChangeNotifier{
  var list = [];
  var errorDesc = '';
  var errorCode = '-1';
  var data = '';

  update(ItemSearchModel itemSearchModel, {String newData}){
    list = itemSearchModel.results;
    errorDesc = itemSearchModel.errorDesc;
    errorCode = itemSearchModel.errorCode;
    if(newData != null)
      data = newData;
    notifyListeners();
  }

  updateDataQrCode(String value){
    data = value ?? '';
    notifyListeners();
  }

  clear(){
    list.clear();
    errorCode = '-1';
    errorDesc = '';
    data = '';
    notifyListeners();
  }

  bool isEmpty(){
    if(list.length > 0 && errorDesc != '' && data != '' && errorCode != '-1') return false;
    return true;
  }
}