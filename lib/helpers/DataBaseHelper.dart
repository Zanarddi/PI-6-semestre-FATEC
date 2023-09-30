import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DataBaseHelper {
  late Database _database;

  Future<void> initializeDataBase() async {
    final databasePath = await getDatabasesPath();
    final pathToDatabase = path.join(databasePath, 'database.db');

    _database = await openDatabase(
      pathToDatabase,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE category(id INTEGER PRIMARY KEY, index INTEGER, title TEXT, imagePath TEXT)',
        );
        await db.execute(
          'CREATE TABLE card(id INTEGER PRIMARY KEY, index INTEGER, category INTEGER, title TEXT, imagePath TEXT, FOREIGN KEY(category) REFERENCES category(id))',
        );
      },
    );
  }
}
