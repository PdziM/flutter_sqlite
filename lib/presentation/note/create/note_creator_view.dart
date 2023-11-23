import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../shared/app_bar/custom_app_bar.dart';
import '../../shared/buttons/custom_button.dart';
import '../../shared/inputs/custom_text_area.dart';
import '../../shared/inputs/custom_text_field.dart';
import '../../shared/label/custom_title.dart';
import 'note_creator_state.dart';

class NoteCreatorView extends StatelessWidget {
  const NoteCreatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NoteCreatorState(context),
      child: Consumer<NoteCreatorState>(
        builder: (_, state, __) {
          return Scaffold(
              appBar: CustomAppBar(
                title: 'Create notes',
                leading: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Column(
                    children: [
                      const CustomTitle(title: 'What are you thinking?'),
                      const SizedBox(height: 8),
                      CustomTextField(),
                      const SizedBox(height: 8),
                      CustomTextArea(
                        controller: TextEditingController(),
                      ),
                      const SizedBox(height: 16),
                      CustomButton(
                        title: 'Create',
                        showRadius: true,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}