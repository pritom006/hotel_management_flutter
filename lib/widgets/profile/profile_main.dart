import 'package:flutter/material.dart';
import 'package:hotel_app/models/authentication.dart';
import 'package:hotel_app/models/booking.dart';
import 'package:hotel_app/widgets/booking_history/booking_history.dart';
import '/app_drawer.dart';
import '/data/user_provider.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  //const Profile({Key? key}) : super(key: key);
  static const infoBgColor = Color(0xFFFFA979);

  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var _isInit = true;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if (_isInit) {
      Provider.of<BookingProvider>(context).fetchRoomBooks();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    //final _userdata = Provider.of<UserProvider>(context).users;
    final _userdata = Provider.of<Authentication>(context).user;
    print(_userdata.first['email']['stringValue']);
    return Scaffold(
      key: _scaffoldKey,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color(0xFFFFFBF7),
            actions: [
              IconButton(
                onPressed: () {
                  _scaffoldKey.currentState!.openEndDrawer();
                },
                icon: Icon(
                  Icons.more_vert,
                  size: 35,
                  color: Profile.infoBgColor,
                ),
              )
            ],
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color(0xFFFFFBF7),
                    Color(0xFFFFBC7E),
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CircleAvatar(
                              radius: 70,
                              backgroundImage: AssetImage(
                                'assets/images/profile.png',
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 16.0),
                              child: const Text(
                                'Welcome,',
                                style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              _userdata.first['userName']['stringValue'] ??
                                  null,
                              style: TextStyle(
                                fontSize: 19,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 12.0),
                        width: MediaQuery.of(context).size.width / 1.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(26.0),
                          color: Profile.infoBgColor,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              padding:
                                  const EdgeInsets.only(left: 20.0, top: 10.0),
                              child: const Text(
                                'Personal Info',
                                style: TextStyle(
                                    fontSize: 32, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                                //alignment: Alignment.centerLeft,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                padding: const EdgeInsets.all(20.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(26.0)),
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Name     : ',
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          Text(
                                            'Age         : ',
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 26.0,
                                          ),
                                          Text(
                                            'Gender  : Male',
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        child: const Text(
                                          'Address : Mirpur, Dhaka',
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        )),
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        child: const Text(
                                          'Phone    : 012******',
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        )),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: const [
                                          Text(
                                            'Blood     : O+',
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 26.0,
                                          ),
                                          Text(
                                            'NID No : 123445667',
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Container(
                        //height: 200,
                        padding: EdgeInsets.only(bottom: 12.0),
                        width: MediaQuery.of(context).size.width / 1.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(26.0),
                          color: Profile.infoBgColor,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              padding:
                                  const EdgeInsets.only(left: 20.0, top: 10.0),
                              child: const Text(
                                'Privacy Setting',
                                style: TextStyle(
                                    fontSize: 32, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                                //alignment: Alignment.centerLeft,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                padding: const EdgeInsets.all(20.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(26.0)),
                                child: Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Mail : ',
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        child: const Text(
                                          'Password : @**********#',
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        )),
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        child: const Text(
                                          'Recovery Phone Number : 012********',
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        )),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Container(
                        //height: 200,
                        padding: EdgeInsets.only(bottom: 12.0),
                        width: MediaQuery.of(context).size.width / 1.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(26.0),
                          color: Profile.infoBgColor,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              padding:
                                  const EdgeInsets.only(left: 20.0, top: 10.0),
                              child: const Text(
                                'Payment Method',
                                style: TextStyle(
                                    fontSize: 32, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                                //alignment: Alignment.centerLeft,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
                                padding: const EdgeInsets.all(20.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(26.0)),
                                child: Column(
                                  children: [
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        child: const Text(
                                          'Bkash Account : 017********',
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        )),
                                    Container(
                                        alignment: Alignment.centerLeft,
                                        child: const Text(
                                          'Rocket Account  : 012********',
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        )),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      Container(
                        //height: 200,
                        padding: EdgeInsets.only(bottom: 12.0),
                        width: MediaQuery.of(context).size.width / 1.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(26.0),
                          color: Profile.infoBgColor,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              padding:
                                  const EdgeInsets.only(left: 20.0, top: 10.0),
                              child: const Text(
                                'Booking History',
                                style: TextStyle(
                                    fontSize: 32, fontWeight: FontWeight.bold),
                              ),
                            ),
                            BookingHistory()
                            // Container(
                            //     //alignment: Alignment.centerLeft,
                            //     margin: const EdgeInsets.symmetric(
                            //         horizontal: 12.0),
                            //     padding: const EdgeInsets.all(20.0),
                            //     decoration: BoxDecoration(
                            //         color: Colors.white,
                            //         borderRadius: BorderRadius.circular(26.0)),
                            //     child: Column(
                            //       children: [
                            //         Container(
                            //           alignment: Alignment.centerLeft,
                            //           child: const Text(
                            //             'Name     : Limon chandra ray',
                            //             style: TextStyle(
                            //               fontSize: 16,
                            //             ),
                            //           ),
                            //         ),
                            //         Container(
                            //           alignment: Alignment.centerLeft,
                            //           child: Row(
                            //             children: const [
                            //               Text(
                            //                 'Age         : 22',
                            //                 style: TextStyle(
                            //                   fontSize: 16,
                            //                 ),
                            //               ),
                            //               SizedBox(
                            //                 width: 26.0,
                            //               ),
                            //               Text(
                            //                 'Gender  : Male',
                            //                 style: TextStyle(
                            //                   fontSize: 16,
                            //                 ),
                            //               )
                            //             ],
                            //           ),
                            //         ),
                            //         Container(
                            //             alignment: Alignment.centerLeft,
                            //             child: const Text(
                            //               'Address : Panchagarh,Rangpur',
                            //               style: TextStyle(
                            //                 fontSize: 16,
                            //               ),
                            //             )),
                            //         Container(
                            //             alignment: Alignment.centerLeft,
                            //             child: const Text(
                            //               'Phone    : 012******',
                            //               style: TextStyle(
                            //                 fontSize: 16,
                            //               ),
                            //             )),
                            //         Container(
                            //           alignment: Alignment.centerLeft,
                            //           child: Row(
                            //             children: const [
                            //               Text(
                            //                 'Blood     : O+',
                            //                 style: TextStyle(
                            //                   fontSize: 16,
                            //                 ),
                            //               ),
                            //               SizedBox(
                            //                 width: 26.0,
                            //               ),
                            //               Text(
                            //                 'NID No : 123445667',
                            //                 style: TextStyle(
                            //                   fontSize: 16,
                            //                 ),
                            //               ),
                            //             ],
                            //           ),
                            //         )
                            //       ],
                            //     ),),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ]),
          )
        ],
      ),
      endDrawer: const AppDrawer(),
    );
  }
}
