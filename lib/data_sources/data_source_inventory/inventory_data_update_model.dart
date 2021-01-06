class InventoryDataUpdateModel {
  String token;
  String inventoryId;
  String assetId;
  String statusCode;
  String dataUpdate;
  String scenePhoto;
  String description;

  InventoryDataUpdateModel.getInstance({
    this.token,
    this.inventoryId,
    this.assetId,
    this.statusCode,
    this.dataUpdate,
    this.scenePhoto,
    this.description,
  });
}

class InventoryDataUpload{
  String token;
  String inventoryId;
  String assetId;
  String statusCode;
  Map<String, dynamic> dataUpload;
  String scenePhoto;
  String description;

  InventoryDataUpload.getInstance({
    this.token,
    this.inventoryId,
    this.assetId,
    this.statusCode,
    this.dataUpload,
    this.scenePhoto,
    this.description,
  });
}


