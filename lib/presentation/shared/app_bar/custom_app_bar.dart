import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final Widget? leading;

  const CustomAppBar({super.key, this.title, this.actions, this.leading});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return AppBar(
      leading: leading,
      automaticallyImplyLeading: false,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      backgroundColor: Theme.of(context).primaryColor,
      centerTitle: true,
      title: title != null
          ? Text(title!.toUpperCase(),
              style: textTheme.headlineSmall!.copyWith(
                color: Colors.white,
              ))
          : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
