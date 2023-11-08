import 'package:flutter/material.dart';
import 'package:pi_6_semestre/helpers/DataBaseHelper.dart';
import 'package:pi_6_semestre/helpers/TextToSpeechHelper.dart';
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

  CardModel get card => _card;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double cardWidth = width * 0.46;
    return GestureDetector(
      onTap: () => {_tapHandler(_card.title)},
      child: SizedBox(
        width: cardWidth,
        child: Card(
          color: const Color.fromARGB(255, 255, 237, 149),
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
                height: cardWidth,
                // width: 300, // Altura da imagem
              ),
              Padding(
                padding: const EdgeInsets.all(10.0), // Espaçamento interno
                child: Text(
                  _card.title,
                  style: const TextStyle(
                      fontSize: 22.0, // Tamanho da fonte do título
                      fontFamily: 'Khand',
                      fontWeight: FontWeight.bold // Negrito do título
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateIndex(int newIndex) async {
    await DataBaseHelper.instance.updateIndexCard(_card.id, newIndex);
  }

  Future<void> _tapHandler(String title) async {
    TextToSpeechHelper.speak(title);
  }
}
