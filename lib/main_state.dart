import 'package:flutter/material.dart';

class MainState extends ChangeNotifier {
  final BuildContext context;

  MainState(this.context);

  bool darkTheme = false;
}
