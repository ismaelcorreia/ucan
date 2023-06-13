import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ConnectionFactory {
  static var database;
  static Future openConnection(String databaseName) async {
    await WidgetsFlutterBinding.ensureInitialized();
    database = await openDatabase(
      join(await getDatabasesPath(), 'dumps/$databaseName.db'),
      version: 1,
    );
  }
}
