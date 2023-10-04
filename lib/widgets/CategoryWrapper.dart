import 'package:flutter/material.dart';
import 'package:pi_6_semestre/helpers/DataBaseHelper.dart';
import 'package:pi_6_semestre/main.dart';
import 'package:pi_6_semestre/models/CategoryModel.dart';
import 'package:pi_6_semestre/widgets/CardCategory.dart';

import 'package:reorderables/reorderables.dart';

class CategoryWrapper extends StatefulWidget {
  @override
  _CategoryWrapperState createState() => _CategoryWrapperState();
}

class _CategoryWrapperState extends State<CategoryWrapper> {
  final double _iconSize = 90;
  late List<Widget> _tiles = [];
  final String samplePath = 'assets/images/category/example.png';
  var categories;

  // CategoryModel
  @override
  void initState() {
    super.initState();
    _loadCategories();
    _tiles;
  }

  Future<void> _loadCategories() async {
    categories = await DataBaseHelper.instance.getCategories();
    setState(() {
      categories = categories
          .map((category) => CategoryModel(category['indx'], category['title'],
              category['imagePath'], category['parent']))
          .toList();
      _tiles =
          categories.map<Widget>((category) => CardCategory(category)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    void _onReorder(int oldIndex, int newIndex) {
      // TODO: implementar a troca de posições no banco de dados
      setState(() {
        Widget row = _tiles.removeAt(oldIndex);
        _tiles.insert(newIndex, row);
      });
    }

    var wrap = ReorderableWrap(
        spacing: 8.0,
        runSpacing: 4.0,
        padding: const EdgeInsets.all(8),
        children: _tiles,
        onReorder: _onReorder,
        onNoReorder: (int index) {
          //this callback is optional
          debugPrint(
              '${DateTime.now().toString().substring(5, 22)} reorder cancelled. index:$index');
        },
        onReorderStarted: (int index) {
          //this callback is optional
          debugPrint(
              '${DateTime.now().toString().substring(5, 22)} reorder started: index:$index');
        });

    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[wrap],
    );

    return SingleChildScrollView(
      child: column,
    );
  }
}
