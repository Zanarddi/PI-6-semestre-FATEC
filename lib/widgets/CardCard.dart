import 'package:flutter/material.dart';
import 'package:pi_6_semestre/models/CardModel.dart';

class CardCard extends StatelessWidget {
  late CardModel _card;
  final String defaultPath = "assets/images/category/example.png";

  CardCard(CardModel card) {
    _card = card;
  }

  String getImage() {
    return "assets/images/cards/${_card.imagePath}.jpg";
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 300,
        child: Card(
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 3, // Sombra do card
          child: Column(
            children: <Widget>[
              Image.asset(
                // defaultPath,
                getImage(),
                fit: BoxFit.cover, // Ajustar a imagem dentro do card
                height: 300,
                width: 300, // Altura da imagem
              ),
              Padding(
                padding: const EdgeInsets.all(10.0), // Espaçamento interno
                child: Text(
                  _card.title,
                  style: const TextStyle(
                    fontSize: 16.0, // Tamanho da fonte do título
                    fontWeight: FontWeight.bold, // Negrito do título
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
