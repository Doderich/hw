import 'package:flutter/material.dart';

class CustDropDownButton extends StatefulWidget {
  var itemList;
  var dropdownvalue;
  CustDropDownButton(this.itemList, this.dropdownvalue);

  @override
  State<CustDropDownButton> createState() => _CustDropDownButtonState();
}

class _CustDropDownButtonState extends State<CustDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Color.fromARGB(255, 190, 185, 185),
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: DropdownButton(
        itemHeight: 50.0,
        isExpanded: true,
        value: widget.dropdownvalue,
        items: widget.itemList.map<DropdownMenuItem<String>>((String itemList) {
          return DropdownMenuItem(
            value: itemList,
            child: SizedBox(
              width: 200.0,
              child: Text(
                itemList,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
          );
        }).toList(),
        icon: const Icon(Icons.keyboard_arrow_down),
        onChanged: ((newValue) {
          setState(() {
            print(newValue.toString() + " ");
            print(widget.dropdownvalue);
            widget.dropdownvalue = newValue!;
          });
        }),
      ),
    );
  }
}
