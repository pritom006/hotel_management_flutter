import 'package:flutter/material.dart';

class DropDownMenu extends StatefulWidget {
  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  //const DropDownMenu({Key? key}) : super(key: key);
  final _itemValue = "Bed Number";
  var _selectedValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(left: 10.0),
      width: double.infinity,
      alignment: Alignment.center,
      child: DropdownButton(
        style: TextStyle(),
        hint: Text(
          'selectd',
          textAlign: TextAlign.center,
        ),
        value: _selectedValue,
        icon: Icon(Icons.keyboard_arrow_down),
        items: ['1', ' 2', '3', '4', '5'].map((String e) {
          return DropdownMenuItem(
            child: Text(e.toString()),
            value: e,
          );
        }).toList(),
        onChanged: (newVAlue) {
          setState(() {
            _selectedValue = newVAlue.toString();
          });
        },
      ),
    );
  }
}
