import 'package:flutter/material.dart';
import 'package:reorderables/reorderables.dart';

class ClassWrapper extends StatefulWidget {
  @override
  _ClassWrapperState createState() => _ClassWrapperState();
}

class _ClassWrapperState extends State<ClassWrapper> {
  final double _iconSize = 90;
  late List<Widget> _categorias;

  @override
  void initState() {
    super.initState();
    _categorias = <Widget>[
      Icon(Icons.filter_1, size: _iconSize),
      Icon(Icons.filter_2, size: _iconSize),
      Icon(Icons.filter_3, size: _iconSize),
      Icon(Icons.filter_4, size: _iconSize),
      Icon(Icons.filter_5, size: _iconSize),
      Icon(Icons.filter_6, size: _iconSize),
      Icon(Icons.filter_7, size: _iconSize),
      Icon(Icons.filter_8, size: _iconSize),
      Icon(Icons.filter_9, size: _iconSize),
    ];
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
        ButtonBar(
          alignment: MainAxisAlignment.start,
          children: <Widget>[
            IconButton(
              iconSize: 50,
              icon: Icon(Icons.add_circle),
              color: Colors.deepOrange,
              padding: const EdgeInsets.all(0.0),
              onPressed: () {
                var newTile = Icon(Icons.filter_9_plus, size: _iconSize);
                setState(() {
                  _categorias.add(newTile);
                });
              },
            ),
            IconButton(
              iconSize: 50,
              icon: Icon(Icons.remove_circle),
              color: Colors.teal,
              padding: const EdgeInsets.all(0.0),
              onPressed: () {
                setState(() {
                  _categorias.removeAt(0);
                });
              },
            ),
          ],
        ),
      ],
    );

    return SingleChildScrollView(
      child: column,
    );
  }
}
