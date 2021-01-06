
import 'package:qlts/data_sources/callAPI.dart';
import 'package:qlts/data_sources/data_source_search/item_search_model.dart';

class SearchAPIProvider {

  Future<ItemSearchModel> fetchSearchQRCode(
      String token, String type, String value) async {
    Map<String, dynamic> body = {"token": token, "type": type, "value": value};

    APIResult apiResult = await ServicesRepository()
        .post(action: 'qlts_get_asset_by_code_scan', body: body);
    if (apiResult is APISuccess) {
      print("****** My Search API Provider****Success**QRCode**");
      print(
          '****** My Search API Provider ***apidata*****\n${apiResult.data}\n*********apidata*********');
      return ItemSearchModel.fromJson(apiResult.data);
    } else if (apiResult is APIError) {
      print("****** My Search API Provider****Error****");
      print(apiResult.statusCode);
      Map<String, dynamic> apiError = {
        'ErrorCode':"-1",
        'ErrorDesc': apiResult.type
      };
      return ItemSearchModel.fromJson(apiError);
    } else {
      print("I don't know");
      Map<String, dynamic> apiError = {
        'ErrorCode':"-1",
        'ErrorDesc': "Error."
      };
      return ItemSearchModel.fromJson(apiError);
    }
  }

  Future<ItemSearchModel> fetchSearchInput(
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
      return ItemSearchModel.fromJson(apiResult.data);
    } else if (apiResult is APIError) {
      print("****** My Search API Provider****Error****");
      print(apiResult.statusCode);
      Map<String, dynamic> apiError = {
        'ErrorCode':"-1",
        'ErrorDesc': apiResult.type
      };
      return ItemSearchModel.fromJson(apiError);
    } else {
      print("I don't know");
      Map<String, dynamic> apiError = {
        'ErrorCode':"-1",
        'ErrorDesc': "Error."
      };
      return ItemSearchModel.fromJson(apiError);
    }
  }

  Future<ItemSearchModel> fetchSearchInputSerial(
      String token, String serial) async {
    Map<String, dynamic> body = {"token": token, "serial": serial};

    APIResult apiResult = await ServicesRepository()
        .post(action: 'qlts_get_asset_by_data_input', body: body);
    if (apiResult is APISuccess) {
      print("****** My Search API Provider****Success**InputSerial**");
      print(
          '****** My Search API Provider ***apidata*****\n${apiResult.data}\n*********apidata*********');
      return ItemSearchModel.fromJson(apiResult.data);
    } else if (apiResult is APIError) {
      print("****** My Search API Provider****Error****");
      print(apiResult.statusCode);
      Map<String, dynamic> apiError = {
        'ErrorCode':"-1",
        'ErrorDesc': apiResult.type
      };
      return ItemSearchModel.fromJson(apiError);
    } else {
      Map<String, dynamic> apiError = {
        'ErrorCode':"-1",
        'ErrorDesc': "Error."
      };
      return ItemSearchModel.fromJson(apiError);
    }
  }
}
