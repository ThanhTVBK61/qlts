import 'package:flutter/material.dart';
import 'package:qlts/data_sources/data_source_inventory/inventory_detail_model.dart';

class InventoryDetailData extends ChangeNotifier {
  var soThe = '';
  var idChiTiet = '';
  var maNhomThuocTinh = '';
  var idChiTietQLTS = -1;
  var data = '';
  var listInventoryDetail = [];

  ///offline
  dynamic inventoryOffline;

  update(InventoryDetailModel inventoryDetailModel, {String value}) {
    listInventoryDetail = inventoryDetailModel.listInventoryDetail;
    soThe = inventoryDetailModel.soThe;
    idChiTiet = inventoryDetailModel.idChiTiet;
    maNhomThuocTinh = inventoryDetailModel.maNhomThuocTinh;
    idChiTietQLTS = inventoryDetailModel.idChiTietQLTS;
    if (value != null) {
      data = value;
    }
    notifyListeners();
  }

  updataDataQrcode(String value){
    data = value ??'';
    notifyListeners();
  }

  String dataUpdate() {
    StringBuffer data = StringBuffer('[');
    for (int i = 0; i < listInventoryDetail.length; i++) {
      data.write(listInventoryDetail[i].toString());
      if (i != (listInventoryDetail.length - 1)) {
        data.write(',');
      } else {
        data.write(']');
      }
    }
    print('---------DataUpdate----------\n$data');
    return data.toString();
  }

  updateItem(int index, dynamic giaTri) {
    listInventoryDetail[index].giaTri = giaTri;
    notifyListeners();
  }

  updateInventoryOffline(dynamic data){
    inventoryOffline = data;
    notifyListeners();
  }

  clear() {
    inventoryOffline = null;
    listInventoryDetail.clear();
    soThe = '';
    idChiTiet = '';
    maNhomThuocTinh = '';
    idChiTietQLTS = -1;
    data = '';
    notifyListeners();
  }
}
