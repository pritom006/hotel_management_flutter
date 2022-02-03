import 'package:flutter/material.dart';
import 'package:hotel_app/data/signup.dart';
import 'package:hotel_app/widgets/signup/signup_main.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 50.0,
              left: 25.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Hotel',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  Text(
                    '  Sevice',
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontFamily: 'Montserrat'),
                  ),
                ],
              ),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width,
              top: MediaQuery.of(context).size.height / 1.5,
              child: Center(
                child: TextButton(
                  style: TextButton.styleFrom(
                      fixedSize: const Size.fromWidth(125),
                      backgroundColor: const Color(0xFFFFA979)),
                  child: const Text(
                    'START',
                    style: TextStyle(
                      letterSpacing: 3.0,
                      color: Colors.black87,
                      fontSize: 16,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SignUpMainPage()));
                    //Navigator.of(context).pushNamed('/sign-up');
                  },
                ),
              ),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width,
              bottom: 30.0,
              child: const Text(
                'Thanks for Being with us',
                style: TextStyle(fontFamily: 'Montserrat'),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
