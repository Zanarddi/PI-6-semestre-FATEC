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
      padding: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
      // padding: const EdgeInsets.only(left: 40, right: 40, top: 30, bottom: 30),
      child: AppBar(
        toolbarHeight: 130,
        backgroundColor: const Color.fromARGB(255, 255, 245, 192),
        // backgroundColor: Color.fromARGB(255, 158, 140, 51),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leadingWidth:
            110, //deve considerar o padding do lead e 2 vezes o raio do circleAvatar
        title: Padding(
          padding: const EdgeInsets.only(top: 0, left: 0),
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 68,
                fontFamily: 'Khand',
                fontWeight: FontWeight.normal),
          ),
        ),

        leading: Padding(
          padding: const EdgeInsets.only(left: 40, right: 0, top: 0, bottom: 0),
          child: CircleAvatar(
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
        ),

        actions: [
          Padding(
            padding:
                const EdgeInsets.only(left: 0, right: 40, top: 0, bottom: 0),
            child: CircleAvatar(
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
          ),
        ],
      ),
    );
  }

  // @override
  // Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
