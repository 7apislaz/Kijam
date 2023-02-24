import 'package:kijam_vision21tech/model/attendance.dart';
import 'package:kijam_vision21tech/model/emotion_data.dart';
import 'package:kijam_vision21tech/model/kindergartens.dart';
import 'package:kijam_vision21tech/model/measured_data.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../model/kid.dart';

class DBHelper {
  var _db;

  Future<Database> get database async {
    if (_db != null) return _db;
    _db = openDatabase(join(await getDatabasesPath(), 'Kid.db'),
        onCreate: (db, version) => _createDb(db), version: 1);
    return _db;
  }

  static void _createDb(Database db) async{
    await db.execute(
      "CREATE TABLE kindergartens("
          "id INTEGER PRIMARY KEY AUTOINCREMENT, "
          "key TEXT, "
          "name TEXT, "
          "updated_datetime TEXT)",
    );
    await db.execute(
      "CREATE TABLE kid("
          "id INTEGER PRIMARY KEY AUTOINCREMENT, "
          "inf_key TEXT, "
          "tag TEXT, "
          "name TEXT, "
          "gender TEXT , "
          "age TEXT, "
          "kindergarten TEXT REFERENCES Kindergarten(key) ,"
          "classroom TEXT, "
          "picture TEXT,"
          "update_datetime TEXT, "
          "is_active TEXT CHECK(name IN('True', 'False')))",
    );
    await db.execute(
      "CREATE TABLE measured_data("
          "id INTEGER PRIMARY KEY AUTOINCREMENT, "
          "height TEXT,"
          "weight TEXT,"
          "measured_datetime TEXT,"
          "inf_key TEXT REFERENCES kid(inf_key))",
    );
    await db.execute(
      "CREATE TABLE emotion_data("
          "id INTEGER PRIMARY KEY AUTOINCREMENT, "
          "selected_play TEXT, "
          "emotion TEXT, "
          "measured_datetime TEXT, "
          "inf_key TEXT REFERENCES kid(inf_key))",
    );
    await db.execute(
      "CREATE TABLE attendance("
          "id INTEGER PRIMARY KEY AUTOINCREMENT, "
          "attendance_type TEXT ,"
          "emotion TEXT,"
          "measured_datetime TEXT,"
          "inf_key TEXT REFERENCES kid(inf_key))",
    );
  }
  Future<void> insertKid(Kid kid) async {
    final db = await database;

    await db.insert("Kid", kid.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Kid>> getAllKid() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('Kid');

    return List.generate(maps.length, (i) {
      return Kid(
        inf_key: maps[i]['inf_key'],
        tag: maps[i]['tag'],
        name: maps[i]['name'],
        gender: maps[i]['gender'],
        age: maps[i]['age'],
        classroom: maps[i]['classroom'],
        picture: maps[i]['picture'],
        update_datetime: maps[i]['update_datetime'],
        is_active: maps[i]['is_active'],
      );
    });
  }

  Future<dynamic> getKid(String inf_key) async {
    final db = await database;

    final List<Map<String, dynamic>> maps = (await db.query(
      'Kid',
      where: 'kid = ?',
      whereArgs: [inf_key],
    ));

    return maps.isNotEmpty ? maps : null;
  }

  Future<void> updateKid(Kid kid) async {
    final db = await database;

    await db.update(
      "Kid",
      kid.toMap(),
      where: "inf_key = ?",
      whereArgs: [kid.inf_key],
    );
  }

  Future<void> deleteKid(String inf_key) async {
    final db = await database;

    await db.delete(
      "Kid",
      where: "inf_key = ?",
      whereArgs: [inf_key],
    );
  }

  Future<void> insertKindergartens(Kindergartens kindergartens) async {
    final db = await database;
    await db.insert("Kindergartens", kindergartens.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<dynamic> getKindergartens(String inf_key) async {
    final db = await database;

    final List<Map<String, dynamic>> maps = (await db.query(
      "Kid",
      where: "inf_key = ?",
      whereArgs: [inf_key],
    ));

    return maps.isNotEmpty ? maps : null;
  }

  Future<List<Kindergartens>> getAllKindergartens() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('kindergartens');
    return List.generate(maps.length, (i) {
      return Kindergartens(
        key: maps[i]['key'],
        name: maps[i]['name'],
        updated_datetime: maps[i]['updated_datetime'],
      );
    });
  }

  Future<void> insertAttendance(Attendance attendance) async {
    final db = await database;
    await db.insert("Attendance", attendance.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> insertEmotionData(EmotionData emotionData) async {
    final db = await database;
    await db.insert("EmotionData", emotionData.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> insertMeasuredData(MeasuredData measuredData) async {
    final db = await database;
    await db.insert("MeasuredData", measuredData.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
}