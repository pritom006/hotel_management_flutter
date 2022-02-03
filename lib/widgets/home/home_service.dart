// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ServiceContainer extends StatelessWidget {
  final Widget serviceIcon;
  final String serviceText;
  ServiceContainer(
      {Key? key, required this.serviceIcon, required this.serviceText});

  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        serviceIcon,
        Text(
          serviceText,
          style: TextStyle(fontSize: 18),
        )
      ],
    );
  }
}
