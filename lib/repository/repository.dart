import 'package:qlts/data_sources/data_source_inventory/inventory_api_provider.dart';
import 'package:qlts/data_sources/data_source_inventory/inventory_detail_model.dart';
import 'package:qlts/data_sources/data_source_inventory/inventory_model.dart';
import 'package:qlts/data_sources/data_source_search/item_search_model.dart';
import 'package:qlts/data_sources/data_source_search/search_api_provider.dart';

class Repository {
  final searchAPIProvider = SearchAPIProvider();
  final inventoryAPIProvider = InventoryAPIProvider();

  ///Search
  Future<ItemSearchModel> fetchSearchQRCode(
      {String token, String type, String value}) =>
      searchAPIProvider.fetchSearchQRCode(token, type, value);

  Future<ItemSearchModel> fetchSearchInput(
      {String token, String soThe, String assetCodeNumber}) =>
      searchAPIProvider.fetchSearchInput(token, soThe, assetCodeNumber);

  Future<ItemSearchModel> fetchSearchInputSerial(
          {String token, String serial}) =>
      searchAPIProvider.fetchSearchInputSerial(token, serial);

  ///Inventory
  Future<InventoryModel> fetchGetInventory(
      {String token}) =>
      inventoryAPIProvider.fetchGetInventory(token);

  Future<InventoryDetailModel> fetchInventoryDetailQRCode(
      {String token, String inventoryId, String typeCode, String value}) =>
      inventoryAPIProvider.fetchInventoryDetailQRCode(token, inventoryId, typeCode, value);
}
