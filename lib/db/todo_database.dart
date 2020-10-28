import 'package:flutterandroidsudio/db/todo_table.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class tododatabase {
  static const DB_NAME = 'todo.db';
  static const DB_VERSION = 1;
  static Database _database;

  tododatabase._internal();
  static final tododatabase instance = tododatabase._internal();

  Database get database => _database;

  static const initScript = [todotable.CREATE_TABLE_QUERY];
  static const migrationScript = [todotable.CREATE_TABLE_QUERY];

  init() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), DB_NAME),
      onCreate: (db, version) {
        initScript.forEach((script) async => await db.execute(script));
      },
      onUpgrade: (db, oldversion, newversion) {
        migrationScript.forEach((script) async => await db.execute(script));
      },
      version: DB_VERSION,
    );
  }
}
