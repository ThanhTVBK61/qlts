import 'package:qlts/data_sources/data_source_inventory/inventory_data_config_model.dart';
import 'package:qlts/data_sources/data_source_inventory/offline/inventory_aten_model.dart';
import 'package:qlts/data_sources/data_source_inventory/offline/inventory_capd_capq_model.dart';
import 'package:qlts/data_sources/data_source_inventory/offline/inventory_cobe_model.dart';
import 'package:qlts/data_sources/data_source_inventory/offline/inventory_khac_model.dart';
import 'package:qlts/data_sources/data_source_inventory/offline/inventory_mmtb_model.dart';
import 'package:qlts/data_sources/data_source_inventory/offline/inventory_nckt_model.dart';
import 'package:qlts/data_sources/data_source_inventory/offline/inventory_offline_model.dart';
import 'package:qlts/data_sources/data_source_inventory/offline/inventory_ptvt_model.dart';
import 'package:qlts/data_sources/data_source_inventory/offline/inventory_tcot_model.dart';
import 'package:qlts/data_sources/data_sqflite/dao/inventory_offline_dao.dart';
import 'package:qlts/data_sources/data_sqflite/database_provider.dart';
import 'package:qlts/data_sources/data_sqflite/repository/database_repository.dart';

class DatabaseRepositoryOffline
    implements DatabaseRepository<InventoryOffline> {

  final dao = InventoryOfflineDao();
  DatabaseProvider databaseProvider;

  DatabaseRepositoryOffline({this.databaseProvider});

  @override
  Future<void> clear() async {
    final db = await databaseProvider.db();
    await db.rawQuery('DELETE from ${dao.tableName}');
  }

  @override
  Future<InventoryOffline> delete(InventoryOffline object) async {
    final db = await databaseProvider.db();
    await db.delete(dao.tableName,
        where: dao.columnIdKqkk + " = ?", whereArgs: [object.idKqkk]);
    return object;
  }

  @override
  Future<List<InventoryOffline>> getData() async {
    final db = await databaseProvider.db();
    List<Map> maps = await db.query(dao.tableName);
    return dao.fromList(maps);
  }

  Future<dynamic> getDataById(String soThe, String maSo,
      List<DataVariantConfig> listDataVariantConfig) async {
    final db = await databaseProvider.db();
    List<Map> result = await db.query(dao.tableName,
        where: 'soThe = ? and maSo = ?', whereArgs: [soThe, maSo]);
    if (dao
        .fromList(result)
        .length == 1) {
      InventoryOffline inventoryOffline = dao.fromList(result)[0];
      switch (inventoryOffline.groupVariant) {
        case 'NCKT':
          return InventoryNCKT.fromInventoryOffline(
              inventoryOffline, listDataVariantConfig);
          break;
        case 'MMTB':
          return InventoryMMTB.fromInventoryOffline(
              inventoryOffline, listDataVariantConfig);
          break;
        case 'PTVT':
          return InventoryPTVT.fromInventoryOffline(
              inventoryOffline, listDataVariantConfig);
          break;
        case 'CAPD':
          return InventoryCAPDCAPQ.fromInventoryOffline(
              inventoryOffline, listDataVariantConfig);
          break;
        case 'CAPQ':
          return InventoryCAPDCAPQ.fromInventoryOffline(
              inventoryOffline, listDataVariantConfig);
          break;
        case 'COBE':
          return InventoryCOBE.fromInventoryOffline(
              inventoryOffline, listDataVariantConfig);
          break;
        case 'TCOT':
          return InventoryTCOT.fromInventoryOffline(
              inventoryOffline, listDataVariantConfig);
          break;
        case 'ATEN':
          return InventoryATEN.fromInventoryOffline(
              inventoryOffline, listDataVariantConfig);
          break;
        case 'KHAC':
          return InventoryKHAC.fromInventoryOffline(
              inventoryOffline, listDataVariantConfig);
          break;
      }
    }
    return null;
  }

  ///RETURN:
  @override
  Future<InventoryOffline> insert(InventoryOffline object) async {
    final db = await databaseProvider.db();
    object.idKqkk = await db.insert(dao.tableName, dao.toMap(object));
    return object;
  }

  Future<int> insertData(InventoryOffline object) async {
    final db = await databaseProvider.db();
    object.idKqkk = await db.insert(dao.tableName, dao.toMap(object));
    if(object.idKqkk < 0) return -1;
    else return object.idKqkk;
  }

  @override
  Future<int> update(InventoryOffline object) async {
    final db = await databaseProvider.db();
    int id = await db.update(dao.tableName, dao.toMap(object),
        where: dao.columnIdKqkk + " = ?", whereArgs: [object.idKqkk]);
    return id;
  }

  Future<Map<String, dynamic>> getDataUpload() async {
    final db = await databaseProvider.db();
    Map<String, dynamic> data= {};
    List<Map> nckt = await db.query(dao.tableName,
        where: 'groupVariant = ?', whereArgs: ['NCKT']);
    List<Map> mmtb = await db.query(dao.tableName,
        where: 'groupVariant = ?', whereArgs: ['MMTB']);
    List<Map> ptvt = await db.query(dao.tableName,
        where: 'groupVariant = ?', whereArgs: ['PTVT']);
    List<Map> capd = await db.query(dao.tableName,
        where: 'groupVariant = ?', whereArgs: ['CAPD']);
    List<Map> capq = await db.query(dao.tableName,
        where: 'groupVariant = ?', whereArgs: ['CAPQ']);
    List<Map> cobe = await db.query(dao.tableName,
        where: 'groupVariant = ?', whereArgs: ['COBE']);
    List<Map> tcot = await db.query(dao.tableName,
        where: 'groupVariant = ?', whereArgs: ['TCOT']);
    List<Map> aten = await db.query(dao.tableName,
        where: 'groupVariant = ?', whereArgs: ['ATEN']);
    List<Map> khac = await db.query(dao.tableName,
        where: 'groupVariant = ?', whereArgs: ['KHAC']);

    data['json_nckt'] = dao.toListUpload(nckt);
    data['json_mmtb'] = dao.toListUpload(mmtb);
    data['json_ptvt'] = dao.toListUpload(ptvt);
    data['json_capd'] = dao.toListUpload(capd);
    data['json_capq'] = dao.toListUpload(capq);
    data['json_cobe'] = dao.toListUpload(cobe);
    data['json_tcot'] = dao.toListUpload(tcot);
    data['json_aten'] = dao.toListUpload(aten);
    data['json_khac'] = dao.toListUpload(khac);

    return data;
  }
}
