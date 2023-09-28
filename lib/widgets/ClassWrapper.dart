import 'package:flutter/material.dart';
import 'package:pi_6_semestre/widgets/CardCategory.dart';
import 'package:reorderables/reorderables.dart';
import 'package:pi_6_semestre/models/CategoryModel.dart';

class ClassWrapper extends StatefulWidget {
  @override
  _ClassWrapperState createState() => _ClassWrapperState();
}

class _ClassWrapperState extends State<ClassWrapper> {
  final double _iconSize = 20;
  CategoryModel categoriaFake = CategoryModel(
      1, 'title', 'pi_6_semestre/assets/images/category/example.png');
  List<Widget> _categorias = List<Widget>.generate(1, (index) => null);

  @override
  void initState() {
    super.initState();
    _categorias.add(CardCategory(categoriaFake));
    // _categorias = <Widget>[
    //   Icon(Icons.filter_1, size: _iconSize),
    //   Icon(Icons.filter_2, size: _iconSize),
    //   Icon(Icons.filter_3, size: _iconSize),
    //   Icon(Icons.filter_4, size: _iconSize),
    //   Icon(Icons.filter_5, size: _iconSize),
    //   Icon(Icons.filter_6, size: _iconSize),
    //   Icon(Icons.filter_7, size: _iconSize),
    //   Icon(Icons.filter_8, size: _iconSize),
    //   Icon(Icons.filter_9, size: _iconSize),
    // ];
  }

  @override
  Widget build(BuildContext context) {
    void _onReorder(int oldIndex, int newIndex) {
      setState(() {
        Widget row = _categorias.removeAt(oldIndex);
        _categorias.insert(newIndex, row);
      });
    }

    var wrap = ReorderableWrap(
        spacing: 8.0,
        runSpacing: 4.0,
        padding: const EdgeInsets.all(8),
        children: _categorias,
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
      children: <Widget>[
        wrap,
      ],
    );

    return SingleChildScrollView(
      child: column,
    );
  }
}
