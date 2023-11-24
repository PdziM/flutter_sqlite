import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sql_app/presentation/shared/buttons/custom_icon_button.dart';

import '../../../../core/constants/mapping_colors.dart';

class NoteCard extends StatelessWidget {
  final String title;
  final String body;

  const NoteCard({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        child: Card(
          elevation: 5,
          clipBehavior: Clip.antiAlias,
          color: ColorsConstants.primary100,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
            child: Column(
              children: [
                AutoSizeText(
                  title,
                  textAlign: TextAlign.center,
                  style: textTheme.titleMedium!
                      .copyWith(fontSize: 21, color: Colors.white),
                ),
                const Divider(
                    thickness: 1,
                    indent: 16,
                    endIndent: 16,
                    color: Colors.white),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 11),
                  child: AutoSizeText(
                    body,
                    textAlign: TextAlign.left,
                    style: textTheme.bodyLarge!
                        .copyWith(fontSize: 18, color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 11),
                  child: ButtonBar(
                    alignment: MainAxisAlignment.spaceAround,
                    layoutBehavior: ButtonBarLayoutBehavior.constrained,
                    children: [
                      CustomIconButton(
                        iconData: Icons.edit,
                        iconColor: Colors.white,
                        onTap: () {},
                      ),
                      CustomIconButton(
                        iconData: Icons.delete,
                        iconColor: Colors.white,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
