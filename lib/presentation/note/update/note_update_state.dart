import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../../../domain/entities/note_entity.dart';
import '../../../services/sqflite/interfaces/database_sql_interface.dart';

class NoteUpdateState extends ChangeNotifier {
  final BuildContext context;
  bool isLoading = false;

  NoteUpdateState(this.context) {
    init();
  }

  init() {}

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

  bool get isFormValid => (isTitleValid && isDescriptionValid && !isLoading);
  void noteCreate() async {
    isLoading = true;
    notifyListeners();

    var uuid = const Uuid();
    String uniqueId = uuid.v4();

    final res = await context.read<DatabaseSqlInterface>().insert(
        note:
            NoteEntity(id: uniqueId, title: title!, description: description!));
    res.fold((l) {}, (r) {
      print('AQUI $r');
      Navigator.of(context).pop();
    });

    isLoading = false;
    notifyListeners();
  }
}
