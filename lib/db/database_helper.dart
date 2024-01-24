import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';

import '../models/task_model.dart';

class DBHelper {
  static Database? _db;
  static const int _version = 1;
  static const String _tableName = 'tasks';

  static Future<void> initDb() async {
    if (_db != null) {
      debugPrint('db not null');
      return;
    }
    try {
      String path = '${await getDatabasesPath()}vehicle_detail.db';
      debugPrint(" in db path");
      _db = await openDatabase(path, version: _version,
          onCreate: (Database db, int version) async {
        debugPrint("creating new database");
        return db.execute('CREATE TABLE $_tableName ('
            'title TEXT, notes TEXT, date STRING)');
      });
      debugPrint("DB created");
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static Future<int> insert(Task? task) async {
    print('insert function called');
    try {
      return await _db!.insert(_tableName, task!.toJson());
    } catch (e) {
      print('!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
      return 9000;
    }
  }

  static Future<int> delete(String t) async {
    debugPrint("Delete function called");
    return await _db!
        .delete(_tableName, where: 'title=?',whereArgs: [t],);
  }


  static Future<int> deleteAll() async {
    debugPrint("delete all function called");
    return await _db!.delete(_tableName);
  }

  static Future<List<Map<String, dynamic>>> query() async {
    debugPrint("query called");
    return await _db!.query(_tableName);
  }

  static Future<int> update(int id) async {
    debugPrint("Update function called");
    return await _db!.rawUpdate('''
    UPDATE tasks
    SET isCompleted = ?
    WHERE id = ?
    ''', [1, id]);
  }
}
