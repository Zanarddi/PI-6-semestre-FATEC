import 'package:flutter/material.dart';
import 'package:pi_6_semestre/widgets/CategoryWrapper.dart';
import 'package:pi_6_semestre/widgets/CustomAppBar.dart';

class CategoriesScreen extends StatefulWidget {
  final int parent;
  final String title;
  const CategoriesScreen({required this.parent, required this.title});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(
        returnBtn: !(widget.parent == 0),
        settingsBtn: true,
        title: widget.title,
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
              CategoryWrapper(
                parent: widget.parent,
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
