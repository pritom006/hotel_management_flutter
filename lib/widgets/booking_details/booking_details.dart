import 'package:flutter/material.dart';
import 'package:hotel_app/data/room_class.dart';
import 'package:hotel_app/data/room_data.dart';
import 'package:hotel_app/models/authentication.dart';
import 'package:hotel_app/models/booking.dart';
import 'package:hotel_app/models/button_provider.dart';
import 'package:provider/provider.dart';

class BookingDetails extends StatefulWidget {
  const BookingDetails({Key? key}) : super(key: key);

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  @override
  Widget build(BuildContext context) {
    final _buttonProiver = Provider.of<ButtonProvider>(context);
    final _selectRoom = ModalRoute.of(context)!.settings.arguments as Booking;

    final _room = Provider.of<RoomProvider>(context)
        .roomList
        .where((element) => element.roomId == _selectRoom.roomId);
    final _paymentman = Provider.of<Authentication>(context).user;
    print(_selectRoom.inDate);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Details'),
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Card(
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      Image(
                          width: 100,
                          height: 80,
                          fit: BoxFit.cover,
                          image: NetworkImage(_room
                              .first.imageList[0]['stringValue']
                              .toString())),
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.8,
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('Room Number '),
                                  Text('Total Charge'),
                                  Text(
                                    'Total Days ',
                                  ),
                                  Text('Total Amount '),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(_room.first.title.toString()),
                                  Text(_selectRoom.charge.toString()),
                                  Text(_selectRoom.days.toString()),
                                  Text(_selectRoom.amount.toString()),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            child: ListTile(
              title: const Text('User name '),
              subtitle: _paymentman.first['userName']['stringValue'] != null &&
                      _paymentman.first['userName']['stringValue']
                          .toString()
                          .isNotEmpty
                  ? Text(_paymentman.first['userName']['stringValue'])
                  : const Text('Edit user name'),
              trailing: GestureDetector(
                child: const Text('edit'),
                onTap: () {
                  print('object');
                },
              ),
            ),
          ),
          Container(
            child: ListTile(
              title: const Text('phone number '),
              subtitle: _paymentman.first['phone']['stringValue'] != null &&
                      _paymentman.first['phone']['stringValue']
                          .toString()
                          .isNotEmpty
                  ? Text(_paymentman.first['phone']['stringValue'].toString())
                  : const Text('Edit user name'),
              trailing: GestureDetector(
                child: const Text('edit'),
                onTap: () {
                  print('object');
                },
              ),
            ),
          ),
          Container(
            child: ListTile(
              title: const Text('Email address '),
              subtitle: _paymentman.first['email']['stringValue'] != null &&
                      _paymentman.first['email']['stringValue']
                          .toString()
                          .isNotEmpty
                  ? Text(_paymentman.first['email']['stringValue'])
                  : const Text('Edit email name'),
              trailing: GestureDetector(
                child: const Text('edit'),
                onTap: () {
                  print('object');
                },
              ),
            ),
          ),
          Container(
            child: ListTile(
              title: const Text('NID number '),
              subtitle: _paymentman.first['nidId']['stringValue'] != null &&
                      _paymentman.first['nidId']['stringValue']
                          .toString()
                          .isNotEmpty
                  ? Text(_paymentman.first['nidId']['stringValue'])
                  : const Text('Edit Nid id'),
              trailing: GestureDetector(
                child: const Text('edit'),
                onTap: () {
                  print('object');
                },
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Total Members'),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            _buttonProiver.remove = 1;
                          },
                          icon: Icon(Icons.remove)),
                      Text(
                        _buttonProiver.member.toString(),
                        style: TextStyle(fontSize: 22),
                      ),
                      IconButton(
                          onPressed: () {
                            _buttonProiver.add = 1;
                          },
                          icon: Icon(Icons.add)),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.orangeAccent.shade700,
                    borderRadius: BorderRadius.circular(6.0)),
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Total Amount',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      '${_selectRoom.amount} tk',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12.0)),
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    '/payment',
                    arguments: Booking(
                      roomId: _selectRoom.roomId,
                      charge: _selectRoom.charge,
                      amount: _selectRoom.amount,
                      days: _selectRoom.days,
                      bed: _selectRoom.bed,
                      window: _selectRoom.window,
                      ac: _selectRoom.ac,
                      table: _selectRoom.table,
                      floor: _selectRoom.floor,
                      members: _buttonProiver.member,
                      balcony: _selectRoom.balcony,
                      inDate: _selectRoom.inDate,
                      outDate: _selectRoom.outDate,
                    ),
                  );
                },
                child: Text(
                  'Payment',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
