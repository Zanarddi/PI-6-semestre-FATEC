import 'package:flutter/material.dart';
import 'package:pi_6_semestre/models/CategoryModel.dart';
import 'package:pi_6_semestre/widgets/CardCategory.dart';

import 'package:reorderables/reorderables.dart';

class CategoryWrapper extends StatefulWidget {
  @override
  _CategoryWrapperState createState() => _CategoryWrapperState();
}

class _CategoryWrapperState extends State<CategoryWrapper> {
  final double _iconSize = 90;
  late List<Widget> _tiles;
  final String samplePath = 'assets/images/category/example.png';
  // CategoryModel
  @override
  void initState() {
    super.initState();
    _tiles = <Widget>[
      CardCategory(
          CategoryModel(1, 'example1', 'assets/images/category/example.png')),
      CardCategory(
          CategoryModel(2, 'example2', 'assets/images/category/example.png')),
      CardCategory(
          CategoryModel(3, 'example3', 'assets/images/category/example.png')),
      CardCategory(
          CategoryModel(4, 'example4', 'assets/images/category/example.png')),
      CardCategory(
          CategoryModel(5, 'example5', 'assets/images/category/example.png')),
      // Icon(Icons.filter_2, size: _iconSize),
      // Icon(Icons.filter_3, size: _iconSize),
      // Icon(Icons.filter_4, size: _iconSize),
      // Icon(Icons.filter_5, size: _iconSize),
      // Icon(Icons.filter_6, size: _iconSize),
      // Icon(Icons.filter_7, size: _iconSize),
      // Icon(Icons.filter_8, size: _iconSize),
      // Icon(Icons.filter_9, size: _iconSize),
    ];
  }

  @override
  Widget build(BuildContext context) {
    void _onReorder(int oldIndex, int newIndex) {
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
