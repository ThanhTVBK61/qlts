import 'package:path/path.dart';
import 'package:qlts/data_sources/data_sqflite/dao/config_status_dao.dart';
import 'package:qlts/data_sources/data_sqflite/dao/config_variant_dao.dart';
import 'package:qlts/data_sources/data_sqflite/dao/inventory_offline_dao.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider{
    DatabaseProvider._internal();
    static final _instance = DatabaseProvider._internal();
    static DatabaseProvider getInstance = _instance;

    Database _db;

    Future<Database> db() async{
      if(_db == null) await _initDatabase();
      return _db;
    }

    Future _initDatabase() async{
        var databasePath = await getDatabasesPath();
        String path = join(databasePath,'qlts.db');

        _db = await openDatabase(path, version: 1,
            onCreate: (Database db, int version) async {
              await db.execute(ConfigStatusDao().createTableQuery);
              await db.execute(ConfigVariantDao().createTableQuery);
              await db.execute(InventoryOfflineDao().createTableQuery);
            });
    }
}