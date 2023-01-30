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
      "CREATE TABLE Kindergarten(key INTEGER PRIMARY KEY AUTOINCREMENT, "
                                "name TEXT, "
                                "update_datetime NUMERIC);",
    );
    await db.execute(
      "CREATE TABLE infant(id INTEGER PRIMARY KEY AUTOINCREMENT, "
                          "inf_key TEXT, "
                          "tag TEXT, "
                          "name TEXT, "
                          "gender TEXT , "
                          "age INTEGER, "
                          // "FOREIGN KEY(group) REFERENCES Kindergarten(key),"
                          "picture TEXT,"
                          "update_datetime NUMERIC, "
                          "is_active TEXT CHECK(name IN('True', 'False')) );",
    );
    await db.execute(
      "CREATE TABLE measured_data(id INTEGER PRIMARY KEY AUTOINCREMENT, "
          "height TEXT,"
          "weight TEXT,"
          "measured_datetime NUMERIC,"
          "inf_key TEXT);",
    );
    await db.execute(
      "CREATE TABLE emotion_data("
          "id INTEGER PRIMARY KEY AUTOINCREMENT, "
          "selected_play TEXT, "
          "emotion TEXT, "
          "measured_datetime NUMERIC, "
          "inf_key TEXT);",
    );
    await db.execute(
      "CREATE TABLE attendance(id INTEGER PRIMARY KEY AUTOINCREMENT, "
          "attendance_type TEXT ,"
          "emotion TEXT,"
          "measured_datetime NUMERIC,"
          "inf_key TEXT);",
    );
  }
  Future<void> insertInfant(Infant infant) async {
    final db = await database;

    await db.insert("Infant", infant.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Infant>> getAllInfant() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('Infant');

    return List.generate(maps.length, (i) {
      return Infant(
        inf_key: maps[i]['inf_key'],
        tag: maps[i]['tag'],
        name: maps[i]['name'],
        gender: maps[i]['gender'],
        age: maps[i]['age'],
        group: maps[i]['group'],
        picture: maps[i]['picture'],
        update_datetime: maps[i]['update_datetime'],
        is_active: maps[i]['is_active'],
      );
    });
  }

  Future<dynamic> getInfant(String inf_key) async {
    final db = await database;

    final List<Map<String, dynamic>> maps = (await db.query(
      'Infant',
      where: 'infant = ?',
      whereArgs: [inf_key],
    ));

    return maps.isNotEmpty ? maps : null;
  }

  Future<void> updateInfant(Infant infant) async {
    final db = await database;

    await db.update(
      "Infant",
      infant.toMap(),
      where: "inf_key = ?",
      whereArgs: [infant.inf_key],
    );
  }

  Future<void> deleteInfant(String inf_key) async {
    final db = await database;

    await db.delete(
      "Infant",
      where: "inf_key = ?",
      whereArgs: [inf_key],
    );
  }
}