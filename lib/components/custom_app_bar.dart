import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? leadingColor;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? drawerCallback;

  const CustomAppBar({
    this.title,
    this.backgroundColor,
    this.leadingIcon,
    this.leadingColor,
    this.textColor,
    this.actions,
    this.drawerCallback,
  });

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      leading: Icon(
        leadingIcon,
        color: leadingColor,
      ),
      title: Text(
        title!,
        style: TextStyle(color: textColor),
      ),
      elevation: 0,
      backgroundColor: backgroundColor,
      actions: actions,
    );
  }
}
