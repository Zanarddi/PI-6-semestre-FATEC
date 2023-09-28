import 'package:flutter/material.dart';
import 'package:reorderables/reorderables.dart';

class CardsScreen extends StatefulWidget {
  @override
  State<CardsScreen> createState() => _CardsScreen();
}

class _CardsScreen extends State<CardsScreen> {
  List<Widget> _cards = List.empty();
  final double _cardSize = 90;

  @override
  void initState() {
    super.initState();
    _cards = <Widget>[
      Icon(Icons.filter_1, size: _cardSize),
      Icon(Icons.filter_2, size: _cardSize),
      Icon(Icons.filter_3, size: _cardSize),
      Icon(Icons.filter_4, size: _cardSize)
    ];
  }

  @override
  Widget build(BuildContext context) {
    void _onReorder(int oldIndex, int newIndex) {
      setState(() {
        Widget row = _cards.removeAt(oldIndex);
        _cards.insert(newIndex, row);
      });
    }

    var wrap = ReorderableWrap(
      spacing: 8.0,
      runSpacing: 4.0,
      padding: const EdgeInsets.all(8),
      children: _cards,
      onReorder: _onReorder,
      onNoReorder: (int index) {
        debugPrint(
            '${DateTime.now().toString().substring(5, 22)} reorder cancelled. index:$index');
      },
      onReorderStarted: (int index) {
        debugPrint(
            '${DateTime.now().toString().substring(5, 22)} reorder started: index:$index');
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            wrap,
            const Text(
              'You have pushed the button this many times:',
            ),
            ElevatedButton(
                onPressed: () {
                  _goBack(context);
                },
                child: const Text('Go Back')),
            IconButton(
              iconSize: 50,
              icon: Icon(Icons.add_circle),
              color: Colors.deepOrange,
              padding: const EdgeInsets.all(0.0),
              onPressed: () {
                var newTile = Icon(Icons.filter_9_plus, size: _cardSize);
                setState(() {
                  _cards.add(newTile);
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
                  _cards.removeAt(0);
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _goBack(BuildContext context) {
    Navigator.of(context).pop();
  }
}
