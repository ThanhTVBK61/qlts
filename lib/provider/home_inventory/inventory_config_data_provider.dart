import 'package:flutter/cupertino.dart';
import 'package:qlts/data_sources/data_source_inventory/inventory_data_config_model.dart';

class InventoryConfigData extends ChangeNotifier {
  var _listDataVariantConfig = [];
  var _listDataStatusConfig = [];
  var _currentStatus = -1;

  update(InventoryDataConfigModel inventoryDataConfigModel) {
    _listDataVariantConfig = inventoryDataConfigModel.listDataVariantConfig;
    _listDataStatusConfig = inventoryDataConfigModel.listDataStatusConfig;
    notifyListeners();
  }

  updateStatus(List<DataStatusConfig> listDataStatusConfig) {
    _listDataStatusConfig = listDataStatusConfig;
    notifyListeners();
  }

  updateVariant(List<DataVariantConfig> listDataVariantConfig) {
    _listDataVariantConfig = listDataVariantConfig;
    notifyListeners();
  }

  updateIndexStatus(int index) {
    _currentStatus = index;
    notifyListeners();
  }

  clear() {
    _listDataVariantConfig.clear();
    _listDataStatusConfig.clear();
    _currentStatus = -1;
    notifyListeners();
  }

  get listDataStatusConfig => _listDataStatusConfig;

  set listDataStatusConfig(value) {
    _listDataStatusConfig = value;
  }

  get listDataVariantConfig => _listDataVariantConfig;

  set listDataVariantConfig(value) {
    _listDataVariantConfig = value;
  }

  get currentStatus => _currentStatus;

  set currentStatus(value) {
    _currentStatus = value;
  }
}