import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../core/constants/mapping_colors.dart';

class CustomButtonText extends StatelessWidget {
  const CustomButtonText(
      {super.key,
      required this.title,
      required this.onTap,
      this.iconData,
      this.showBorder,
      this.fontSize,
      this.colorIcon});

  final String title;
  final VoidCallback onTap;
  final IconData? iconData;
  final bool? showBorder;
  final double? fontSize;
  final Color? colorIcon;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: showBorder == true
            ? BorderRadius.circular(0)
            : BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            border: showBorder == true
                ? Border.all(
                    width: 1,
                    color: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black)
                : null,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
            child: Material(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconData == null
                      ? Container()
                      : Icon(iconData!,
                          size: 20,
                          color: colorIcon ?? ColorsConstants.primary200),
                  iconData == null ? Container() : Container(width: 8),
                  AutoSizeText(title,
                      maxLines: 1,
                      minFontSize: fontSize ?? 12,
                      maxFontSize: fontSize ?? 16,
                      style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
