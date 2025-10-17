import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/task.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _db;
  DatabaseHelper._init();

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await _initDB('tasks.db');
    return _db!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''CREATE TABLE tasks(
id INTEGER PRIMARY KEY AUTOINCREMENT,
title TEXT,
desc TEXT,
category TEXT,
dueDate TEXT,
priority TEXT,
status TEXT,
progress INTEGER
)''');
  }

  Future<Task> insert(Task t) async {
    final database = await db;
    final id = await database.insert('tasks', t.toMap());
    t.id = id;
    return t;
  }

  Future<List<Task>> getAll() async {
    final database = await db;
    final res = await database.query('tasks', orderBy: 'id DESC');
    return res.map((m) => Task.fromMap(m)).toList();
  }

  Future<int> update(Task t) async {
    final database = await db;
    return await database.update(
      'tasks',
      t.toMap(),
      where: 'id = ?',
      whereArgs: [t.id],
    );
  }

  Future<int> delete(int id) async {
    final database = await db;
    return await database.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }
}
