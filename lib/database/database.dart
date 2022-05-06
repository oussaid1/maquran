import 'dart:io';

import 'package:path/path.dart';
import 'package:flutter/services.dart';

import 'package:sqflite/sqflite.dart';

class MDatabase {
  Database? _database;
  static const _databaseName = "qurantxtdb.db";

  static const _tableName = "table";
  Future<Database> _init() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "assets/$_databaseName");

// Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", _databaseName));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }
// open the database
    return await openDatabase(path, readOnly: true);
  }

  // Getter for the database
  Future<Database> get database async {
    _database ??= _database = await _init();
    return _database!;
  }

  Future<String> _getDatabasePath() async {
    var databasesPath = await getDatabasesPath();
    return join(databasesPath, _databaseName);
  }

  // get records from the table
  Future<List<Map<String, dynamic>>> getRecords() async {
    Database db = await database;
    return await db.query(_tableName);
  }

  // insert a record in the table
  Future<int> insertRecord(Map<String, dynamic> row) async {
    Database db = await database;
    return await db.insert(_tableName, row);
  }

  // update a record in the table
  Future<int> updateRecord(Map<String, dynamic> row) async {
    Database db = await database;
    int id = row['id'];
    return await db.update(_tableName, row, where: 'id = ?', whereArgs: [id]);
  }

  // delete a record in the table
  Future<int> deleteRecord(int id) async {
    Database db = await database;
    return await db.delete(_tableName, where: 'id = ?', whereArgs: [id]);
  }
}
