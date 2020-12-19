import 'package:flutter/material.dart';
import 'package:qlts/data_sources/data_source_inventory/inventory_detail_model.dart';

class InventoryDetailData extends ChangeNotifier{
  var errorCode = '200';
  var errorDesc = '';
  var soThe = '';
  var idChiTiet = '';
  var maNhomThuocTinh = '';
  var listInventoryDetail = [];

  update(InventoryDetailModel inventoryDetailModel){
    listInventoryDetail = inventoryDetailModel.listInventoryDetail;
    errorDesc = inventoryDetailModel.errorDesc;
    errorCode = inventoryDetailModel.errorCode;
    soThe = inventoryDetailModel.soThe;
    idChiTiet = inventoryDetailModel.idChiTiet;
    maNhomThuocTinh = inventoryDetailModel.maNhomThuocTinh;
    notifyListeners();
  }

  clearList(){
    listInventoryDetail.clear();
    notifyListeners();
  }

  clear(){
    listInventoryDetail.clear();
    errorCode = '200';
    errorDesc = '';
    soThe = '';
    idChiTiet = '';
    maNhomThuocTinh = '';
    notifyListeners();
  }
}