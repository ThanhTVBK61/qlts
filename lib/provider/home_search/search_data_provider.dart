import 'package:flutter/cupertino.dart';
import 'package:qlts/data_sources/data_source_search/item_search_model.dart';

class SearchDataModel extends ChangeNotifier{
  var list = [];
  var errorDesc = '';
  var errorCode = '200';
  var data = '';

  update(ItemSearchModel itemSearchModel, {String newData}){
    list = itemSearchModel.results;
    errorDesc = itemSearchModel.errorDesc;
    errorCode = itemSearchModel.errorCode;
    data = newData;
    notifyListeners();
  }

  clear(){
    list.clear();
    errorCode = '200';
    errorDesc = '';
    data = '';
    notifyListeners();
  }
}