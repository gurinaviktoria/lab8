import 'package:sqflite/sqflite.dart';
import '../database/app_database.dart';
import '../models/person.dart';

class PersonRepository {
  static final PersonRepository instance = PersonRepository._init();
  PersonRepository._init();

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future<int> insert(Person p) async {
    final db = await _db;
    return db.insert('people', p.toMap());
  }

  Future<List<Person>> getAll() async {
    final db = await _db;
    final result = await db.query('people');
    return result.map((r) => Person.fromMap(r)).toList();
  }

  Future<int> update(Person p) async {
    final db = await _db;
    return db.update('people', p.toMap(), where: 'id = ?', whereArgs: [p.id]);
  }

  Future<int> delete(int id) async {
    final db = await _db;
    return db.delete('people', where: 'id = ?', whereArgs: [id]);
  }
}
