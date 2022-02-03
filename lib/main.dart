import 'package:flutter/material.dart';
import 'package:hotel_app/models/authentication.dart';
import 'package:hotel_app/models/booking.dart';
import 'package:hotel_app/models/button_provider.dart';
import 'package:hotel_app/widgets/booking_details/booking_details.dart';
import 'package:hotel_app/widgets/payment/payment.dart';
import 'package:hotel_app/widgets/suggesiton/complains.dart';
import './app_drawer.dart';
import './data/room_data.dart';
import './data/user_provider.dart';

import './widgets/checkout/checkout_main.dart';
import './widgets/checkout/checkout_provider.dart';

import './widgets/details/details_main_page.dart';
import './widgets/first_page.dart';
import './widgets/home/home_main.dart';
import './widgets/profile/profile_main.dart';
import './widgets/signup/signin.dart';
import './widgets/signup/signup_main.dart';
import 'package:provider/provider.dart';

import 'widgets/rooms/rooms.dart';
import 'widgets/rooms/rooms_main_page.dart';
import 'widgets/selected/selected.dart';
import 'widgets/suggesiton/suggestion.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Authentication()),
        ChangeNotifierProvider.value(value: UserProvider()),
        ChangeNotifierProvider.value(value: RoomProvider()),
        ChangeNotifierProvider.value(value: CheckOutProvider()),
        ChangeNotifierProvider.value(value: ButtonProvider()),
        ChangeNotifierProxyProvider<Authentication, BookingProvider>(
            create: (_) => BookingProvider(''),
            update: (context, auth, _) => auth.userId == null
                ? BookingProvider('')
                : BookingProvider(auth.userId)),
        // ChangeNotifierProvider.value(value: BookingProvider())
      ],
      child: Consumer<Authentication>(
        builder: (context, auth, _) => MaterialApp(
          home: auth.isAuth
              ? MyApp()
              : FutureBuilder(
                  builder: (context, authSnapshot) =>
                      authSnapshot.connectionState == ConnectionState.waiting
                          ? const FirstPage()
                          : const SignIn()),
          //home: Rooms(),
          //home: DetailsMainPage(),

          routes: {
            '/firstPage': (context) => const FirstPage(),
            // '/home': (context) => MyApp(),
            '/profile': (context) => Profile(),
            //'/sign-up': (context) => const SignUpMainPage(),
            // '/log-in': (context) => const SignIn(),
            '/details': (context) => const DetailsMainPage(),
            '/selected': (context) => const Selected(),
            '/rooms': (context) => Rooms(),
            '/selected-rooms': (context) => const RoomsPage(),
            '/checkout': (context) => const CheckOutMain(),
            '/complains': (context) => const Complain(),
            '/suggestions': (context) => const Suggestion(),
            '/booking-details': (context) => const BookingDetails(),
            '/payment': (context) => const Payment()
          },
          debugShowCheckedModeBanner: false,
        ),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //const MyApp({Key? key}) : super(key: key);
  final scaffoldKey = GlobalKey<ScaffoldState>();
//final _scaffoldKey = GlobalKey<ScaffoldState>();
  var _isInit = true;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   Provider.of<RoomProvider>(context).fetchData();
  //   super.initState();
  // }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    if (_isInit) {
      Provider.of<RoomProvider>(context).fetchData();
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red.shade50,
        key: scaffoldKey,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              centerTitle: true,
              pinned: true,
              backgroundColor: Colors.red.shade300,
              actions: [
                TextButton(
                  onPressed: () {
                    scaffoldKey.currentState!.openEndDrawer();
                  },
                  child: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ),
              ],
              expandedHeight: 80,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text('SMART HOTEL'),
                background: Image.asset(
                  'assets/images/wellcome.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverList(delegate: SliverChildListDelegate([HomeMainPage()]))
          ],
        ),
        // appBar: AppBar(
        //   backgroundColor: Colors.red.shade200,
        //   title: Text("Kanchenjunga"),
        //   centerTitle: true,
        //   actions: [
        //     TextButton(
        //       onPressed: () {
        //         scaffoldKey.currentState!.openEndDrawer();
        //       },
        //       child: Icon(
        //         Icons.more_vert,
        //         color: Colors.white,
        //       ),
        //     ),
        //   ],
        // ),

        // body: SingleChildScrollView(
        //   //physics: const NeverScrollableScrollPhysics(),
        //   child: HomeMainPage(),
        // ),
        endDrawer: AppDrawer());
  }
}
