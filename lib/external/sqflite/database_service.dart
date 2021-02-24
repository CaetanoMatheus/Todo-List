import 'package:todo_list/external/sqflite/migrations/on_database_create_sqls.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  final String _databaseName = 'todo_list.db';
  final int _databaseVersion = 1;

  static DatabaseService _instance;

  Database _database;

  DatabaseService._();

  Future<String> _getDatabasePath() async {
    final databasesPath = await getDatabasesPath();
    return join(databasesPath, this._databaseName);
  }

  Future<Database> _initDatabase() async {
    final databasePath = await this._getDatabasePath();
    return await openDatabase(
      databasePath,
      version: this._databaseVersion,
      onCreate: this._onDatabaseCreate,
    );
  }

  Future<void> _onDatabaseCreate(Database database, int version) async {
    for (final sql in onDatabaseCreate['v$version']) {
      await database.execute(sql);
    }
  }

  Future<void> destroyDatabase() async {
    await deleteDatabase(await this._getDatabasePath());
  }

  Future<Database> get database async {
    if (this._database == null) this._database = await this._initDatabase();
    return this._database;
  }

  static DatabaseService get instance {
    if (_instance == null) _instance = DatabaseService._();
    return _instance;
  }
}
