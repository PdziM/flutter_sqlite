import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  final String title;
  final String body;

  const NoteCard({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 10),
        child: Column(
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: textTheme.titleMedium!
                  .copyWith(fontSize: 21, color: Colors.white),
            ),
            const Divider(
                thickness: 1, indent: 16, endIndent: 16, color: Colors.white),
            Text(
              body,
              textAlign: TextAlign.left,
              style: textTheme.bodyLarge!
                  .copyWith(fontSize: 18, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
