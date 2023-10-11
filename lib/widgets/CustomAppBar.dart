import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onSettingsPressed;
  final VoidCallback onBackButtonPressed;

  @override
  final Size preferredSize;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.onSettingsPressed,
    required this.onBackButtonPressed,
  })  : preferredSize = const Size.fromHeight(130),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40, top: 53),
      child: AppBar(
        toolbarHeight: 130,
        backgroundColor: const Color.fromARGB(255, 255, 245, 192),
        // backgroundColor: Color.fromARGB(255, 158, 140, 51),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leadingWidth: 70,
        title: Padding(
          padding: const EdgeInsets.only(top: 0),
          child: Text(title,
              style: new TextStyle(fontSize: 30, fontFamily: 'Khand')),
        ),
        leading: CircleAvatar(
          radius: 35,
          backgroundColor: const Color.fromARGB(255, 255, 193, 7),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              size: 50,
              color: Colors.white,
            ),
            onPressed: onBackButtonPressed,
          ),
        ),

        actions: [
          CircleAvatar(
            radius: 35,
            backgroundColor: const Color.fromARGB(255, 255, 193, 7),
            child: IconButton(
              icon: const Icon(
                Icons.settings,
                size: 50,
                color: Colors.white,
              ),
              onPressed: onSettingsPressed,
            ),
          ),
        ],
      ),
    );
  }

  // @override
  // Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
