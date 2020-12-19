import 'package:qlts/data_sources/callAPI.dart';
import 'package:qlts/data_sources/data_source_inventory/inventory_detail_model.dart';
import 'package:qlts/data_sources/data_source_inventory/inventory_model.dart';

///Lấy ra các đợt kiểm kê
class InventoryAPIProvider {
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
        'ErrorDesc': apiResult.type,
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

  ///Chưa cấp API
  Future<InventoryDetailModel> fetchInventoryDetailInput(
      String token, String soThe, String assetCodeNumber) async {
    Map<String, dynamic> body = {
      "token": token,
      "so_the": soThe,
      "asset_code_number": assetCodeNumber
    };

    APIResult apiResult = await ServicesRepository()
        .post(action: 'qlts_get_asset_by_data_input', body: body);
    if (apiResult is APISuccess) {
      print("****** My Search API Provider****Success**Input**");
      print(
          '****** My Search API Provider ***apidata*****\n${apiResult.data}\n*********apidata*********');
      return InventoryDetailModel.fromJson(apiResult.data);
    } else if (apiResult is APIError) {
      print("****** My Search API Provider****Error****");
      print(apiResult.statusCode);
      Map<String, dynamic> apiError = {
        'ErrorCode': "-1",
        'ErrorDesc': apiResult.type
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

}
