import 'package:flutter/material.dart';
import 'package:pi_6_semestre/helpers/DataBaseHelper.dart';
import 'package:pi_6_semestre/models/CardModel.dart';
import 'package:pi_6_semestre/models/CategoryModel.dart';
import 'package:pi_6_semestre/widgets/CardCard.dart';

import 'package:reorderables/reorderables.dart';

class CardWrapper extends StatefulWidget {
  final CategoryModel categoria;
  const CardWrapper({required this.categoria});
  @override
  _CardWrapperState createState() => _CardWrapperState();
}

class _CardWrapperState extends State<CardWrapper> {
  final double _iconSize = 90;
  late List<Widget> _tiles = [];
  final String samplePath = 'assets/images/category/example.png';
  var cards;

  // CategoryModel
  @override
  void initState() {
    super.initState();
    _loadCards();
    _tiles;
  }

  Future<void> _loadCards() async {
    cards = await DataBaseHelper.instance.getCards(widget.categoria.id);
    setState(() {
      cards = cards
          .map((card) => CardModel(card['id'], card['indx'], card['category'],
              card['title'], card['imagePath']))
          .toList();
      _tiles = cards.map<Widget>((card) => CardCard(card)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    void _onReorder(int oldIndex, int newIndex) {
      setState(() {
        Widget row = _tiles.removeAt(oldIndex);
        _tiles.insert(newIndex, row);
      });
      reorderIndx();
    }

    var wrap = ReorderableWrap(
        spacing: 8.0,
        runSpacing: 4.0,
        padding: const EdgeInsets.all(8),
        onReorder: _onReorder,
        onNoReorder: (int index) {
          debugPrint(
              '${DateTime.now().toString().substring(5, 22)} reorder cancelled. index:$index');
        },
        onReorderStarted: (int index) {
          debugPrint(
              '${DateTime.now().toString().substring(5, 22)} reorder started: index:$index');
        },
        children: _tiles);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[wrap],
    );
  }

  void reorderIndx() {
    _tiles.whereType<CardCard>().forEach((cardCard) async {
      cardCard.card.indx = _tiles.indexOf(cardCard);
      await cardCard.updateIndex(_tiles.indexOf(cardCard) + 1);
    });
  }
}
