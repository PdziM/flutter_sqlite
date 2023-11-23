import 'package:dartz/dartz.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sql_app/domain/entities/note_entity.dart';

import '../../domain/exceptions/custom_exception.dart';
import 'interfaces/database_sql_interface.dart';

class DatabaseService extends DatabaseSqlInterface {
  static const int _version = 1;
  static const String _dbName = 'notes.db';

  DatabaseService();

  Database? _database;

  @override
  Future<Database> init() async {
    if (_database != null) return _database!;
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, _dbName);

    _database = await openDatabase(path, version: _version,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE notes(id TEXT PRIMARY KEY, title TEXT NOT NULL, description TEXT NOT NULL)');
    });

    return _database!;
  }

  @override
  Future<Either<CustomException, int>> insert(
      {required NoteEntity note}) async {
    try {
      print('NOTE ${note.toMap()}');
      Database db = await init();

      int res = await db.insert('notes', note.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
      print(res);
      return Right(res);
    } catch (e) {
      return Left(CustomException('Erro ao inserir nota: $e'));
    }
  }

  @override
  Future<Either<CustomException, int>> update(
      {required NoteEntity note}) async {
    try {
      Database db = await init();

      int res = await db.update(
        'notes',
        note.toMap(),
        where: 'id = ?',
        whereArgs: [note.id],
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      return Right(res);
    } catch (e) {
      return Left(CustomException('Erro ao inserir nota: $e'));
    }
  }

  @override
  Future<Either<CustomException, int>> delete(
      {required NoteEntity note}) async {
    try {
      var db = await init();

      int res = await db.delete(
        'notes',
        where: 'id = ?',
        whereArgs: [note.id],
      );

      return Right(res);
    } catch (e) {
      return Left(CustomException('Erro ao inserir nota: $e'));
    }
  }

  @override
  Future<Either<CustomException, List<NoteEntity>>> fetch(
      {required NoteEntity note}) async {
    try {
      List<NoteEntity> tempList = [];
      var db = await init();

      List<Map<String, Object?>> map = await db.query('notes');
      if (map.isNotEmpty) {
        for (var element in map) {
          tempList.add(NoteEntity.fromMap(element));
        }
      }
      return Right(tempList);
    } catch (e) {
      return Left(CustomException('Erro ao inserir nota: $e'));
    }
  }
}
