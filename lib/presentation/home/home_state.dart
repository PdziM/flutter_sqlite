import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/sqflite/interfaces/database_sql_interface.dart';
import '../note/create/note_creator_view.dart';

class HomeState extends ChangeNotifier {
  final BuildContext context;
  bool isLoading = false;

  HomeState(this.context) {
    init();
  }

  init() {
    notes();
  }

  void notes() async {
    isLoading = true;
    notifyListeners();

    final res = await context.read<DatabaseSqlInterface>().fetch();
    res.fold((l) {}, (r) {
      print('LIST ${r.toList().toString()}');
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
