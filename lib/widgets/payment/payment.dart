import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_app/main.dart';
import 'package:hotel_app/models/booking.dart';
import 'package:provider/provider.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String _status = 'null';
  Future<void> book() async {
    final _args = ModalRoute.of(context)!.settings.arguments as Booking;
    Provider.of<BookingProvider>(context, listen: false).roomBooking(
        roomId: _args.roomId,
        amount: _args.amount,
        days: _args.days,
        charge: _args.charge,
        bed: _args.bed,
        window: _args.window,
        table: _args.table,
        floor: _args.floor,
        ac: _args.ac,
        balcony: _args.balcony,
        members: _args.members,
        indate: _args.inDate,
        paymentStatus: _status,
        outdate: _args.outDate);
    const snackBar = SnackBar(
        backgroundColor: Colors.green,
        content: Text('Room Book complite'),
        duration: Duration(seconds: 4));
    // ignore: deprecated_member_use
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MyApp(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final reponse =
        Provider.of<BookingProvider>(context, listen: false).fetchRoomBooks();
    print(reponse);
    return Scaffold(
      backgroundColor: Colors.blue,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Payment Method'),
            flexibleSpace: FlexibleSpaceBar(),
            expandedHeight: 180,
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(26.0),
                      topRight: Radius.circular(26.0))),
              //height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 90,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 8),
                    child: Text(
                      'Other Payment method',
                      style: TextStyle(fontSize: 22, color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _status = 'debit';
                      });
                    },
                    style: TextButton.styleFrom(
                        backgroundColor:
                            _status == 'debit' ? Colors.grey : Colors.white),
                    child: Container(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 6),
                      child: Row(
                        children: [
                          Icon(
                            Icons.credit_card,
                            size: 60,
                            color: Colors.deepOrange.shade900,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Debit / Credit card',
                            style: TextStyle(
                                color: Colors.grey.shade700, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _status = 'Bkash';
                      });
                    },
                    style: TextButton.styleFrom(
                        backgroundColor:
                            _status == 'Bkash' ? Colors.grey : Colors.white),
                    child: Container(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 6),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/bkash.svg',
                            //width: 105,
                            height: 65,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Bkash',
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 18,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _status = 'Nagad';
                      });
                    },
                    style: TextButton.styleFrom(
                        backgroundColor:
                            _status == 'Nagad' ? Colors.grey : Colors.white),
                    child: Container(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 6),
                      child: Row(
                        children: [
                          Container(
                            width: 58,
                            height: 50,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/naged.png'),
                                ),
                                borderRadius: BorderRadius.circular(16.0)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Nagad',
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 18,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _status = 'Rocket';
                      });
                    },
                    style: TextButton.styleFrom(
                        backgroundColor:
                            _status == 'Rocket' ? Colors.grey : Colors.white),
                    child: Container(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 6),
                      child: Row(
                        children: [
                          Container(
                            width: 58,
                            height: 50,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage('assets/images/rocket.png'),
                                ),
                                borderRadius: BorderRadius.circular(16.0)),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Rocket',
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 18,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor:
                            _status == 'Cash On' ? Colors.grey : Colors.white),
                    onPressed: () {
                      setState(() {
                        _status = 'Cash On';
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 6),
                      child: Row(
                        children: [
                          Icon(Icons.monetization_on,
                              size: 60, color: Colors.green),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Cash On',
                            style: TextStyle(
                              color: Colors.grey.shade700,
                              fontSize: 18,
                              letterSpacing: 2.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(16.0),
          primary: Colors.orange.shade900,
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.circular(10.0),
          // ),
        ),
        child: Text(
          'Submit',
          style: TextStyle(fontSize: 20, letterSpacing: 2.0),
        ),
        onPressed: book,
      ),
    );
  }
}
