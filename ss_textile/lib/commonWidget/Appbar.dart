import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final Color titleColor;
  final Color? leadingColor; // New parameter for leading icon color
  final Widget? trailing;
  const CustomAppBar({
    Key? key,
    required this.title,
    this.backgroundColor = Colors.white,
    this.titleColor = Colors.black,
    this.leadingColor, // Update constructor to accept leading icon color
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      title: Text(
        title,
        style: TextStyle(color: titleColor),
      ),
      iconTheme: IconThemeData(color: leadingColor ?? Colors.black), 
      actions: [trailing ?? Container()]
      
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
