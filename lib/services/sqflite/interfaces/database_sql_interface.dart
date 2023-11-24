import 'package:dartz/dartz.dart';

import '../../../domain/entities/note_entity.dart';
import '../../../domain/exceptions/custom_exception.dart';

abstract class DatabaseSqlInterface {
  Future<Either<CustomException, int>> insert(
      {required String createTableQuery,
      required String table,
      required Map<String, dynamic> map});
  Future<Either<CustomException, int>> update(
      {required String createTableQuery,
      required String table,
      required Map<String, dynamic> map});
  Future<Either<CustomException, int>> delete(
      {required String createTableQuery,
      required String table,
      required Map<String, dynamic> map});
  Future<Either<CustomException, List<NoteEntity>>> fetch(
      {required String createTableQuery, required String table});
}
