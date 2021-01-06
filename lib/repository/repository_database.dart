import 'package:qlts/data_sources/data_sqflite/database_provider.dart';
import 'package:qlts/data_sources/data_sqflite/repository/database_repository_offline.dart';
import 'package:qlts/data_sources/data_sqflite/repository/database_repository_status.dart';
import 'package:qlts/data_sources/data_sqflite/repository/database_repository_variant.dart';

class RepositoryDatabase{

  DatabaseRepositoryVariant databaseRepositoryVariant;
  DatabaseRepositoryStatus databaseRepositoryStatus;
  DatabaseRepositoryOffline databaseRepositoryOffline;

  RepositoryDatabase(DatabaseProvider databaseProvider){
    databaseRepositoryVariant = DatabaseRepositoryVariant(databaseProvider: databaseProvider);
    databaseRepositoryStatus = DatabaseRepositoryStatus(databaseProvider: databaseProvider);
    databaseRepositoryOffline = DatabaseRepositoryOffline(databaseProvider: databaseProvider);
  }
}