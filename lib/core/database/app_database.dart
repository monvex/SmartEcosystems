import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  static const _databaseName = 'smartecosystems.db';
  static const _databaseVersion = 1;

  // Таблица пользователя
  static const userTable = 'user';
  static const userColumnId = 'id';
  static const userColumnName = 'name';
  static const userColumnAccessToken = 'access_token';

  // Таблица устройств
  static const devicesTable = 'devices';
  static const deviceColumnId = 'id';
  static const deviceColumnUserId = 'user_id'; // Связь с пользователем
  static const deviceColumnName = 'name';
  static const deviceColumnLatitude = 'latitude';
  static const deviceColumnLongitude = 'longitude';

  static Future<Database> get database async {
    return await openDatabase(
      join(await getDatabasesPath(), _databaseName),
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  static Future<void> _onCreate(Database db, int version) async {
    // Создаем таблицу пользователя
    await db.execute('''
      CREATE TABLE $userTable (
        $userColumnId INTEGER PRIMARY KEY,
        $userColumnName TEXT NOT NULL,
        $userColumnAccessToken TEXT NOT NULL
      )
    ''');

    // Создаем таблицу устройств
    await db.execute('''
      CREATE TABLE $devicesTable (
        $deviceColumnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $deviceColumnUserId INTEGER NOT NULL,
        $deviceColumnName TEXT NOT NULL,
        $deviceColumnLatitude REAL NOT NULL,
        $deviceColumnLongitude REAL NOT NULL,
        FOREIGN KEY ($deviceColumnUserId) REFERENCES $userTable($userColumnId)
      )
    ''');
  }

  // Методы для работы с пользователем

  static Future<Map<String, dynamic>?> getUser() async {
    final db = await database;
    final List<Map<String, dynamic>> result = await db.query(userTable);
    return result.isNotEmpty ? result.first : null;
  }

  static Future<int> updateUser(Map<String, dynamic> user) async {
    final db = await database;
    return await db.update(
      userTable,
      user,
      where: '$userColumnId = ?',
      whereArgs: [user[userColumnId]],
    );
  }

  // Методы для работы с устройствами
  static Future<int> insertDevice(Map<String, dynamic> device) async {
    final db = await database;
    return await db.insert(devicesTable, device);
  }

  static Future<List<Map<String, dynamic>>> getUserDevices(int userId) async {
    final db = await database;
    return await db.query(
      devicesTable,
      where: '$deviceColumnUserId = ?',
      whereArgs: [userId],
    );
  }

  static Future<int> deleteDevice(int deviceId) async {
    final db = await database;
    return await db.delete(
      devicesTable,
      where: '$deviceColumnId = ?',
      whereArgs: [deviceId],
    );
  }
}
