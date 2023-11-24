import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../shared/app_bar/custom_app_bar.dart';
import '../../shared/buttons/custom_button.dart';
import '../../shared/inputs/custom_text_area.dart';
import '../../shared/inputs/custom_text_field.dart';
import '../../shared/label/custom_title.dart';
import 'note_creator_state.dart';

class NoteCreatorView extends StatelessWidget {
  final void Function() onFinish;

  const NoteCreatorView({super.key, required this.onFinish});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NoteCreatorState(context, onFinish),
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
                    CustomTextField(
                      title: 'Title',
                      hintText: 'Example: My note',
                      onChanged: state.setTitle,
                      controller: state.titleController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      // prefixIcon: const Icon(Icons.abc),
                    ),
                    const SizedBox(height: 8),
                    CustomTextArea(
                      title: 'Description',
                      hintText: 'Example: My Description',
                      onChanged: state.setBody,
                      controller: state.descriptionController,
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 16),
                    CustomButton(
                      title: 'Create',
                      showRadius: true,
                      loading: state.isLoading,
                      onPressed: state.isFormValid ? state.noteCreate : null,
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
