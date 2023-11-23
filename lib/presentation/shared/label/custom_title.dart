import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String title;

  const CustomTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AutoSizeText(
      title,
      style: textTheme.displaySmall!.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black54,
      ),
      textAlign: TextAlign.center,
    );
  }
}
