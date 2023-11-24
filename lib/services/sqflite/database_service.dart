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

  Future<Database> _init({required String createTableQuery}) async {
    try {
      if (_database != null) return _database!;
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, _dbName);

      _database = await openDatabase(path, version: _version,
          onCreate: (Database db, int version) async {
        await db.execute(createTableQuery);
      });

      return _database!;
    } catch (e) {
      print('Erro ao inicializar o banco de dados: $e');
      rethrow;
    }
  }

  @override
  Future<Either<CustomException, int>> insert(
      {required String createTableQuery,
      required String table,
      required Map<String, dynamic> map}) async {
    try {
      Database db = await _init(createTableQuery: createTableQuery);

      int res = await db.insert(table, map,
          conflictAlgorithm: ConflictAlgorithm.replace);
      return Right(res);
    } catch (e) {
      return Left(CustomException('Erro ao inserir nota: $e'));
    }
  }

  @override
  Future<Either<CustomException, int>> update(
      {required String createTableQuery,
      required String table,
      required Map<String, dynamic> map}) async {
    try {
      Database db = await _init(createTableQuery: createTableQuery);

      int res = await db.update(
        table,
        map,
        where: 'id = ?',
        whereArgs: [map['id']],
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      return Right(res);
    } catch (e) {
      return Left(CustomException('Erro ao inserir nota: $e'));
    }
  }

  @override
  Future<Either<CustomException, int>> delete(
      {required String createTableQuery,
      required String table,
      required Map<String, dynamic> map}) async {
    try {
      Database db = await _init(createTableQuery: createTableQuery);

      int res = await db.delete(
        table,
        where: 'id = ?',
        whereArgs: [map['id']],
      );

      return Right(res);
    } catch (e) {
      return Left(CustomException('Erro ao inserir nota: $e'));
    }
  }

  @override
  Future<Either<CustomException, List<NoteEntity>>> fetch(
      {required String createTableQuery, required String table}) async {
    try {
      List<NoteEntity> tempList = [];
      Database db = await _init(createTableQuery: createTableQuery);

      List<Map<String, Object?>> map = await db.query(table);
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
