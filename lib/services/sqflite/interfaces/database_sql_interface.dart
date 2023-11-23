import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';

import '../../../domain/entities/note_entity.dart';
import '../../../domain/exceptions/custom_exception.dart';

abstract class DatabaseSqlInterface {
  Future<Database> init();
  Future<Either<CustomException, int>> insert({required NoteEntity note});
  Future<Either<CustomException, int>> update({required NoteEntity note});
  Future<Either<CustomException, int>> delete({required NoteEntity note});
  Future<Either<CustomException, List<NoteEntity>>> fetch();
}
