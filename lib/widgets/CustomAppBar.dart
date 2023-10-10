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
    return PreferredSize(
      preferredSize: Size.fromHeight(150.0),
      // child: Padding(
      //   padding: const EdgeInsets.only(top: 0),
      child: AppBar(
        // toolbarHeight: 100.0,
        backgroundColor: Color.fromARGB(255, 255, 245, 192),
        // backgroundColor: Color.fromARGB(255, 158, 140, 51),
        centerTitle: true,
        title: Text(title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: onBackButtonPressed,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: onSettingsPressed,
          ),
        ],
      ),
      // ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
