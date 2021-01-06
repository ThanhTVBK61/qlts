import 'package:qlts/data_sources/data_source_inventory/inventory_api_provider.dart';
import 'package:qlts/data_sources/data_source_inventory/inventory_data_config_model.dart';
import 'package:qlts/data_sources/data_source_inventory/inventory_data_update_model.dart';
import 'package:qlts/data_sources/data_source_inventory/inventory_detail_model.dart';
import 'package:qlts/data_sources/data_source_inventory/inventory_fixed_model.dart';
import 'package:qlts/data_sources/data_source_inventory/inventory_model.dart';
import 'package:qlts/data_sources/data_source_inventory/inventory_result_API_model.dart';
import 'package:qlts/data_sources/data_source_inventory/offline/inventory_offline_model.dart';
import 'package:qlts/data_sources/data_source_search/item_search_model.dart';
import 'package:qlts/data_sources/data_source_search/search_api_provider.dart';
import 'package:qlts/data_sources/logout/logout_api_provider.dart';

class Repository {
  final searchAPIProvider = SearchAPIProvider();
  final inventoryAPIProvider = InventoryAPIProvider();
  final logoutAPIProvider = LogoutAPIProvider();

  Future<InventoryResultAPIModel> fetchLogout(
      {String token}) =>
      logoutAPIProvider.fetchLogout(token);

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

  ///---------------******---------------
  ///
  ///Get inventory round
  Future<InventoryModel> fetchGetInventory(
      {String token}) =>
      inventoryAPIProvider.fetchGetInventory(token);

  ///Get inventory fixed
  Future<InventoryFixedModel> fetchGetInventoryFixed(
      {String token, String inventoryId}) =>
      inventoryAPIProvider.fetchGetInventoryFixed(token,inventoryId);

  ///Get data config
  Future<InventoryDataConfigModel> fetchGetDataConfigInventory(
      {String token}) =>
      inventoryAPIProvider.fetchGetDataConfigInventory(token);

  ///Get data offline
  Future<InventoryOfflineModel> fetchGetDataOfflineInventory(
      {String token, String inventoryId, String fixedId}) =>
      inventoryAPIProvider.fetchGetDataOfflineInventory(token,inventoryId,fixedId);

  ///Search qrcode
  Future<InventoryDetailModel> fetchInventoryDetailQRCode(
      {String token, String inventoryId, String typeCode, String value}) =>
      inventoryAPIProvider.fetchInventoryDetailQRCode(token, inventoryId, typeCode, value);

  ///Search Input
  Future<InventoryDetailModel> fetchInventoryDetailInput(
      {String token, String inventoryId, String soThe, String assetCodeNumber, String serial}) =>
      inventoryAPIProvider.fetchInventoryDetailInput(token, inventoryId, soThe, assetCodeNumber, serial);

  ///Update online
  Future<InventoryResultAPIModel> fetchUpdateOnline(
      {InventoryDataUpdateModel dataUpdate}) =>
      inventoryAPIProvider.fetchUpdateOnline(dataUpdate);

  ///Upload data
  Future<InventoryResultAPIModel> fetchUploadData(
      {InventoryDataUpload inventoryDataUpload}) =>
      inventoryAPIProvider.fetchUploadData(inventoryDataUpload);


}
