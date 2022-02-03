import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hotel_app/models/room_booking.dart';
import 'package:http/http.dart' as http;

class Booking {
  final String? roomId;
  final double? amount;
  final int? days;
  final double? charge;
  final int? members;
  final DateTime? inDate;
  final DateTime? outDate;
  final dynamic bed;
  final dynamic window;
  final dynamic table;
  final dynamic floor;
  final dynamic ac;
  final dynamic balcony;

  Booking({
    this.roomId,
    this.bed,
    this.ac,
    this.amount,
    this.balcony,
    this.charge,
    this.days,
    this.floor,
    this.table,
    this.window,
    this.members,
    this.inDate,
    this.outDate,
  });
}

class BookingProvider with ChangeNotifier {
  List<MyBookingRoom> _roomBookList = [];

  final String userId;
  BookingProvider(this.userId);
  Future<void> roomBooking({
    final String? roomId,
    final double? amount,
    final int? days,
    final int? members,
    final DateTime? indate,
    final DateTime? outdate,
    final double? charge,
    final dynamic bed,
    final dynamic window,
    final dynamic table,
    final dynamic floor,
    final dynamic ac,
    final dynamic balcony,
    final String? paymentStatus,
  }) async {
    final url =
        'https://firestore.googleapis.com/v1/projects/hotel-app-bd91c/databases/(default)/documents/roombooks/${userId}/books';
    await http.post(Uri.parse(url),
        body: json.encode({
          'fields': {
            'roomId': {
              "stringValue": roomId,
            },
            'amount': {
              "integerValue": amount,
            },
            'charge': {
              "integerValue": charge,
            },
            'member': {
              "integerValue": members,
            },
            'day': {
              "integerValue": days,
            },
            'paymentMethod': {
              "stringValue": paymentStatus,
            },
            'bed': {
              "mapValue": {
                'fields': {
                  'name': {
                    "stringValue": bed.first.name,
                  },
                  'price': {
                    "integerValue": bed.first.price,
                  }
                }
              },
            },
            'window': {
              "mapValue": {
                'fields': {
                  'name': {
                    "stringValue": window.first['name'],
                  },
                  'price': {
                    "integerValue": window.first['price'],
                  }
                }
              },
            },
            'table': {
              "mapValue": {
                'fields': {
                  'name': {
                    "stringValue": table.first['name'],
                  },
                  'price': {
                    "integerValue": table.first['price'],
                  }
                },
              },
            },
            'floor': {
              "mapValue": {
                'fields': {
                  'name': {
                    "stringValue": floor.first['name'],
                  },
                  'price': {
                    "integerValue": floor.first['price'],
                  }
                }
              },
            },
            'ac': {
              "mapValue": {
                'fields': {
                  'name': {
                    "stringValue": ac.first['name'],
                  },
                  'price': {
                    "integerValue": ac.first['price'],
                  }
                }
              },
            },
            'inDate': {
              "stringValue": indate!.toIso8601String(),
            },
            'outDate': {
              "stringValue": outdate!.toIso8601String(),
            },
            'balcony': {
              "mapValue": {
                'fields': {
                  'name': {
                    "stringValue": balcony.first['name'],
                  },
                  'price': {
                    "integerValue": balcony.first['price'],
                  }
                }
              },
            },
          }
        }));

    notifyListeners();
  }

  Future<void> fetchRoomBooks() async {
    final url =
        'https://firestore.googleapis.com/v1/projects/hotel-app-bd91c/databases/(default)/documents/roombooks/${userId}/books';
    final response = await http.get(Uri.parse(url));

    final responseData = jsonDecode(response.body) as Map<String, dynamic>;
    List _getDataList = [];

    if (responseData.isNotEmpty) {
      for (var room in responseData['documents']) {
        _getDataList.add(room['fields']);
      }
      List<MyBookingRoom> _room = [];
      _getDataList.forEach((getroom) {
        _room.add(
          MyBookingRoom(
            roomId: getroom['roomId']['stringValue'],
            paymentMethod: getroom['paymentMethod']['stringValue'],
            bed: getroom['bed']['mapValue']['fields'],
            window: getroom['window']['mapValue']['fields'],
            table: getroom['table']['mapValue']['fields'],
            floor: getroom['floor']['mapValue']['fields'],
            ac: getroom['ac']['mapValue']['fields'],
            balcony: getroom['balcony']['mapValue']['fields'],
            inDate: getroom['inDate']['stringValue'],
            outDate: getroom['outDate']['stringValue'],
            charge: double.parse(getroom['charge']['integerValue'].toString()),
            amount: double.parse(getroom['amount']['integerValue'].toString()),
            day: int.parse(getroom['day']['integerValue'].toString()),
            member: int.parse(getroom['member']['integerValue'].toString()),
          ),
        );
      });
      _roomBookList = _room;
      print(_room);
    }

    notifyListeners();
  }

  List<MyBookingRoom> get bookingRoom => _roomBookList;
}
