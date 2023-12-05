import 'package:flutter/material.dart';
import 'package:pi_6_semestre/helpers/DataBaseHelper.dart';
import 'package:pi_6_semestre/models/CategoryModel.dart';
import 'package:pi_6_semestre/widgets/CategoryCard.dart';
import 'package:reorderables/reorderables.dart';

class CategoryWrapper extends StatefulWidget {
  final int parent;
  const CategoryWrapper({required this.parent});

  @override
  _CategoryWrapperState createState() => _CategoryWrapperState();
}

class _CategoryWrapperState extends State<CategoryWrapper> {
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
    categories = await DataBaseHelper.instance.getCategories(
      widget.parent,
    );
    setState(() {
      categories = categories
          .map((category) => CategoryModel(category['id'], category['indx'],
              category['title'], category['imagePath'], category['parent']))
          .toList();
      _tiles = categories
          .map<CategoryCard>((category) => CategoryCard(category))
          .toList();
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
      children: _tiles,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[wrap],
    );
  }

  void reorderIndx() {
    _tiles.whereType<CategoryCard>().forEach((categoryCard) async {
      categoryCard.categoria.indx = _tiles.indexOf(categoryCard);
      await categoryCard.updateIndex(_tiles.indexOf(categoryCard) + 1);
    });
  }
}
