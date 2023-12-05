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
        returnBtn: true,
        settingsBtn: true,
        title: widget.categoria.title,
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
}
