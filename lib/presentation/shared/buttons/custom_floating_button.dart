import 'package:flutter/material.dart';

import '../../../core/constants/mapping_colors.dart';

class CustomFloatingButton extends StatelessWidget {
  final void Function() onPressed;
  final IconData iconData;

  const CustomFloatingButton(
      {super.key, required this.onPressed, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 60,
      child: FloatingActionButton(
        elevation: 3,
        backgroundColor: ColorsConstants.primary100,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onPressed: onPressed,
        child: Icon(
          iconData,
          size: 26,
          color: Colors.white,
        ),
      ),
    );
  }
}
