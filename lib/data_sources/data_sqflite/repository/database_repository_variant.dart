import 'package:qlts/data_sources/data_source_inventory/inventory_data_config_model.dart';
import 'package:qlts/data_sources/data_sqflite/dao/config_variant_dao.dart';
import 'package:qlts/data_sources/data_sqflite/database_provider.dart';
import 'package:qlts/data_sources/data_sqflite/repository/database_repository.dart';

class DatabaseRepositoryVariant implements DatabaseRepository<DataVariantConfig>{

  final dao = ConfigVariantDao();
  DatabaseProvider databaseProvider;

  DatabaseRepositoryVariant({this.databaseProvider});

  @override
  Future<DataVariantConfig> delete(DataVariantConfig object) async {
    final db = await databaseProvider.db();
    await db.delete(dao.tableName,
        where: dao.columnId + " = ?", whereArgs: [object.idRow]);
    return object;
  }

  @override
  Future<List<DataVariantConfig>> getData() async {
    final db = await databaseProvider.db();
    List<Map> maps = await db.query(dao.tableName);
    return dao.fromList(maps);
  }

  @override
  Future<DataVariantConfig> insert(DataVariantConfig object) async {
    final db = await databaseProvider.db();
    object.idRow = await db.insert(dao.tableName, dao.toMap(object));
    return object;
  }

  @override
  Future<int> update(DataVariantConfig object) async {
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