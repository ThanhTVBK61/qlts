import 'package:qlts/data_sources/data_source_inventory/inventory_data_config_model.dart';
import 'package:qlts/data_sources/data_sqflite/dao/dao.dart';

class ConfigStatusDao implements Dao<DataStatusConfig>{

  final tableName = 'status';
  final columnId = 'id';
  final _columnStatusCode = 'code';
  final _columnStatusName = 'name';

  @override
  String get createTableQuery =>
      'CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY autoincrement, $_columnStatusCode TEXT, $_columnStatusName TEXT)';

  @override
  List<DataStatusConfig> fromList(List<Map<String, dynamic>> query) {
    List<DataStatusConfig> listConfigStatus = List<DataStatusConfig>();
    for (Map map in query) {
      listConfigStatus.add(fromMap(map));
    }
    return listConfigStatus;
  }

  @override
  DataStatusConfig fromMap(Map<String, dynamic> query) {
    DataStatusConfig configStatus = DataStatusConfig();
    configStatus.idRow = query[columnId];
    configStatus.statusCode = query[_columnStatusCode];
    configStatus.statusName = query[_columnStatusName];
    return configStatus;
  }

  @override
  Map<String, dynamic> toMap(DataStatusConfig object) {
    return <String, dynamic>{
      _columnStatusCode: object.statusCode,
      _columnStatusName: object.statusName
    };
  }

}