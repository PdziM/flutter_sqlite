import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/note_entity.dart';
import '../../../services/sqflite/interfaces/database_sql_interface.dart';
import '../create/note_creator_view.dart';

class NoteListState extends ChangeNotifier {
  final BuildContext context;
  bool isLoading = false;

  NoteListState(this.context) {
    init();
  }

  init() {
    notes();
  }

  List<NoteEntity> notesEntities = [];

  void notes() async {
    isLoading = true;
    notifyListeners();

    final res = await context.read<DatabaseSqlInterface>().fetch();
    res.fold((l) {}, (r) {
      notesEntities = r;
      notifyListeners();
    });

    isLoading = false;
    notifyListeners();
  }

  void callNoteCreatorView() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const NoteCreatorView(),
      ),
    );
  }
}
