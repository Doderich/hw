import 'package:flutter/material.dart';

class RadioListView extends StatefulWidget {
  final List<String> group;
  final String title;

  RadioListView({required this.group, required this.title});

  @override
  State<RadioListView> createState() => _RadioListViewState();
}

class _RadioListViewState extends State<RadioListView> {
  // Declare this variable

  @override
  void initState() {
    super.initState();
    var selectedRadio = 0;
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  int selectedRadioTile = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.title + ' :',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: widget.group.length,
          itemBuilder: ((context, index) {
            return RadioListTile(
              value: index,
              groupValue: selectedRadioTile,
              title: Text(
                widget.group[index],
                style: Theme.of(context).textTheme.labelMedium,
              ),
              onChanged: (val) {
                print("Radio Tile pressed $val");
                setSelectedRadioTile(val!);
              },
              activeColor: Colors.black,
              selected: true,
            );
          }),
        ),
      ],
    );
  }
}
