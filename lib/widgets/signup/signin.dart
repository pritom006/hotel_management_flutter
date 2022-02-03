import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hotel_app/data/signup.dart';

import 'package:hotel_app/models/authentication.dart';
import 'package:provider/provider.dart';

import 'signup_main.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _obscureText = true;
  final _signinKey = GlobalKey<FormState>();
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  // var _signin = SignUp(
  //   password: '',
  //   userEmail: '',
  // );

  final Map<String, String> _signInData = {
    'email': '',
    'password': '',
  };
  Future<void> saveSignIn() async {
    final _validationState = _signinKey.currentState!.validate();
    if (!_validationState) {
      return;
    }
    _signinKey.currentState!.save();

    Provider.of<Authentication>(context, listen: false).signIn(
      _signInData['email'].toString(),
      _signInData['password'].toString(),
    );
    //await Provider.of<Authentication>(context, listen: false).userCollection();

    // final signinProvider =
    //     Provider.of<UserProvider>(context, listen: false).users;
    // for (var item in signinProvider) {
    //   // if (item.userEmail == _signin.userEmail &&
    //   //     item.password == _signin.password)
    //   try
    //       {
    //     Navigator.of(context).pushNamed('/home');
    //   } catch(error) {
    //     AlertDialog alertDialog = AlertDialog(
    //       backgroundColor: Colors.grey.shade300,
    //       content: Container(
    //         decoration:
    //             BoxDecoration(borderRadius: BorderRadius.circular(32.0)),
    //         height: 100,
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             item.userEmail != _signin.userEmail
    //                 ? const Text(
    //                     'Email not match',
    //                     style: TextStyle(color: Colors.red, fontSize: 20),
    //                   )
    //                 : const Text(
    //                     "Email match Success",
    //                     style: TextStyle(color: Colors.green, fontSize: 20),
    //                   ),
    //             item.password != _signin.password
    //                 ? const Text(
    //                     'Password not match',
    //                     style: TextStyle(color: Colors.red, fontSize: 20),
    //                   )
    //                 : const Text(
    //                     "Password match Success",
    //                     style: TextStyle(color: Colors.green, fontSize: 20),
    //                   ),
    //           ],
    //         ),
    //       ),
    //       actions: [
    //         TextButton(
    //             onPressed: () {
    //               Navigator.of(context).pop();
    //             },
    //             child: Text(
    //               'cancel',
    //               style: TextStyle(fontSize: 22),
    //             ))
    //       ],
    //     );
    //     showDialog(
    //       barrierDismissible: false,
    //       context: context,
    //       builder: (context) {
    //         return alertDialog;
    //       },
    //     );
    //   }
    // }
  }

  @override
  Widget build(BuildContext context) {
    final res = Provider.of<Authentication>(context).isAuth;
    print(res);
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/sign.png'),
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 350,
                    decoration: BoxDecoration(
                      color: const Color(0xFFffd394),
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                        key: _signinKey,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 12.0,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                hintText: 'Email Address',
                                hintStyle: const TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                                filled: true,
                                fillColor: Color(0xFFcaa382),
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please Enter valid email address";
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                // _signin = SignUp(
                                //   password: _signin.password,
                                //   userEmail: newValue.toString(),
                                // );
                                _signInData['email'] = newValue.toString();
                              },
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                hintText: 'password',
                                hintStyle: TextStyle(
                                    fontSize: 18.0, color: Colors.white),
                                filled: true,
                                fillColor: Color(0xFFcaa382),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obscureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.black,
                                  ),
                                  onPressed: _toggle,
                                ),
                              ),
                              obscureText: _obscureText,
                              textInputAction: TextInputAction.done,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter valid password";
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                // _signin = SignUp(
                                //   password: newValue.toString(),
                                //   userEmail: _signin.userEmail,
                                // );
                                _signInData['password'] = newValue.toString();
                              },
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              height: 35,
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forgot Password ?',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 25.0,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(175, 55),
                                primary: Color(0xFFcaa382),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0)),
                              ),
                              onPressed: saveSignIn,
                              child: Text(
                                'Log-in',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        )),
                  ),
                  Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Please create Account.',
                            style: TextStyle(
                                fontSize: 19,
                                color: Color(0xFF070000),
                                fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                                //backgroundColor: Color(0xFFb57322),
                                ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SignUpMainPage()));
                              //Navigator.of(context).pushNamed('/sign-up');
                            },
                            child: Row(
                              children: const [
                                Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      fontSize: 17,
                                      color: Color(0xFFb57322),
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Icon(
                                  Icons.login,
                                  color: Color(0xFFb57322),
                                ),
                              ],
                            ),
                          ),
                        ]),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
