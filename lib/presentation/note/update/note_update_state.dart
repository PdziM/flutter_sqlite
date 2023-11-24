import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/note_entity.dart';
import '../../../services/sqflite/interfaces/database_sql_interface.dart';

class NoteUpdateState extends ChangeNotifier {
  final BuildContext context;
  bool isLoading = false;
  final NoteEntity note;
  final void Function() onFinish;

  final String createTableQuery =
      'CREATE TABLE notes(id TEXT PRIMARY KEY, title TEXT NOT NULL, description TEXT NOT NULL)';
  final String table = 'notes';

  NoteUpdateState(this.context, this.note, this.onFinish) {
    init();
  }

  init() {
    updateField();
  }

  void updateField() {
    titleController.text = note.title;
    title = note.title;
    descriptionController.text = note.description;
    description = note.description;
    notifyListeners();
  }

  //! TITLE
  String? title;
  TextEditingController titleController = TextEditingController();
  bool get isTitleValid => title != null && title!.isNotEmpty;
  void setTitle(String value) {
    title = value;
    notifyListeners();
  }

  //! BODY
  String? description;
  TextEditingController descriptionController = TextEditingController();
  bool get isDescriptionValid => description != null && description!.isNotEmpty;
  void setBody(String value) {
    description = value;
    notifyListeners();
  }

  void noteUpdate() async {
    isLoading = true;
    notifyListeners();

    NoteEntity noteEntity =
        NoteEntity(id: note.id, title: title!, description: description!);

    final res = await context.read<DatabaseSqlInterface>().update(
        createTableQuery: createTableQuery,
        table: table,
        map: noteEntity.toMap());
    res.fold((l) {}, (r) {
      onFinish();
      Navigator.of(context).pop();
    });

    isLoading = false;
    notifyListeners();
  }
}
