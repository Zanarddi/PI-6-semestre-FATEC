import 'package:flutter/material.dart';
import 'package:pi_6_semestre/models/CategoryModel.dart';
import 'package:pi_6_semestre/screens/CardsScreen.dart';

class CategoryCard extends StatelessWidget {
  late CategoryModel _categoria;
  final String defaultPath = "assets/images/category/example.png";

  CategoryCard(CategoryModel categoria) {
    _categoria = categoria;
  }

  AssetImage getImage() {
    AssetImage img;
    try {
      img = AssetImage("assets/images/category/${_categoria.imagePath}.png");
    } catch (e) {
      img = AssetImage(defaultPath);
    }
    return img;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        // onTap: () => {print("Clicou na categoria ${_categoria.title}")},
        onTap: () => {_navigateToCardsScreen(context)},
        child: Card(
          elevation: 3, // Sombra do card
          child: Column(
            children: <Widget>[
              Image.asset(
                // "assets/images/category/${_categoria.imagePath}.png",
                defaultPath,
                fit: BoxFit.cover, // Ajustar a imagem dentro do card
                height: 300,
                width: 300, // Altura da imagem
              ),
              Padding(
                padding: const EdgeInsets.all(10.0), // Espaçamento interno
                child: Text(
                  _categoria.title,
                  style: const TextStyle(
                    fontSize: 16.0, // Tamanho da fonte do título
                    fontWeight: FontWeight.bold, // Negrito do título
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void _navigateToCardsScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => CardsScreen(categoria: _categoria)));
  }
}
