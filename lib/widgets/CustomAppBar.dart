import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onSettingsPressed;
  final VoidCallback onBackButtonPressed;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.onSettingsPressed,
    required this.onBackButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: onBackButtonPressed,
      ),
      title: Text(title),
      actions: [
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: onSettingsPressed,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
