import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hotel_app/data/room_data.dart';
import 'package:hotel_app/models/authentication.dart';
import 'package:hotel_app/models/booking.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BookingHistory extends StatelessWidget {
  const BookingHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _imageSize = MediaQuery.of(context).size.width / 3;
    final _container = MediaQuery.of(context).size.width / 2.3;
    final _response = Provider.of<BookingProvider>(context).bookingRoom;
    return _response.isEmpty
        ? Container(
            child: Text('Please booking Room'),
          )
        : Container(
            child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, data) {
              final _room = Provider.of<RoomProvider>(context)
                  .roomList
                  .where((element) => element.roomId == _response[data].roomId);
              final _userdata = Provider.of<Authentication>(context).user;
              print(_room);
              final _indate = DateFormat('yyyy-MM-dd')
                  .parse(_response[data].inDate.toString());
              print(_indate);
              return Card(
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      Container(
                        width: _imageSize,
                        height: 80,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    _room.first.imageList[0]['stringValue']))),
                      ),
                      SizedBox(
                        width: 12.0,
                      ),
                      Container(
                        width: _container,
                        //height: 200,

                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('user name : limon'),
                            Text('Total Charge : ${_response[data].charge}'),
                            Text(
                                'In-Date : ${DateFormat('dd-MM-yyyy').format(_indate)}'),
                            Text(
                                'Out-Date : ${DateFormat('dd-MM-yyyy').format(DateFormat('yyyy-MM-dd').parse(_response[data].outDate.toString()))}'),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(DateTime.now().isBefore(
                                          DateFormat('yyyy-MM-dd').parse(
                                              _response[data]
                                                  .outDate
                                                  .toString()))
                                      ? 'booking status : Active'
                                      : 'booking status : past'),
                                  CircleAvatar(
                                    backgroundColor: DateTime.now().isBefore(
                                            DateFormat('yyyy-MM-dd').parse(
                                                _response[data]
                                                    .outDate
                                                    .toString()))
                                        ? Colors.green
                                        : Colors.red,
                                    radius: 15,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: _response.length,
          ));
  }
  // Widget build(BuildContext context) {
  //   final _imageSize = MediaQuery.of(context).size.width / 3;
  //   final _container = MediaQuery.of(context).size.width / 2.3;
  //   return Card(
  //     child: GestureDetector(
  //       onTap: () {

  //       },
  //       child: Row(
  //         children: [
  //           Container(
  //             width: _imageSize,
  //             height: 200,
  //             decoration: BoxDecoration(
  //               color: Colors.red,
  //             ),
  //           ),
  //           Container(
  //             width: _container,
  //             height: 200,
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Text('user name : limon'),
  //                 Text('Total Charge : 2000-0'),
  //                 Text('In-Date : '),
  //                 Text('Out-Date : '),
  //               ],
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
