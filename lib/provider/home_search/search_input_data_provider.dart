import 'package:flutter/cupertino.dart';
import 'package:qlts/data_sources/data_source_search/item_search_model.dart';

class SearchInputDataModel extends ChangeNotifier{
  var list = [];
  var errorDesc = '';
  var errorCode = '200';

  update(ItemSearchModel itemSearchModel){
    list = itemSearchModel.results;
    errorDesc = itemSearchModel.errorDesc;
    errorCode = itemSearchModel.errorCode;
    notifyListeners();
  }

  clear(){
    list.clear();
    errorCode = '200';
    errorDesc = '';
    notifyListeners();
  }
}