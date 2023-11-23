import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {super.key,
      required this.onTap,
      required this.iconData,
      this.color,
      this.iconColor,
      this.imgPath,
      this.iconSize,
      this.badgeInfo,
      this.enableShader,
      this.btnSize});

  final VoidCallback? onTap;
  final IconData iconData;
  final Color? color;
  final Color? iconColor;
  final String? imgPath;
  final double? iconSize;
  final String? badgeInfo;
  final bool? enableShader;
  final double? btnSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: btnSize ?? 48,
      width: btnSize ?? 48,
      decoration: BoxDecoration(
          color: color ?? Colors.transparent,
          borderRadius: BorderRadius.circular(50)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            borderRadius: BorderRadius.circular(50),
            onTap: onTap,
            child: Center(
                child: Icon(
              iconData,
              color: iconColor ?? Theme.of(context).iconTheme.color,
              size: iconSize,
            ))),
      ),
    );
  }
}
