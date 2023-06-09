import 'package:flutter_cloud_messaging/student_db.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBProvider {
  static Database? _database;
  static Future<Database> get database async {
    var pathDirectory = await getDatabasesPath();
    var path = join(pathDirectory, "student.db");
    return _database ??= await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(StudentDBProvider.createTable);
      },
    );
  }
}
