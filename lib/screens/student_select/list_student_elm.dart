import 'package:flutter/material.dart';
import 'package:hw/models/student.dart';

class ListStudentElm extends StatefulWidget {
  final Student student;

  const ListStudentElm({super.key, required this.student});

  @override
  State<ListStudentElm> createState() => _ListStudentElmState();
}

class _ListStudentElmState extends State<ListStudentElm> {
  bool _selected = false;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Expanded(
        child: ListTile(
          tileColor: _selected ? Colors.green[300] : null,
          title: Text(
            widget.student.name,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          trailing: Icon(
            _selected ? Icons.done : Icons.add,
            color: Colors.black,
          ),
          onTap: (() {
            setState(() {
              if (_selected) {
                _selected = false;
              } else {
                _selected = true;
              }
            });
          }),
        ),
      )
    ]);
  }
}
