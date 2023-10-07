import 'package:flutter/material.dart';
import 'package:pi_6_semestre/widgets/CategoryWrapper.dart';
import 'package:pi_6_semestre/widgets/CustomAppBar.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Categorias',
        onSettingsPressed: () {},
        onBackButtonPressed: () {
          _goBack(context);
        },
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CategoryWrapper(),
            ],
          ),
        ),
      ),
    );
  }

  void _goBack(BuildContext context) {
    Navigator.of(context).pop();
  }
}
