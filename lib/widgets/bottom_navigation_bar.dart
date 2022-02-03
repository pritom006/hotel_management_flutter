import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          OneTextButton(
            routeName: '/',
            buttonIcon: const Icon(
              Icons.home,
              color: Colors.grey,
            ),
            iconName: 'home',
          ),
          OneTextButton(
            buttonIcon: const Icon(
              Icons.settings,
              color: Colors.grey,
            ),
            iconName: 'settings',
          ),
          OneTextButton(
            buttonIcon: const Icon(
              Icons.person,
              color: Colors.grey,
            ),
            iconName: 'account',
            routeName: '/profile',
          ),
        ],
      ),
    );
  }
}

class OneTextButton extends StatelessWidget {
  final textIconColor = Colors.grey.shade500;
  final String iconName;
  final Icon buttonIcon;
  final String? routeName;
  OneTextButton(
      {Key? key,
      required this.iconName,
      required this.buttonIcon,
      this.routeName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(fixedSize: const Size.fromHeight(60)),
      onPressed: routeName != null
          ? () {
              Navigator.of(context).pushNamed(routeName!);
            }
          : () {},
      child: Column(
        children: [
          buttonIcon,
          Text(
            iconName,
            style: TextStyle(fontSize: 16, color: textIconColor),
          )
        ],
      ),
    );
  }
}
