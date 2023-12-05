import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DataBaseHelper {
  DataBaseHelper._privateConstructor();
  static final DataBaseHelper instance = DataBaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async =>
      _database ??= await initializeDataBase();

  Future<Database> initializeDataBase() async {
    final databasePath = await getDatabasesPath();
    final pathToDatabase = path.join(databasePath, 'database.db');

    return await openDatabase(
      pathToDatabase,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE category(id INTEGER PRIMARY KEY, indx INTEGER, title TEXT, imagePath TEXT, parent INTEGER, FOREIGN KEY(parent) REFERENCES category(id))',
        );
        await db.execute(
          'CREATE TABLE card(id INTEGER PRIMARY KEY, indx INTEGER, category INTEGER, title TEXT, imagePath TEXT, FOREIGN KEY(category) REFERENCES category(id))',
        );
        await db.execute(
          'CREATE TABLE settings(id INTEGER PRIMARY KEY, terms INTEGER)',
        );

        await db.insert('settings', {
          'id': 1,
          'terms': 0,
        });

        final jsonStringCategories =
            await rootBundle.loadString('assets/data/default/categories.json');
        final jsonStringCards =
            await rootBundle.loadString('assets/data/default/cards.json');

        final dataCategories = json.decode(jsonStringCategories);
        final dataCards = json.decode(jsonStringCards);

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

  Future<int> updateIndexCard(int cardId, int indx) async {
    Database db = await instance.database;
    return await db.update("card", {'indx': indx}, where: "id = $cardId");
  }

  Future<int> updateIndexCategory(int cardId, int indx) async {
    Database db = await instance.database;
    return await db.update("category", {'indx': indx}, where: "id = $cardId");
  }

  Future<int> acceptTerms() async {
    Database db = await instance.database;
    return await db.update("settings", {'terms': 1}, where: "id = 1");
  }

  Future<bool> checkTerms() async {
    Database db = await instance.database;
    var result = await db.query('settings');
    if (result[0]['terms'] == 1) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<Map<String, dynamic>>> getCategories(int parentId) async {
    Database db = await instance.database;
    return await db.query('category',
        where: "parent IN (?)", whereArgs: [parentId], orderBy: 'indx');
  }

  Future<List<Map<String, dynamic>>> getCards(int categoryId) async {
    Database db = await instance.database;
    return await db.query('card',
        where: "category IN (?)", whereArgs: [categoryId], orderBy: 'indx');
  }

  Future<bool> checkParent(int categoryId) async {
    Database db = await instance.database;
    var result = await db
        .query('category', where: "parent IN (?)", whereArgs: [categoryId]);
    return result.isNotEmpty;
  }
}
