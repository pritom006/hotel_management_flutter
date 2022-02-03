import 'package:flutter/material.dart';
import 'package:hotel_app/main.dart';
import 'package:hotel_app/models/authentication.dart';
import 'package:hotel_app/widgets/first_page.dart';
import 'package:provider/provider.dart';

import 'home_menu_button.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Drawer(
        backgroundColor: Colors.red.shade100,
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
              margin: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Text(
                'MENU',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            // HomeMuenuButton(
            //   textVAlue: 'Home', menuIcon: Icon(Icons.home),
            //   //route: '/home',
            // ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 15.0,
                  ),
                  alignment: Alignment.centerLeft,
                  primary: Colors.purple.shade300),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => MyApp()));
              },
              icon: Icon(Icons.home),
              label: Text(
                'Home',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            ),
            HomeMuenuButton(
              textVAlue: 'Rooms',
              menuIcon: Icon(Icons.bed_outlined),
              route: '/rooms',
            ),
            HomeMuenuButton(
              textVAlue: 'Profile',
              menuIcon: Icon(Icons.manage_accounts),
              route: '/profile',
            ),
            HomeMuenuButton(
              textVAlue: 'Complains',
              menuIcon: Icon(Icons.miscellaneous_services),
              route: '/complains',
            ),
            HomeMuenuButton(
              textVAlue: 'Checkout',
              menuIcon: Icon(Icons.check_box_outlined),
            ),
            // HomeMuenuButton(
            //   textVAlue: 'Comments',
            //   menuIcon: Icon(Icons.comment_outlined),
            // ),
            HomeMuenuButton(
              textVAlue: 'Suggestions',
              menuIcon: Icon(Icons.comment_outlined),
              route: '/suggestions',
            ),
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.of(context).pushNamed('/firstPage');
            //       // Navigator.of(context).push(
            //       //     MaterialPageRoute(builder: (context) => FirstPage()));

            //       Provider.of<Authentication>(context, listen: false).logout();
            //     },
            //     child: Text('Log-out'))
            HomeMuenuButton(
              textVAlue: 'Exit App',
              menuIcon: Icon(Icons.exit_to_app),
            ),
          ],
        ),
      ),
    );
  }
}
