import 'dart:convert';

import 'package:qlts/data_sources/callAPI.dart';
import 'package:qlts/data_sources/data_source_inventory/inventory_data_config_model.dart';
import 'package:qlts/data_sources/data_source_inventory/inventory_data_update_model.dart';
import 'package:qlts/data_sources/data_source_inventory/inventory_detail_model.dart';
import 'package:qlts/data_sources/data_source_inventory/inventory_fixed_model.dart';
import 'package:qlts/data_sources/data_source_inventory/inventory_model.dart';
import 'package:qlts/data_sources/data_source_inventory/inventory_result_API_model.dart';
import 'package:qlts/data_sources/data_source_inventory/offline/inventory_offline_model.dart';

///Lấy ra các đợt kiểm kê
class InventoryAPIProvider {
  ///Get inventorys round
  Future<InventoryModel> fetchGetInventory(String token) async {
    Map<String, dynamic> body = {"token": token};

    APIResult apiResult = await ServicesRepository()
        .post(action: 'qlts_get_inventory_round', body: body);
    if (apiResult is APISuccess) {
      print("****** My Inventory API Provider****Success**GetInventory**");
      print(
          '****** My Inventory API Provider ***apidata*****\n${apiResult.data}\n***********************');
      return InventoryModel.fromJson(apiResult.data);
    } else if (apiResult is APIError) {
      print("****** My Inventory API Provider****Error****");
      print(apiResult.statusCode);
      Map<String, dynamic> apiError = {
        'ErrorCode': "-1",
        'ErrorDesc': "${apiResult.type}",
      };
      return InventoryModel.fromJson(apiError);
    } else {
      print("I don't know");
      Map<String, dynamic> apiError = {
        'ErrorCode': "-1",
        'ErrorDesc': "Error.",
      };
      return InventoryModel.fromJson(apiError);
    }
  }

  ///Get inventorys fixed
  Future<InventoryFixedModel> fetchGetInventoryFixed(String token, String inventoryId) async {
    Map<String, dynamic> body = {"token": token,"inventory_id": inventoryId};

    APIResult apiResult = await ServicesRepository()
        .post(action: 'qlts_get_inventory_fixed', body: body);
    if (apiResult is APISuccess) {
      print("****** My Inventory Fixed API Provider****Success**GetInventoryFixed**");
      print(
          '****** My Inventory Fixed API Provider ***apidata*****\n${apiResult.data}\n***********************');
      return InventoryFixedModel.fromJson(apiResult.data);
    } else if (apiResult is APIError) {
      print("****** My Inventory Fixed API Provider****Error****");
      print(apiResult.statusCode);
      Map<String, dynamic> apiError = {
        'ErrorCode': "-1",
        'ErrorDesc': "${apiResult.type}",
      };
      return InventoryFixedModel.fromJson(apiError);
    } else {
      print("I don't know");
      Map<String, dynamic> apiError = {
        'ErrorCode': "-1",
        'ErrorDesc': "Error.",
      };
      return InventoryFixedModel.fromJson(apiError);
    }
  }

  ///Get data config
  Future<InventoryDataConfigModel> fetchGetDataConfigInventory(String token) async {
    Map<String, dynamic> body = {"token": token};

    APIResult apiResult = await ServicesRepository()
        .post(action: 'qlts_get_data_config', body: body);
    if (apiResult is APISuccess) {
      print(
          '****** My Inventory GetDataConfig API Provider ***apidata*****\n${apiResult.data}\n***********************');
      return InventoryDataConfigModel.fromJson(apiResult.data);
    } else if (apiResult is APIError) {
      print("****** My Inventory GetDataConfig API Provider****Error****");
      print(apiResult.statusCode);
      Map<String, dynamic> apiError = {
        'ErrorCode': "-1",
        'ErrorDesc': "${apiResult.type}",
      };
      return InventoryDataConfigModel.fromJson(apiError);
    } else {
      print("I don't know GetDataConfig");
      Map<String, dynamic> apiError = {
        'ErrorCode': "-1",
        'ErrorDesc': "Error.",
      };
      return InventoryDataConfigModel.fromJson(apiError);
    }
  }

  ///Get data config
  Future<InventoryOfflineModel> fetchGetDataOfflineInventory(String token, String inventoryId, String fixedId) async {
    Map<String, dynamic> body = {
      "token": token,
      "inventory_id": inventoryId,
      "fixed_id": fixedId
    };

    APIResult apiResult = await ServicesRepository()
        .post(action: 'qlts_get_inventory_offline', body: body);
    if (apiResult is APISuccess) {
      print(
          '****** My Inventory Offline API Provider ***apidata*****\n${apiResult.data}\n***********************');
      return InventoryOfflineModel.fromJson(apiResult.data);
    } else if (apiResult is APIError) {
      print("****** My Inventory Offline API Provider****Error****");
      print(apiResult.statusCode);
      Map<String, dynamic> apiError = {
        'ErrorCode': "-1",
        'ErrorDesc': "${apiResult.type}",
      };
      return InventoryOfflineModel.fromJson(apiError);
    } else {
      print("I don't know GetDataOffline");
      Map<String, dynamic> apiError = {
        'ErrorCode': "-1",
        'ErrorDesc': "Error.",
      };
      return InventoryOfflineModel.fromJson(apiError);
    }
  }

