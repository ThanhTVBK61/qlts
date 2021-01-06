import 'package:qlts/data_sources/data_source_inventory/inventory_data_config_model.dart';
import 'package:qlts/data_sources/data_sqflite/dao/config_status_dao.dart';
import 'package:qlts/data_sources/data_sqflite/database_provider.dart';
import 'package:qlts/data_sources/data_sqflite/repository/database_repository.dart';

class DatabaseRepositoryStatus implements DatabaseRepository<DataStatusConfig>{

  final dao = ConfigStatusDao();
  DatabaseProvider databaseProvider;

  DatabaseRepositoryStatus({this.databaseProvider});

  @override
  Future<DataStatusConfig> delete(DataStatusConfig object) async {
    final db = await databaseProvider.db();
    await db.delete(dao.tableName,
        where: dao.columnId + " = ?", whereArgs: [object.idRow]);
    return object;
  }



  @override
  Future<List<DataStatusConfig>> getData() async {
    final db = await databaseProvider.db();
    List<Map> maps = await db.query(dao.tableName);
    return dao.fromList(maps);
  }

  @override
  Future<DataStatusConfig> insert(DataStatusConfig object) async {
    final db = await databaseProvider.db();
    object.idRow = await db.insert(dao.tableName, dao.toMap(object));
    return object;
  }

  @override
  Future<int> update(DataStatusConfig object) async {
    final db = await databaseProvider.db();
    int id = await db.update(dao.tableName, dao.toMap(object),
        where: dao.columnId + " = ?", whereArgs: [object.idRow]);
    return id;
  }

  @override
  Future<void> clear() async {
    final db = await databaseProvider.db();
    await db.rawQuery('DELETE from ${dao.tableName}') ;
  }
  
}