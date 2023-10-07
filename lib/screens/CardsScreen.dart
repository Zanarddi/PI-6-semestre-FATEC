import 'package:flutter/material.dart';
import 'package:pi_6_semestre/models/CategoryModel.dart';
import 'package:pi_6_semestre/widgets/CardWrapper.dart';
import 'package:pi_6_semestre/widgets/CustomAppBar.dart';

class CardsScreen extends StatefulWidget {
  final CategoryModel categoria;
  const CardsScreen({required this.categoria});

  @override
  State<CardsScreen> createState() => _CardsScreen();
}

class _CardsScreen extends State<CardsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.categoria.title,
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
              CardWrapper(categoria: widget.categoria),
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
