import 'package:sqflite/sqflite.dart';

import 'package:todo_list/external/sqflite/database_service.dart';

class QueryService {
  DatabaseService _service;

  QueryService() {
    this._service = DatabaseService.instance;
  }

  Future<List<Map<String, dynamic>>> all(String table,
      [String field, dynamic value]) async {
    Database database = await this._service.database;
    return value != null
        ? await database.query(table, where: '$field = ?', whereArgs: [value])
        : await database.query(table);
  }

  Future<Map<String, dynamic>> find(
    String table,
    dynamic value, [
    String where = 'id',
    String comparison = '=',
  ]) async {
    Database database = await this._service.database;
    List<Map<String, dynamic>> maps = await database.query(
      table,
      where: '$where $comparison ?',
      whereArgs: [value],
    );
    return maps.length > 0 ? maps.first : <String, dynamic>{};
  }

  Future<int> create(String table, Map<String, dynamic> item) async {
    Database database = await this._service.database;
    return await database.insert(table, item);
  }

  Future<int> update(
    String table,
    Map<String, dynamic> item, [
    dynamic value,
    String where = 'id',
    String comparison = '=',
  ]) async {
    Database database = await this._service.database;
    return await database.update(
      table,
      item,
      where: '$where $comparison ?',
      whereArgs: [value ?? item[where] ?? item['id']],
    );
  }

  Future<int> destroy(
    String table,
    dynamic value, [
    String where = 'id',
    String comparison = '=',
  ]) async {
    Database database = await this._service.database;
    return await database.delete(
      table,
      where: '$where $comparison ?',
      whereArgs: [value],
    );
  }

  Future<List<Map<String, dynamic>>> rawQuery(
    String sql, [
    List<dynamic> arguments,
  ]) async {
    Database database = await this._service.database;
    return await database.rawQuery(sql, arguments);
  }
}
