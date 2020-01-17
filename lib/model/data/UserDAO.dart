import 'package:sqflite/sqlite_api.dart';

import '../User.dart';
import 'DatabaseHelper.dart';

class UserDAO {
  Future<void> insertUser(User user) async {
    final Database db = await DatabaseHelper.instance.database;

    await db.insert(
      'User',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> findAll() async {
    final Database db = await DatabaseHelper.instance.database;
    return await db.query('User');
  }

  Future<List<Map<String, dynamic>>> findById(String id) async {
    final Database db = await DatabaseHelper.instance.database;
    return await db.query('User', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> deleteAll() async {
    final Database db = await DatabaseHelper.instance.database;

    await db.rawQuery('DELETE FROM User ');
  }

  Future<int> delete(String where) async {
    final Database db = await DatabaseHelper.instance.database;
    return await db.delete('User', where: where);
  }

  Future<void> update(User user) async {
    final Database db = await DatabaseHelper.instance.database;
    await db.update(
      'User',
      user.toMap(),
      where: "id = ?",
      whereArgs: [user.id],
    );
  }
}
