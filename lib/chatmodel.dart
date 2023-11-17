import 'dart:async';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _database;
  static final String tableName = 'chat_history';
  static final String columnId = 'id';
  static final String columnSender = 'sender';
  static final String columnReceiver = 'receiver';
  static final String columnMessage = 'message';
  static final String columnTimestamp = 'timestamp';
  static  final bool isSender = false;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'chat_database.db'),
      onCreate: (
        db,
        version,
      ) async {
        await db.execute('''
          CREATE TABLE $tableName (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnSender TEXT,
            $columnReceiver TEXT, 
            $columnMessage TEXT,
            $columnTimestamp INTEGER,
            isSender INTEGER


          )
        ''');
      },
      onUpgrade: (db, oldVersion, newVersion) {
        db.execute("ALTER TABLE $tableName ADD COLUMN isSender INTEGER;");
      },
      version: 2,
    );
  }

  Future<int> insertMessage(Map<String, dynamic> message) async {
    Database db = await database;
    return await db.insert(tableName, message);
  }

  Future<List<Map<String, dynamic>>> getChatHistory() async {
    Database db = await database;
    return await db.query(tableName, orderBy: '$columnTimestamp DESC');
  }
}
