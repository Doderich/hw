import 'package:flutter/material.dart';
import 'package:hw/screens/list_student_elm.dart';
import 'package:hw/screens/radio_test.dart';

enum Classes { Klasse5, Klasse10, Klasse6 }

class MainScreen extends StatelessWidget {
  final List<int> items = List<int>.generate(100, (index) => 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
          title: Text(
        "Home Work Forgotten",
        style: Theme.of(context).appBarTheme.titleTextStyle,
      )),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 200.0, maxHeight: 200.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RadioListView(
                    title: 'Klasse',
                    group: const ['Klasse 1', 'Klasse 2', 'Klasse 3']),
                RadioListView(
                    title: 'Fach', group: const ['Fach 1', 'Fach 2', 'Fach 3'])
              ],
            ),
          ),
          Container(
            decoration: const BoxDecoration(color: Colors.amber),
            constraints: const BoxConstraints(
              maxWidth: 300,
              maxHeight: 200,
            ),
            child: ListView.builder(
              itemCount: items.length,
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              itemBuilder: (context, index) => ListStudentElm(index),
            ),
          )
        ],
      ),
    );
  }
}
