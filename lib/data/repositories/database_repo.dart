import 'package:mobile_user_app/data/models/fav_user.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static late Database _database;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  static const String _tableName = 'crud_users';

  Future<Database> _initializeDb() async {
    var path = await getDatabasesPath();
    var db = openDatabase(
      '$path/crud_users.db',
      onCreate: (db, version) async {
        await db.execute(
          '''CREATE TABLE $_tableName (
            id INTEGER PRIMARY KEY,
            email TEXT,
            first_name TEXT,
            last_name TEXT,
            avatar TEXT
             )''',
        );
      },
      version: 1,
    );

    return db;
  }

  Future<void> insertUser(FavUser user) async {
    final Database db = await database;
    await db.insert(_tableName, user.toJson());
    print('Data saved');
  }

  Future<List<FavUser>> getFav() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableName);

    return results.map((res) => FavUser.fromJson(res)).toList();
  }

  Future<void> deleteFav(int id) async {
    final db = await database;

    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}