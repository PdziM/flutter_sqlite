import 'package:flutter/material.dart';

import '../note/create/note_creator_view.dart';

class HomeState extends ChangeNotifier {
  final BuildContext context;

  HomeState(this.context) {
    init();
  }

  init() {}

  void callNoteCreatorView() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const NoteCreatorView(),
      ),
    );
  }
}
