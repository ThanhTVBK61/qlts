
///Danh mục tình trạng kiểm kê, cấu hình thuộc tính
class InventoryDataConfigModel {
  String _errorCode = '';
  String _errorDesc = '';
  List<DataVariantConfig> _listDataVariantConfig = [];
  List<DataStatusConfig> _listDataStatusConfig = [];

  InventoryDataConfigModel.fromJson(Map<String, dynamic> data){
    _errorCode = data["ErrorCode"];
    _errorDesc = data["ErrorDesc"];
    if (_errorCode == '200') {
      for (int i = 0; i < data['ObjectDataVariant'].length; i++) {
        DataVariantConfig _dataVariantConfig = DataVariantConfig.fromMap(data['ObjectDataVariant'][i]);
        _listDataVariantConfig.add(_dataVariantConfig);
      }
      print('++++----${data['ObjectDataStatus'].length}------');
      for (int i = 0; i < data['ObjectDataStatus'].length; i++) {
        DataStatusConfig _dataStatusConfig = DataStatusConfig.fromMap(data['ObjectDataStatus'][i]);
        _listDataStatusConfig.add(_dataStatusConfig);
      }
    }
  }

  String get errorCode => _errorCode;

  String get errorDesc => _errorDesc;

  List<DataStatusConfig> get listDataStatusConfig => _listDataStatusConfig;

  List<DataVariantConfig> get listDataVariantConfig => _listDataVariantConfig;
}
///Thông tin cấu hình danh mục thuộc tính
class DataVariantConfig{
  int idRow;
  int id;
  String code;
  String name;
  String note;
  bool canDelete;
  bool canUpdate;
  bool canView;
  bool require;
  String type;

  DataVariantConfig({this.id, this.name, this.code, this.note, this.canDelete, this.canUpdate, this.canView, this.require, this.type});

  DataVariantConfig.fromMap(dataVariantConfig){
    id = dataVariantConfig["id"];
    code = dataVariantConfig["code"];
    name = dataVariantConfig["name"];
    note = dataVariantConfig["note"];
    canDelete = dataVariantConfig["can_delete"];
    canUpdate = dataVariantConfig["can_update"];
    canView = dataVariantConfig["can_view"];
    require = dataVariantConfig["require"];
    type = dataVariantConfig["type"];
  }
}

class DataShow{
  String name = '';
  String type = 'text';
  bool canUpdate = false;
  String giaTri = '';

  DataShow({this.name,this.type,this.canUpdate,this.giaTri});
}

DataShow getDataShow(List<DataVariantConfig> listDataVariantConfig, String code, String value){

  for(int i=0;i<listDataVariantConfig.length;i++){
    if(listDataVariantConfig[i].code == code){
      return DataShow(
          name: listDataVariantConfig[i].name,
          type: listDataVariantConfig[i].type,
          canUpdate: listDataVariantConfig[i].canUpdate,
          giaTri: value);
    }
  }
///foreach k dung dc
  // listDataVariantConfig.forEach((dataVariantConfig){
  //   if(dataVariantConfig.code == code) {
  //     return DataShow(
  //         name: dataVariantConfig.name,
  //         type: dataVariantConfig.type,
  //         canUpdate: dataVariantConfig.canUpdate,
  //         giaTri: value);
  //   }
  // });

  return null;
}

///Thông tin các trạng thái kiểm kê
class DataStatusConfig{
  int idRow;
  String statusName ='';
  String statusCode = '';

  DataStatusConfig.fromMap(dataStatusConfig){
    statusCode = dataStatusConfig["status_code"];
    statusName = dataStatusConfig["status_name"];
  }

  DataStatusConfig({this.statusCode, this.statusName});

}