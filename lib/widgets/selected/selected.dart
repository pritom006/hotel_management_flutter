import 'dart:core';

import 'package:flutter/material.dart';
import 'package:hotel_app/data/room_class.dart';

class Selected extends StatefulWidget {
  const Selected({Key? key}) : super(key: key);

  @override
  State<Selected> createState() => _SelectedState();
}

class _SelectedState extends State<Selected> {
  String _value = '';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as SelectedData;
    //final pd = Provider.of<RoomProvider>(context).List<String> args.listname;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.red.shade300, Colors.red.shade200, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.service.toString()),
          centerTitle: true,
          backgroundColor: const Color(0xFFFF4B4B),
        ),
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            width: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...args.listname!.map((value) {
                  return RadioListTile<dynamic>(
                    activeColor: Colors.red,
                    value: value,
                    title: Text(value.toString()),
                    groupValue: _value,
                    onChanged: (val) {
                      setState(() {
                        _value = val.toString();
                      });
                    },
                  );
                }).toList(),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFFF8B4B),
                    fixedSize: const Size(180, 70),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/selected-rooms',
                        arguments: SelectedData(selectName: _value));
                  },
                  child: const Text(
                    'OK',
                    style: TextStyle(fontSize: 22),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
