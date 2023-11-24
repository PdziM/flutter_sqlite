import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/note_entity.dart';
import '../../../services/sqflite/interfaces/database_sql_interface.dart';
import '../create/note_creator_view.dart';
import '../update/note_update_view.dart';

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
        builder: (context) => NoteCreatorView(
          onFinish: () => notes(),
        ),
      ),
    );
  }

  bool buttonBarShow = false;
  void setButtonBarShow() {
    buttonBarShow = !buttonBarShow;
    notifyListeners();
  }

  void onTap() {
    print('onTap');
    buttonBarShow = !buttonBarShow;
    notifyListeners();
  }

  void callNoteUpdateView(NoteEntity note) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NoteUpdateView(
          note: note,
          onFinish: () => notes(),
        ),
      ),
    );
  }

  void noteDelete(NoteEntity note) async {
    isLoading = true;
    notifyListeners();

    final res = await context.read<DatabaseSqlInterface>().delete(note: note);
    res.fold((l) {}, (r) {
      notes();
    });

    isLoading = false;
    notifyListeners();
  }
}
