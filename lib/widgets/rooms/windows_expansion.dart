import 'package:flutter/material.dart';
import 'package:hotel_app/data/room_data.dart';
import 'package:provider/provider.dart';

class WindowsFilterExpansion extends StatefulWidget {
  final List getList;
  const WindowsFilterExpansion({Key? key, required this.getList})
      : super(key: key);

  @override
  State<WindowsFilterExpansion> createState() => _WindowsFilterExpansionState();
}

class _WindowsFilterExpansionState extends State<WindowsFilterExpansion> {
  late String _getValue;
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
                    _getValue = e['name'];
                    if (_selected.contains(_getValue)) {
                      _selected.remove(_getValue);
                    } else {
                      _selected.add(_getValue);
                    }

                    print(_selected);
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
