import 'package:flutter/material.dart';
import 'package:qis_quiz/extensions/build_context_ext.dart';
import 'package:qis_quiz/utils/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  List<Widget> actions;
  Color backgroundColor;
  Color textColor;
  IconThemeData iconTheme;
  TabBar? bottom;

  CustomAppBar({
    super.key,
    required this.title,
    this.actions = const [],
    this.textColor = AppColor.backgroundColor,
    this.backgroundColor = AppColor.primaryColor,
    this.iconTheme = const IconThemeData(color: Colors.white),
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: true,
      iconTheme: iconTheme,
      title: Text(
        title,
        style: TextStyle(
          color: textColor,
          fontSize: context.deviceWidth * 0.04,
          fontWeight: FontWeight.w600,
        ),
      ),
      actions: actions,
      bottom: bottom != null
          ? PreferredSize(
              preferredSize: const Size.fromHeight(48),
              child: Container(
                color: Colors.white, // Background color for TabBar
                child: bottom,
              ),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => bottom == null
      ? const Size.fromHeight(56)
      : const Size.fromHeight(100); // Adjust height for AppBar with TabBar
}
