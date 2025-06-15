import 'package:sqflite/sqflite.dart';

class LocalAuthDatasource {
  static const String userTable = 'user';
  static const String userColumnId = 'id';
  static const String devicesTable = 'devices';
  static const String deviceColumnUserId = 'user_id';

  final Database database;

  LocalAuthDatasource({required this.database});

  Future insertUser(String login, String token) async {
    final db = database;
    await db.insert(userTable, {
      'id': 0,
      'name': login,
      'access_token': token,
    }, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<Map<String, dynamic>?> getUser() async {
    final result = await database.query(userTable);
    return result.isNotEmpty ? result.first : null;
  }

  Future<int> deleteUser(int userId) async {
    // Удаляем все устройства пользователя
    await database.delete(
      devicesTable,
      where: '$deviceColumnUserId = ?',
      whereArgs: [userId],
    );

    // Удаляем самого пользователя
    return await database.delete(
      userTable,
      where: '$userColumnId = ?',
      whereArgs: [userId],
    );
  }
}
