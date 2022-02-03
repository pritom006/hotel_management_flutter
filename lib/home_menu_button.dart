import 'package:flutter/material.dart';

class HomeMuenuButton extends StatelessWidget {
  final String textVAlue;
  final Icon menuIcon;
  final String? route;

  HomeMuenuButton({
    Key? key,
    required this.textVAlue,
    required this.menuIcon,
    this.route,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 15.0,
          ),
          alignment: Alignment.centerLeft,
          primary: Colors.purple.shade300),
      onPressed: route != null
          ? () {
              Navigator.of(context).pushNamed(route!);
            }
          : () {},
      icon: menuIcon,
      label: Text(
        textVAlue.toString(),
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.center,
      ),
    );
  }
}
