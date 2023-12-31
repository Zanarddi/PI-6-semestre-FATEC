import 'package:flutter/material.dart';
import 'package:pi_6_semestre/models/CategoryModel.dart';
import 'package:pi_6_semestre/screens/CardsScreen.dart';
import 'package:pi_6_semestre/helpers/DataBaseHelper.dart';
import 'package:pi_6_semestre/screens/CategoriesScreen.dart';

class CategoryCard extends StatelessWidget {
  late CategoryModel _categoria;
  final String defaultPath = "assets/images/category/example.png";
  CategoryCard(CategoryModel categoria) {
    _categoria = categoria;
  }

  String getImage() {
    return "assets/images/category/${_categoria.imagePath}.jpg";
  }

  CategoryModel get categoria => _categoria;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double cardWidth = width * 0.46;
    return GestureDetector(
      onTap: () => {_tapHandler(context)},
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
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    _categoria.title,
                    style: const TextStyle(
                        fontSize: 22.0, // Tamanho da fonte do título
                        fontFamily: 'Khand',
                        fontWeight: FontWeight.bold // Negrito do título
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _tapHandler(BuildContext context) async {
    // verificar se no banco existem categorias com essa categoria como parent
    if (await DataBaseHelper.instance.checkParent(_categoria.id)) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) =>
              CategoriesScreen(parent: _categoria.id, title: _categoria.title),
        ),
      );
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => CardsScreen(categoria: _categoria),
        ),
      );
    }
  }

  Future<void> updateIndex(int newIndex) async {
    print('${_categoria.title} - ${_categoria.indx} - $newIndex');
    await DataBaseHelper.instance.updateIndexCategory(_categoria.id, newIndex);
  }
}
