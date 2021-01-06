import 'package:qlts/data_sources/callAPI.dart';
import 'package:qlts/data_sources/data_source_inventory/inventory_result_API_model.dart';

class LogoutAPIProvider{
  Future<InventoryResultAPIModel> fetchLogout(
      String token) async {
    Map<String, dynamic> body = {"token": token};

    APIResult apiResult = await ServicesRepository()
        .post(action: 'qlts_logout', body: body);
    if (apiResult is APISuccess) {
      print("****** Logout Provider****Success****");
      print(
          '****** Logout Provider ***apidata*****\n${apiResult.data}\n*********apidata*********');
      return InventoryResultAPIModel.fromJson(apiResult.data);
    } else if (apiResult is APIError) {
      print("****** Logout Provider****Error****");
      print(apiResult.statusCode);
      Map<String, dynamic> apiError = {
        'ErrorCode':"-1",
        'ErrorDesc': apiResult.type
      };
      return InventoryResultAPIModel.fromJson(apiError);
    } else {
      print("I don't know");
      Map<String, dynamic> apiError = {
        'ErrorCode':"-1",
        'ErrorDesc': "Error."
      };
      return InventoryResultAPIModel.fromJson(apiError);
    }
  }
}