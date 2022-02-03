import 'package:flutter/material.dart';
import 'package:hotel_app/data/room_class.dart';
import 'package:hotel_app/data/room_data.dart';
import 'package:provider/provider.dart';

class RoomFilterExpansion extends StatefulWidget {
  final List getList;
  RoomFilterExpansion({Key? key, required this.getList}) : super(key: key);

  @override
  State<RoomFilterExpansion> createState() => _RoomFilterExpansionState();
}

class _RoomFilterExpansionState extends State<RoomFilterExpansion> {
  var _getValue;
  @override
  Widget build(BuildContext context) {
    final List _selected = Provider.of<RoomProvider>(context).selectedData;

    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1.0))),
      child: ExpansionTile(
        textColor: Colors.black,
        title: Text('Selected Bed'),
        children: [
          ...widget.getList.map((e) {
            return Container(
              margin: EdgeInsets.zero,
              width: double.infinity,
              decoration:
                  BoxDecoration(border: Border(bottom: BorderSide(width: 1.0))),
              child: TextButton(
                style: TextButton.styleFrom(),
                onPressed: () {
                  setState(() {
                    Navigator.of(context).pushNamed('/rooms');
                  });
                },
                child: Text(
                  e['name'],
                  style: TextStyle(color: Colors.black),
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
