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

  @override
  Future<Either<CustomException, Database>> init() async {
    try {
      var databasesPath = await getDatabasesPath();
      String path = join(databasesPath, _dbName);

      Database database = await openDatabase(path, version: _version,
          onCreate: (Database db, int version) async {
        await db.execute(
            'CREATE TABLE notes(id TEXT PRIMARY KEY, title TEXT NOT NULL, description TEXT NOT NULL)');
      });

      return Right(database);
    } catch (e) {
      return Left(CustomException('Erro ao inicializar o banco de dados: $e'));
    }
  }

  @override
  Future<Either<CustomException, int>> insert(
      {required NoteEntity note}) async {
    try {
      var db = await init();

      int res = await db.fold((l) => 0, (r) async {
        return await r.insert('notes', note.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace);
      });

      return Right(res);
    } catch (e) {
      return Left(CustomException('Erro ao inserir nota: $e'));
    }
  }

  @override
  Future<Either<CustomException, int>> update(
      {required NoteEntity note}) async {
    try {
      var db = await init();

      int res = await db.fold((l) => 0, (r) async {
        return await r.update('notes', note.toMap(),
            where: 'id = ?',
            whereArgs: [note.id],
            conflictAlgorithm: ConflictAlgorithm.replace);
      });

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

      int res = await db.fold((l) => 0, (r) async {
        return await r.delete('notes', where: 'id = ?', whereArgs: [note.id]);
      });

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

      db.fold((l) => Left(CustomException(l.message)), (r) async {
        var res = await r.query('notes');

        if (res.isNotEmpty) {
          for (var item in res) {
            tempList.add(NoteEntity.fromMap(item));
          }
        }
      });

      return Right(tempList);
    } catch (e) {
      return Left(CustomException('Erro ao inserir nota: $e'));
    }
  }
}
