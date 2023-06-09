import 'package:flutter_cloud_messaging/db_provider.dart';
import 'package:flutter_cloud_messaging/student.dart';
import 'package:sqflite/sqflite.dart';

class StudentDBProvider {
  static const tableName = 'Student';
  static const keyRollNo = 'st_roll';
  static const keyName = 'st_name';
  static const keyFee = 'st_fee';

  static const createTable =
      "CREATE TABLE $tableName($keyRollNo INTEGER PRIMARY KEY,$keyName TEXT,$keyFee REAL)";
  static const dropTable = 'DROP TABLE IF EXIST $tableName';

  Future<bool> insertStudent(Student student) async {
    Database db = await DBProvider.database;
    var rowID = await db.insert(tableName, student.toMap());
    return rowID > 0;
  }
  Future<bool> deleteStudent(int rollNo) async {
    Database db = await DBProvider.database;
    var rowID = await db.delete(tableName, where: "$keyRollNo =?",whereArgs: [rollNo]);
    return rowID > 0;
  }
  Future<bool> updateStudent(Student student) async {
    Database db = await DBProvider.database;
    var rowID = await db.update(tableName, student.toMap(),where: "$keyRollNo =?",whereArgs: [student.rollNo]);
    return rowID > 0;
  }
  Future<List<Student>> fetchStudent() async {
    Database db = await DBProvider.database;
    var rowID = await db.query(tableName);

    return rowID.map((e) => Student.fromMap(e)).toList();
  }
}
