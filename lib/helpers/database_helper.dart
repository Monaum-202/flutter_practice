import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:test_app/models/Task.dart';

class DatabaseHelper {
  static final _databaseName = "task_db.db";
  static final _databaseVersion = 1;

  static final table = 'task';

  // Database instance
  Database? _database;

  // Singleton pattern
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Open the database
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Initialize the database
  _initDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  // Create the task table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        id INTEGER PRIMARY KEY,
        title TEXT NOT NULL,
        description TEXT NOT NULL
      )
    ''');
  }

  // Insert a task
  Future<int> insert(Task task) async {
    Database db = await instance.database;
    return await db.insert(table, task.toMap());
  }

  // Query all tasks
  Future<List<Task>> queryAllTasks() async {
    Database db = await instance.database;
    var res = await db.query(table);
    List<Task> tasks =
        res.isNotEmpty ? res.map((task) => Task.fromMap(task)).toList() : [];
    return tasks;
  }

  // Update a task
  Future<int> update(Task task) async {
    Database db = await instance.database;
    return await db.update(
      table,
      task.toMap(),
      where: 'id = ?',
      whereArgs: [task.id],
    );
  }

  // Delete a task
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: 'id = ?', whereArgs: [id]);
  }
}
