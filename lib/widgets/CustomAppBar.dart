import 'package:flutter/material.dart';
import 'package:pi_6_semestre/screens/SettingsScreen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool returnBtn;
  final bool settingsBtn;
  final String title;
  // final VoidCallback onSettingsPressed;
  // final VoidCallback onBackButtonPressed;

  @override
  final Size preferredSize;

  const CustomAppBar({
    Key? key,
    required this.returnBtn,
    required this.settingsBtn,
    required this.title,
    // required this.onSettingsPressed,
    // required this.onBackButtonPressed,
  })  : preferredSize = const Size.fromHeight(120),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
      // padding: const EdgeInsets.only(left: 40, right: 40, top: 30, bottom: 30),
      child: AppBar(
        toolbarHeight: 120,
        backgroundColor: const Color.fromARGB(255, 255, 245, 192),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leadingWidth:
            65, //deve considerar o padding do lead e 2 vezes o raio do circleAvatar
        title: Padding(
          padding: const EdgeInsets.only(top: 0, left: 0),
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 40,
                fontFamily: 'Khand',
                fontWeight: FontWeight.normal),
          ),
        ),
        leading: returnBtn == true
            ? Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 0, top: 0, bottom: 0),
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: const Color.fromARGB(255, 255, 193, 7),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.white,
                    ),
                    onPressed: () => {_goBack(context)},
                  ),
                ),
              )
            : null,

        actions: [
          Padding(
              padding:
                  const EdgeInsets.only(left: 0, right: 15, top: 0, bottom: 0),
              child: settingsBtn == true
                  ? CircleAvatar(
                      radius: 25,
                      backgroundColor: const Color.fromARGB(255, 255, 193, 7),
                      child: IconButton(
                        icon: const Icon(
                          Icons.settings,
                          size: 30,
                          color: Colors.white,
                        ),
                        onPressed: () => {_tapHandler(context)},
                      ),
                    )
                  : null),
        ],
      ),
    );
  }

  Future<void> _tapHandler(BuildContext context) async {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => SettingsScreen(),
      ),
    );
  }

  void _goBack(BuildContext context) {
    Navigator.of(context).pop();
  }
}
