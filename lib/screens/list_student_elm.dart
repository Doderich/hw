import 'package:flutter/material.dart';

class ListStudentElm extends StatefulWidget {
  final int studentId;

  const ListStudentElm(this.studentId);

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
          title: Text(
            'Student Name ${widget.studentId}',
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
