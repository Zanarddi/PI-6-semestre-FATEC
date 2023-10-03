import 'package:flutter/material.dart';
import 'package:pi_6_semestre/widgets/CategoryWrapper.dart';
import 'package:pi_6_semestre/models/CategoryModel.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Categories'),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CategoryWrapper(),
              ElevatedButton(
                  onPressed: () {
                    _goBack(context);
                  },
                  child: const Text('Go Back')),
            ],
          ),
        ));
  }

  void _goBack(BuildContext context) {
    Navigator.of(context).pop();
  }
}
