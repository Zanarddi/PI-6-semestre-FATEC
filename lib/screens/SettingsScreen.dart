import 'package:flutter/material.dart';
import 'package:pi_6_semestre/widgets/CustomAppBar.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen();

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  void _launchURL(String url) async {
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
  }

  final styleText = const TextStyle(
      fontSize: 20, fontFamily: 'Khand', fontWeight: FontWeight.normal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
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
            children: <Widget>[
              ListTile(
                textColor: Colors.black,
                titleTextStyle: styleText,
                title: const Center(
                  child: Text('Sobre nós'),
                ),
                onTap: () {
                  _launchURL('https://github.com/Zanarddi/PI-6-semestre-FATEC');
                },
              ),
              ListTile(
                textColor: Colors.black,
                titleTextStyle: styleText,
                title: const Center(
                  child: Text('Github'),
                ),
                onTap: () {
                  _launchURL('https://github.com/Zanarddi/PI-6-semestre-FATEC');
                },
              ),
              ListTile(
                textColor: Colors.black,
                titleTextStyle: styleText,
                title: const Center(
                  child: Text('Termos de Uso'),
                ),
                onTap: () {
                  _launchURL(
                      'https://github.com/Zanarddi/PI-6-semestre-FATEC/blob/main/assets/termos.txt');
                },
              ),
              ListTile(
                textColor: Colors.black,
                titleTextStyle: styleText,
                title: const Center(
                  child: Text('Entre em contato'),
                ),
                onTap: () {
                  _launchURL('https://github.com/Zanarddi/PI-6-semestre-FATEC');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void _goBack(BuildContext context) {
  //   Navigator.of(context).pop();
  // }
}