  ///Search qrcode
  Future<InventoryDetailModel> fetchInventoryDetailQRCode(String token, String inventoryId, String typeCode, String value) async {
    Map<String, dynamic> body = {"token": token,"inventory_id": inventoryId,"type_code":typeCode,"value": value};
    print(body);
    APIResult apiResult = await ServicesRepository()
        .post(action: 'qlts_get_inventory_scan', body: body);
    if (apiResult is APISuccess) {
      print("****** My Inventory QRCode API Provider****Success**QRCode**");
      print(
          '****** My Inventory QRCode API Provider ***apidata*****\n${apiResult.data}\n***********************');
      return InventoryDetailModel.fromJson(apiResult.data);
    } else if (apiResult is APIError) {
      print("****** My Inventory QRCode API Provider****Error****");
      print(apiResult.statusCode);
      Map<String, dynamic> apiError = {
        'ErrorCode': "-1",
        'ErrorDesc': apiResult.type,

      };
      return InventoryDetailModel.fromJson(apiError);
    } else {
      print("I don't know");
      Map<String, dynamic> apiError = {
        'ErrorCode': "-1",
        'ErrorDesc': "Error.",

      };
      return InventoryDetailModel.fromJson(apiError);
    }
  }

  ///Search inputdata
  Future<InventoryDetailModel> fetchInventoryDetailInput(
      String token, String inventoryId, String soThe, String assetCodeNumber, String serial) async {
    Map<String, dynamic> body = {
      "token": token,
      "inventory_id": inventoryId,
      "so_the": soThe,
      "asset_code_number": assetCodeNumber,
      "serial": serial
    };
    print('---fetchInventoryDetailInput-----body----------: $body');
    APIResult apiResult = await ServicesRepository()
        .post(action: 'qlts_get_inventory_search', body: body);
    if (apiResult is APISuccess) {
      print("****** My Inventory Input API Provider****Success**Input**");
      print(
          '****** My Inventory Input API Provider ***apidata*****\n${apiResult.data}\n*********apidata*********');
      return InventoryDetailModel.fromJson(apiResult.data);
    } else if (apiResult is APIError) {
      print("****** My Search API Provider****Error****");
      print(apiResult.statusCode);
      Map<String, dynamic> apiError = {
        'ErrorCode': "-1",
        'ErrorDesc': "${apiResult.type}"
      };
      return InventoryDetailModel.fromJson(apiError);
    } else {
      print("I don't know");
      Map<String, dynamic> apiError = {
        'ErrorCode': "-1",
        'ErrorDesc': "Error."
      };
      return InventoryDetailModel.fromJson(apiError);
    }
  }

  ///Update online
  Future<InventoryResultAPIModel> fetchUpdateOnline(InventoryDataUpdateModel inventoryDataUpdateModel) async {
    Map<String, dynamic> body = {
      "token": inventoryDataUpdateModel.token,
      // "token": "8e9e3382dcbb40f3a256a6a53789567d",
      "inventory_id": inventoryDataUpdateModel.inventoryId,
      "asset_id": inventoryDataUpdateModel.assetId,
      "status_code": inventoryDataUpdateModel.statusCode,
      "data_update": inventoryDataUpdateModel.dataUpdate,
      "scene_photo": inventoryDataUpdateModel.scenePhoto,
      "description": inventoryDataUpdateModel.description
    };
    print('---fetchUpdateOnline-----body----------: $body');
    APIResult apiResult = await ServicesRepository()
        .post(action: 'qlts_get_inventory_update_online', body: body);
    if (apiResult is APISuccess) {
      print("****** My Inventory Update Data Provider****Success**Update**");
      print(
          '****** My Inventory Update API Provider ***apidata*****\n${apiResult.data}\n*********apidata*********');
      return InventoryResultAPIModel.fromJson(apiResult.data);
    } else if (apiResult is APIError) {
      print("****** My Update API Provider****Error****");
      print(apiResult.statusCode);
      Map<String, dynamic> apiError = {
        'ErrorCode': "-1",
        'ErrorDesc': "${apiResult.type}"
      };
      return InventoryResultAPIModel.fromJson(apiError);
    } else {
      print("I don't know");
      Map<String, dynamic> apiError = {
        'ErrorCode': "-1",
        'ErrorDesc': "Error."
      };
      return InventoryResultAPIModel.fromJson(apiError);
    }
  }

  ///Upload data == Update offline
  Future<InventoryResultAPIModel> fetchUploadData(InventoryDataUpload inventoryDataUpload) async {
    Map<String, dynamic> body = {
      "token": inventoryDataUpload.token,
      // "token": "8e9e3382dcbb40f3a256a6a53789567d",
      "inventory_id": inventoryDataUpload.inventoryId,
      // "asset_id": inventoryDataUpload.assetId,
      // "status_code": inventoryDataUpload.statusCode,
      "data_update": json.encode(inventoryDataUpload.dataUpload),
      // "scene_photo": inventoryDataUpload.scenePhoto,
      // "description": inventoryDataUpload.description
    };
    print('---fetchUploadData-----body----------: $body');
    APIResult apiResult = await ServicesRepository()
        .post(action: 'qlts_get_inventory_offline_update', body: body);
    if (apiResult is APISuccess) {
      print("****** My Inventory Upload Data Provider****Success**Update**");
      print(
          '****** My Inventory Upload Data API Provider ***apidata*****\n${apiResult.data}\n*********apidata*********');
      return InventoryResultAPIModel.fromJson(apiResult.data);
    } else if (apiResult is APIError) {
      print("****** My Upload Data API Provider****Error****");
      print(apiResult.statusCode);
      Map<String, dynamic> apiError = {
        'ErrorCode': "-1",
        'ErrorDesc': "${apiResult.type}"
      };
      return InventoryResultAPIModel.fromJson(apiError);
    } else {
      print("I don't know");
      Map<String, dynamic> apiError = {
        'ErrorCode': "-1",
        'ErrorDesc': "Error."
      };
      return InventoryResultAPIModel.fromJson(apiError);
    }
  }

}
