import 'dart:convert';
import 'package:flutter/services.dart';
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
          'CREATE TABLE category(id INTEGER PRIMARY KEY, indx INTEGER, title TEXT, imagePath TEXT, parent INTEGER, FOREIGN KEY(parent) REFERENCES category(id))',
        );
        await db.execute(
          'CREATE TABLE card(id INTEGER PRIMARY KEY, indx INTEGER, category INTEGER, title TEXT, imagePath TEXT, FOREIGN KEY(category) REFERENCES category(id))',
        );

        final jsonStringCategories =
            await rootBundle.loadString('assets/data/default/categories.json');
        final jsonStringCards =
            await rootBundle.loadString('assets/data/default/cards.json');

        final dataCategories = json.decode(jsonStringCategories);
        final dataCards = json.decode(jsonStringCards);

        print(dataCategories);
        print(dataCards);

        for (final category in dataCategories['categories']) {
          await db.insert(
            'category',
            {
              'id': category['id'],
              'indx': category['indx'],
              'title': category['title'],
              'imagePath': category['imagePath'],
              'parent': category['parent'],
            },
          );
        }
        for (final card in dataCards['cards']) {
          await db.insert(
            'card',
            {
              'id': card['id'],
              'indx': card['indx'],
              'category': card['category'],
              'title': card['title'],
              'imagePath': card['imagePath'],
            },
          );
        }
      },
    );
  }

  Future<List<Map<String, dynamic>>> getCategories() async {
    return await _database.query('category');
  }
}
