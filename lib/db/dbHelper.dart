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

  static void _createDb(Database db) {
    db.execute(
      "CREATE TABLE Kid(key INTEGER PRIMARY KEY, name TEXT, age INTEGER)",
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
        key: maps[i]['key'],
        name: maps[i]['name'],
        age: maps[i]['age'],
      );
    });
  }

  Future<dynamic> getKid(int key) async {
    final db = await database;

    final List<Map<String, dynamic>> maps = (await db.query(
      'Kid',
      where: 'key = ?',
      whereArgs: [key],
    ));

    return maps.isNotEmpty ? maps : null;
  }

  Future<void> updateKid(Kid kid) async {
    final db = await database;

    await db.update(
      "Kid",
      kid.toMap(),
      where: "key = ?",
      whereArgs: [kid.key],
    );
  }

  Future<void> deleteKid(int key) async {
    final db = await database;

    await db.delete(
      "Kid",
      where: "key = ?",
      whereArgs: [key],
    );
  }
}