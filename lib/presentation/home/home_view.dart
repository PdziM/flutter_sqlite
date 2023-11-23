import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sql_app/presentation/shared/app_bar/custom_app_bar.dart';

import '../shared/buttons/custom_floating_button.dart';
import 'components/note_card.dart';
import 'home_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeState(context),
      child: Consumer<HomeState>(
        builder: (_, state, __) {
          return Scaffold(
            appBar: const CustomAppBar(title: 'Notes'),
            floatingActionButton: CustomFloatingButton(
              onPressed: state.callNoteCreatorView,
              iconData: Icons.add,
            ),
            body: const SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    NoteCard(
                      title: 'Lorem',
                      body:
                          'Lorem ipsum dolor sit amet. Quo perferendis porro et fugit Quis eum animi deleniti ab nobis sequi ea ipsum unde. Et quas velit qui quasi nemo et vero assumenda.',
                    ),
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
