import 'package:flutter/material.dart';
import 'package:reorderables/reorderables.dart';
import 'package:pi_6_semestre/models/CategoryModel.dart';

class CardCategory extends StatelessWidget {
  late CategoryModel _categoria;
  CardCategory(CategoryModel categoria) {
    _categoria = categoria;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3, // Sombra do card
      child: Column(
        children: <Widget>[
          Image.network(
            _categoria.imagePath,
            fit: BoxFit.cover, // Ajustar a imagem dentro do card
            height: 150, // Altura da imagem
          ),
          Padding(
            padding: EdgeInsets.all(10.0), // Espaçamento interno
            child: Text(
              _categoria.title,
              style: TextStyle(
                fontSize: 16.0, // Tamanho da fonte do título
                fontWeight: FontWeight.bold, // Negrito do título
              ),
            ),
          ),
        ],
      ),
    );
  }
}
