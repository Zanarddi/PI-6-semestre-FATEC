import 'package:flutter/material.dart';
import 'package:pi_6_semestre/widgets/CustomAppBar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen();

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(
        returnBtn: true,
        settingsBtn: false,
        title: "Configurações",
        // onSettingsPressed: () {},
        // onBackButtonPressed: () {
        //   _goBack(context);
        // },
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[],
          ),
        ),
      ),
    );
  }

  // void _goBack(BuildContext context) {
  //   Navigator.of(context).pop();
  // }
}
