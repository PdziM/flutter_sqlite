import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sql_app/presentation/shared/app_bar/custom_app_bar.dart';

import '../../shared/buttons/custom_floating_button.dart';
import '../../shared/buttons/custom_icon_button.dart';
import '../../shared/label/custom_title.dart';
import 'components/note_card.dart';
import 'note_list_state.dart';

class NoteListView extends StatelessWidget {
  const NoteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NoteListState(context),
      child: Consumer<NoteListState>(
        builder: (_, state, __) {
          return Scaffold(
            appBar: const CustomAppBar(title: 'Notes'),
            floatingActionButton: CustomFloatingButton(
              onPressed: state.callNoteCreatorView,
              iconData: Icons.add,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Column(
                  children: [
                    const CustomTitle(title: 'What did you think?'),
                    const SizedBox(height: 8),
                    if (state.isLoading) ...[
                      const Center(child: CircularProgressIndicator.adaptive())
                    ] else if (state.notesEntities.isEmpty) ...[
                      const Center(child: Text('No notes found'))
                    ] else ...[
                      ...state.notesEntities
                          .map(
                            (e) => NoteCard(
                              note: e,
                              buttonBar: state.buttonBarShow,
                              onTap: state.onTap,
                              actions: [
                                CustomIconButton(
                                  iconData: Icons.edit,
                                  iconColor: Colors.white,
                                  onTap: () => state.callNoteUpdateView(e),
                                ),
                                CustomIconButton(
                                  iconData: Icons.delete,
                                  iconColor: Colors.white,
                                  onTap: () => state.noteDelete(e),
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ],
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
