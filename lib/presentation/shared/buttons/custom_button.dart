import 'package:flutter/material.dart';

import '../../../core/constants/mapping_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.title,
      this.color,
      this.height,
      this.fontSize,
      this.textColor,
      this.child,
      this.addMargin,
      this.showRadius,
      this.loading});

  final VoidCallback? onPressed;
  final String title;
  final double? fontSize;
  final double? height;
  final Color? color;
  final Color? textColor;
  final Widget? child;
  final bool? addMargin;
  final bool? showRadius;
  final bool? loading;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height ?? (56 + (addMargin == true ? 8 : 0)),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(showRadius == true ? 10 : 0),
          color: onPressed == null || loading == true
              ? Theme.of(context).brightness == Brightness.light
                  ? ColorsConstants.bg300
                  : ColorsConstants.text200
              : color ?? ColorsConstants.primary100,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: onPressed,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    child: loading == true
                        ? const Center(
                            child: CircularProgressIndicator.adaptive())
                        : Text(
                            maxLines: 1,
                            title.toUpperCase(),
                            style: TextStyle(
                                color: textColor ?? Colors.white,
                                fontSize: fontSize ?? 16,
                                fontWeight: FontWeight.bold),
                          ),
                  ),
                  addMargin == true ? Container(height: 8) : Container()
                ],
              )),
        ));
  }
}
