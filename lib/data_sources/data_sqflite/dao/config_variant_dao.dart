import 'package:qlts/data_sources/data_source_inventory/inventory_data_config_model.dart';
import 'package:qlts/data_sources/data_sqflite/dao/dao.dart';

class ConfigVariantDao extends Dao<DataVariantConfig> {
  final tableName = 'varianttable';
  final columnIdTable = 'idtable';
  final columnId = 'id';
  final _columnCode = 'code';
  final _columnName = 'name';
  final _columnNote = 'note';
  final _columnCanDelete = 'candelete';
  final _columnCanUpdate = 'canupdate';
  final _columnCanView = 'canview';
  final _columnRequire = 'require';
  final _columnType = 'type';

  @override
  String get createTableQuery => 'CREATE TABLE $tableName($columnIdTable INTEGER PRIMARY KEY autoincrement,$columnId INTEGER,$_columnCode TEXT,$_columnName TEXT,$_columnNote TEXT,$_columnCanDelete INTEGER,$_columnCanUpdate INTEGER, $_columnCanView INTEGER,$_columnRequire INTEGER, $_columnType TEXT)';

  @override
  List<DataVariantConfig> fromList(List<Map<String, dynamic>> query) {
    List<DataVariantConfig> listConfigVariant = List<DataVariantConfig>();
    for (Map map in query) {
      listConfigVariant.add(fromMap(map));
    }
    return listConfigVariant;
  }

  @override
  DataVariantConfig fromMap(Map<String, dynamic> query) {
    DataVariantConfig configVariant = DataVariantConfig();
    configVariant.idRow = query[columnId];
    configVariant.id = query[columnId];
    configVariant.code = query[_columnCode];
    configVariant.name = query[_columnName];
    configVariant.note = query[_columnNote];
    configVariant.canDelete = query[_columnCanDelete] == 1 ? true : false;
    configVariant.canUpdate = query[_columnCanUpdate]== 1 ? true : false;
    configVariant.canView = query[_columnCanView]== 1 ? true : false;
    configVariant.require = query[_columnRequire]== 1 ? true : false;
    configVariant.type = query[_columnType];
    return configVariant;
  }

  @override
  Map<String, dynamic> toMap(DataVariantConfig object) {
    return <String, dynamic>{
      columnId: object.id,
      _columnCode: object.code,
      _columnName: object.name,
      _columnNote: object.note,
      _columnCanDelete: object.canDelete ? 1 : 0,
      _columnCanUpdate: object.canUpdate ? 1 : 0,
      _columnCanView: object.canView ? 1 : 0,
      _columnRequire: object.require ? 1 : 0,
      _columnType: object.type
    };
  }
}
