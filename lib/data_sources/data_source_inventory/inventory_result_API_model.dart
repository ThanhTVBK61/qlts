class InventoryResultAPIModel{
  String errorCode;
  String errorDesc;

  InventoryResultAPIModel({this.errorCode, this.errorDesc});

  InventoryResultAPIModel.fromJson(Map<String, dynamic> data) {
    errorCode = data['ErrorCode'];
    errorDesc = data['ErrorDesc'];
  }
}