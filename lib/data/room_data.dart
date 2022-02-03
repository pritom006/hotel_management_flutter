import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hotel_app/data/room_class.dart';
import 'package:http/http.dart' as http;

class RoomProvider with ChangeNotifier {
  List<Bed> bedList = [
    // {
    //   'name': 'Single Bed',
    //   'price': 300.0,
    // },
    // {
    //   'name': 'Double Bed',
    //   'price': 450.0,
    // },
    // {
    //   'name': 'Three Beds',
    //   'price': 575.0,
    // },
    // {
    //   'name': 'Duplex Bed',
    //   'price': 600.0,
    // },
  ];
  List<Map> windowsList = [
    {
      'name': '1 window right',
      'price': 300.0,
    },
    {
      'name': '1 window left',
      'price': 300.0,
    },
    {
      'name': '2 windows right',
      'price': 450.0,
    },
    {
      'name': '2 windows left',
      'price': 500.0,
    },
    {
      'name': '2 windows left - right',
      'price': 600.0,
    },
  ];
  List<Map> tableList = [
    {
      'name': 'No',
      'price': 00.0,
    },
    {
      'name': 'Side Desk',
      'price': 25.0,
    },
    {
      'name': 'Reading Table',
      'price': 30.0,
    },
    {
      'name': 'Coffee Table',
      'price': 45.0,
    },
    {
      'name': 'Balcony Table',
      'price': 50.0,
    },
  ];
  List<Map> floorStyleList = [
    {
      'name': 'Italian Marvel',
      'price': 1400.0,
    },
    {
      'name': 'Tiles',
      'price': 400.0,
    },
    {
      'name': 'Carpet',
      'price': 550.0,
    },
    {
      'name': 'Mozaik',
      'price': 300.0,
    },
    {
      'name': 'Wooden Floor',
      'price': 800.0,
    },
  ];
  List<Map> acList = [
    {
      'name': 'No',
      'price': 00.0,
    },
    {
      'name': '1 Ton',
      'price': 200.0,
    },
    {
      'name': '2 Ton',
      'price': 350.0,
    },
    {
      'name': '2X1 Ton',
      'price': 400.0,
    },
  ];
  List<Map> balconyList = [
    {
      'name': 'No',
      'price': 00.0,
    },
    {
      'name': 'Yes',
      'price': 100.0,
    },
  ];

  List<Room> _roomList = [
    // Room(
    //   roomId: 'r101',
    //   bed: 'Single Bed',
    //   windows: '1 window right',
    //   withTable: 'Balcony Table',
    //   floorStyle: 'Italian Marvel',
    //   ac: '1 Ton',
    //   balcony: 'Yes',
    //   title: 'Room 101',
    //   size: 200.0,
    //   imageList: [
    //     'https://media.istockphoto.com/photos/hotel-room-suite-with-view-picture-id627892060?k=20&m=627892060&s=612x612&w=0&h=k6QY-qWNlFbvYhas82e_MoSXceozjrhhgp-krujsoDw=',
    //     'https://media.istockphoto.com/photos/interior-of-a-modern-luxury-hotel-double-bed-bedroom-picture-id1163498940?k=20&m=1163498940&s=612x612&w=0&h=tUPidNW2ny095sCR97dur7cbrCnYpcjHbevUTJyB8Jc=',
    //     'https://media.istockphoto.com/photos/render-modern-bedroom-picture-id1161026663?k=20&m=1161026663&s=612x612&w=0&h=HevY53GLRblWOYiPdiAskftP4wqYNDs7azXsJ5OV9J8=',
    //     'https://media.istockphoto.com/photos/seaview-bedroom-picture-id492189224?k=20&m=492189224&s=612x612&w=0&h=6ZyIXu3KK9H18JHC93bX--aQA9tRk57N6wqlwsEeyIg=',
    //     'https://media.istockphoto.com/photos/3d-rendering-beautiful-luxury-bedroom-suite-in-hotel-with-tv-picture-id1050564510?k=20&m=1050564510&s=612x612&w=0&h=QHxWH_n-VlHac2z4qFwCSh1RB9QInNzZDHA11K28fI8=',
    //     'https://media.istockphoto.com/photos/hotel-room-suite-with-view-picture-id627892060?k=20&m=627892060&s=612x612&w=0&h=k6QY-qWNlFbvYhas82e_MoSXceozjrhhgp-krujsoDw='
    //   ],
    // ),
    // Room(
    //   roomId: 'r102',
    //   bed: 'Duplex Bed',
    //   windows: '1 window left',
    //   withTable: 'No',
    //   floorStyle: 'Italian Marvel',
    //   ac: 'No',
    //   balcony: 'No',
    //   title: 'Room 102',
    //   size: 400.0,
    //   imageList: [
    //     'https://images.unsplash.com/photo-1568495248636-6432b97bd949?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80',
    //     'https://images.unsplash.com/photo-1512918728675-ed5a9ecdebfd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    //     'https://images.unsplash.com/photo-1512918580421-b2feee3b85a6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    //     'https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    //     'https://images.unsplash.com/flagged/photo-1556438758-8d49568ce18e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1174&q=80',
    //     'https://images.unsplash.com/photo-1560184897-502a475f7a0d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'
    //   ],
    // ),
    // Room(
    //   roomId: 'r103',
    //   bed: 'Single Bed',
    //   windows: '1 window left',
    //   withTable: 'Side Desk',
    //   floorStyle: 'Tiles',
    //   ac: '2 Ton',
    //   balcony: 'No',
    //   title: 'Room 103',
    //   size: 250.0,
    //   imageList: [
    //     'https://images.unsplash.com/photo-1560184897-f1b9fd4e5d25?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1176&q=80',
    //     'https://images.unsplash.com/photo-1560448075-57d0285fc59b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    //     'https://images.unsplash.com/photo-1560185127-058d83ae8136?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1205&q=80',
    //     'https://images.unsplash.com/photo-1560185893-a55cbc8c57e8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    //     'https://images.unsplash.com/photo-1521783988139-89397d761dce?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1025&q=80',
    //     'https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80'
    //   ],
    // ),
    // Room(
    //   roomId: 'r104',
    //   bed: 'Duplex Bed',
    //   windows: '1 window right',
    //   withTable: 'Reading Table',
    //   floorStyle: 'Italian Marvel',
    //   ac: '2 Ton',
    //   balcony: 'No',
    //   title: 'Room 104',
    //   size: 300.0,
    //   imageList: [
    //     'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //     'https://images.unsplash.com/photo-1554995207-c18c203602cb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //     'https://images.unsplash.com/photo-1550581190-9c1c48d21d6c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=809&q=80',
    //     'https://images.unsplash.com/photo-1600210491892-03d54c0aaf87?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',
    //     'https://images.unsplash.com/photo-1496417263034-38ec4f0b665a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80',
    //     'https://images.unsplash.com/photo-1512918728675-ed5a9ecdebfd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
    //   ],
    // ),
    // Room(
    //   roomId: 'r105',
    //   bed: 'Single Bed',
    //   windows: '2 windows left',
    //   withTable: 'No',
    //   floorStyle: 'Carpet',
    //   ac: 'No',
    //   balcony: 'No',
    //   title: 'Room 105',
    //   size: 200.0,
    //   imageList: [
    //     'https://images.unsplash.com/photo-1445991842772-097fea258e7b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //     'https://images.unsplash.com/photo-1519710889408-a67e1c7e0452?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    //     'https://images.unsplash.com/photo-1519961655809-34fa156820ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    //     'https://images.unsplash.com/photo-1566665797739-1674de7a421a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
    //     'https://images.unsplash.com/photo-1541123356219-284ebe98ae3b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //     'https://images.unsplash.com/photo-1562438668-bcf0ca6578f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80'
    //   ],
    // ),
    // Room(
    //   roomId: 'r201',
    //   bed: 'Single Bed',
    //   windows: '2 windows left - right',
    //   withTable: 'No',
    //   floorStyle: 'Carpet',
    //   ac: '2 Ton',
    //   balcony: 'No',
    //   title: 'Room 201',
    //   size: 440.0,
    //   imageList: [
    //     'https://images.unsplash.com/photo-1578683010236-d716f9a3f461?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //     'https://images.unsplash.com/photo-1591088398332-8a7791972843?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
    //     'https://images.unsplash.com/photo-1571508601936-6ca847b47ae4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80',
    //     'https://images.unsplash.com/photo-1579656381226-5fc0f0100c3b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=684&q=80',
    //     'https://images.unsplash.com/photo-1579283111541-081efe96f922?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //     'https://images.unsplash.com/photo-1588046130717-0eb0c9a3ba15?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=786&q=80',
    //   ],
    // ),
    // Room(
    //   roomId: 'r202',
    //   bed: 'Single Bed',
    //   windows: '1 window left',
    //   withTable: 'Reading Table',
    //   floorStyle: 'Italian Marvel',
    //   ac: '2X1 Ton',
    //   balcony: 'No',
    //   title: 'Room 202',
    //   size: 350.0,
    //   imageList: [
    //     'https://images.unsplash.com/photo-1565330502637-963b256876c6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80',
    //     'https://images.unsplash.com/photo-1573255104932-7c6eff00345f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    //     'https://images.unsplash.com/photo-1531835551805-16d864c8d311?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    //     'https://images.unsplash.com/photo-1524061614234-8449637d36ce?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
    //     'https://images.unsplash.com/photo-1524061614234-8449637d36ce?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
    //     'https://images.unsplash.com/photo-1559599242-651c4e085efb?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80',
    //   ],
    // ),
    // Room(
    //   roomId: 'r203',
    //   bed: 'Duplex Bed',
    //   windows: '1 window right',
    //   withTable: 'Reading Table',
    //   floorStyle: 'Tiles',
    //   ac: 'No',
    //   balcony: 'No',
    //   title: 'Room 203',
    //   size: 350.0,
    //   imageList: [
    //     'https://images.unsplash.com/photo-1582582484783-0a7a9e45b0d6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80',
    //     'https://images.unsplash.com/photo-1581404554128-5032fe7874be?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80',
    //     'https://images.unsplash.com/photo-1595576508898-0ad5c879a061?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
    //     'https://images.unsplash.com/photo-1594130139005-3f0c0f0e7c5e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=812&q=80',
    //     'https://images.unsplash.com/photo-1611892440504-42a792e24d32?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    //     'https://images.unsplash.com/photo-1611892441796-ae6af0ec2cc8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //   ],
    // ),
    // Room(
    //   roomId: 'r204',
    //   bed: 'Three Beds',
    //   windows: '2 windows left - right',
    //   withTable: 'No',
    //   floorStyle: 'Wooden Floor',
    //   ac: '2X1 Ton',
    //   balcony: 'No',
    //   title: 'Room 204',
    //   size: 400.0,
    //   imageList: [
    //     'https://images.unsplash.com/flagged/photo-1556438758-8d49568ce18e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=874&q=80',
    //     'https://images.unsplash.com/photo-1611971263023-105938ce12ed?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    //     'https://images.unsplash.com/photo-1541123356219-284ebe98ae3b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //     'https://images.unsplash.com/photo-1547166993-fc34f81b9aec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //     'https://images.unsplash.com/photo-1540518614846-7eded433c457?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=857&q=80',
    //     'https://images.unsplash.com/photo-1629140727571-9b5c6f6267b4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=627&q=80',
    //   ],
    // ),
    // Room(
    //   roomId: 'r205',
    //   bed: 'Single Bed',
    //   windows: '2 windows left - right',
    //   withTable: 'Side Desk',
    //   floorStyle: 'Italian Marvel',
    //   ac: '1 Ton',
    //   balcony: 'No',
    //   title: 'Room 205',
    //   size: 260.0,
    //   imageList: [
    //     'https://images.unsplash.com/photo-1618773928121-c32242e63f39?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //     'https://images.unsplash.com/photo-1566665797739-1674de7a421a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
    //     'https://images.unsplash.com/photo-1578683010236-d716f9a3f461?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //     'https://images.unsplash.com/photo-1595526114035-0d45ed16cfbf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //     'https://images.unsplash.com/photo-1579283111541-081efe96f922?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //     'https://images.unsplash.com/photo-1588046130717-0eb0c9a3ba15?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=786&q=80',
    //   ],
    // ),
    // Room(
    //   roomId: 'r301',
    //   bed: 'Double Bed',
    //   windows: '2 windows left',
    //   withTable: 'No',
    //   floorStyle: 'Wooden Floor',
    //   ac: 'No',
    //   balcony: 'No',
    //   title: 'Room 301',
    //   size: 440.0,
    //   imageList: [
    //     'https://images.unsplash.com/photo-1560185893-a55cbc8c57e8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //     'https://images.unsplash.com/photo-1605346434674-a440ca4dc4c0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    //     'https://images.unsplash.com/photo-1590490360182-c33d57733427?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
    //     'https://images.unsplash.com/photo-1592229505726-ca121723b8ef?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
    //     'https://images.unsplash.com/photo-1590490359854-dfba19688d70?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
    //     'https://images.unsplash.com/photo-1592229505678-cf99a9908e03?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
    //   ],
    // ),
    // Room(
    //   roomId: 'r302',
    //   bed: 'Single Bed',
    //   windows: '1 window left',
    //   withTable: 'Balcony Table',
    //   floorStyle: 'Mozaik',
    //   ac: '2 Ton',
    //   balcony: 'Yes',
    //   title: 'Room 302',
    //   size: 450.0,
    //   imageList: [
    //     'https://images.unsplash.com/photo-1592230228921-df3a88a2244e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80',
    //     'https://images.unsplash.com/photo-1609949279531-cf48d64bed89?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
    //     'https://images.unsplash.com/photo-1588046130717-0eb0c9a3ba15?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=786&q=80',
    //     'https://images.unsplash.com/photo-1610392734074-02f696fd30a8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    //     'https://images.unsplash.com/photo-1640109478916-f445f8f19b11?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //     'https://images.unsplash.com/photo-1588796460666-590f1d712a2e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //   ],
    // ),
    // Room(
    //   roomId: 'r303',
    //   bed: 'Three Beds',
    //   windows: '2 windows left - right',
    //   withTable: 'Balcony Table',
    //   floorStyle: 'Tiles',
    //   ac: 'No',
    //   balcony: 'Yes',
    //   title: 'Room 303',
    //   size: 250.0,
    //   imageList: [
    //     'https://images.unsplash.com/photo-1618221257490-1d703817596c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80',
    //     'https://images.unsplash.com/photo-1578683010236-d716f9a3f461?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //     'https://images.unsplash.com/photo-1571508601891-ca5e7a713859?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //     'https://images.unsplash.com/photo-1615874959474-d609969a20ed?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
    //     'https://images.unsplash.com/photo-1617098474202-0d0d7f60c56b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
    //     'https://images.unsplash.com/photo-1618221118493-9cfa1a1c00da?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80',
    //   ],
    // ),
    // Room(
    //   roomId: 'r304',
    //   bed: 'Single Bed',
    //   windows: '1 window right',
    //   withTable: 'Side Desk',
    //   floorStyle: 'Italian Marvel',
    //   ac: '1 Ton',
    //   balcony: 'No',
    //   title: 'Room 304',
    //   size: 300.0,
    //   imageList: [
    //     'https://images.unsplash.com/photo-1618220924273-338d82d6b886?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80',
    //     'https://images.unsplash.com/photo-1616594092403-fb65629b0a46?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
    //     'https://images.unsplash.com/photo-1618221770758-01929bf5ed39?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80',
    //     'https://images.unsplash.com/photo-1615529162924-f8605388461d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
    //     'https://images.unsplash.com/photo-1583845112203-29329902332e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    //     'https://images.unsplash.com/photo-1552558636-f6a8f071c2b3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',
    //   ],
    // ),
    // Room(
    //   roomId: 'r305',
    //   bed: 'Duplex Bed',
    //   windows: '2 windows left',
    //   withTable: 'Coffee Table',
    //   floorStyle: 'Carpet',
    //   ac: 'No',
    //   balcony: 'No',
    //   title: 'Room 305',
    //   size: 200.0,
    //   imageList: [
    //     'https://images.unsplash.com/photo-1586105251261-72a756497a11?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=958&q=80',
    //     'https://images.unsplash.com/photo-1567899482751-c8647fda8155?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    //     'https://images.unsplash.com/photo-1531835551805-16d864c8d311?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    //     'https://images.unsplash.com/photo-1612320743558-020669ff20e8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=872&q=80',
    //     'https://images.unsplash.com/photo-1578683010236-d716f9a3f461?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //     'https://images.unsplash.com/photo-1619292585355-ab0e3fd509fe?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=872&q=80',
    //   ],
    // ),
    // Room(
    //   roomId: 'r401',
    //   bed: 'Single Bed',
    //   windows: '2 windows left',
    //   withTable: 'No',
    //   floorStyle: 'Wooden Floor',
    //   ac: 'No',
    //   balcony: 'Yes',
    //   title: 'Room 401',
    //   size: 440.0,
    //   imageList: [
    //     'https://images.unsplash.com/photo-1560185893-a55cbc8c57e8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //     'https://images.unsplash.com/photo-1601479207163-3c4dd6b0bb91?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
    //     'https://images.unsplash.com/photo-1540518614846-7eded433c457?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=857&q=80',
    //     'https://images.unsplash.com/photo-1594296041896-bcb34adeae60?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
    //     'https://images.unsplash.com/photo-1592487111738-caa190fcb6e7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=849&q=80',
    //     'https://images.unsplash.com/photo-1615800001964-5afd0ae8e49a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
    //   ],
    // ),
    // Room(
    //   roomId: 'r402',
    //   bed: 'Three Beds',
    //   windows: '2 windows left - right',
    //   withTable: 'Balcony Table',
    //   floorStyle: 'Italian Marvel',
    //   ac: '2 Ton',
    //   balcony: 'Yes',
    //   title: 'Room 402',
    //   size: 450.0,
    //   imageList: [
    //     'https://images.unsplash.com/photo-1568495248636-6432b97bd949?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
    //     'https://images.unsplash.com/photo-1512918728675-ed5a9ecdebfd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //     'https://images.unsplash.com/photo-1507652313519-d4e9174996dd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //     'https://images.unsplash.com/photo-1616594039964-ae9021a400a0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
    //     'https://images.unsplash.com/photo-1617103996702-96ff29b1c467?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80',
    //     'https://images.unsplash.com/photo-1615529182904-14819c35db37?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
    //   ],
    // ),
    // Room(
    //   roomId: 'r403',
    //   bed: 'Single Bed',
    //   windows: '2 windows left - right',
    //   withTable: 'Side Desk',
    //   floorStyle: 'Tiles',
    //   ac: 'No',
    //   balcony: 'No',
    //   title: 'Room 403',
    //   size: 250.0,
    //   imageList: [
    //     'https://images.unsplash.com/photo-1618219740975-d40978bb7378?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1100&q=80',
    //     'https://images.unsplash.com/photo-1586105251261-72a756497a11?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=958&q=80',
    //     'https://images.unsplash.com/photo-1601479207163-3c4dd6b0bb91?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
    //     'https://images.unsplash.com/photo-1507086182422-97bd7ca2413b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=876&q=80',
    //     'https://images.unsplash.com/photo-1618221639244-c1a8502c0eb9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
    //     'https://images.unsplash.com/photo-1588046130717-0eb0c9a3ba15?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=786&q=80',
    //   ],
    // ),
    // Room(
    //   roomId: 'r404',
    //   bed: 'Single Bed',
    //   windows: '1 window right',
    //   withTable: 'No',
    //   floorStyle: 'Italian Marvel',
    //   ac: '1 Ton',
    //   balcony: 'No',
    //   title: 'Room 404',
    //   size: 380.0,
    //   imageList: [
    //     'https://images.unsplash.com/photo-1574873215043-44119461cb3b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //     'https://images.unsplash.com/photo-1533633310920-cc9bf1e7f9b0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //     'https://images.unsplash.com/photo-1618221195710-dd6b41faaea6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1100&q=80',
    //     'https://images.unsplash.com/photo-1556020685-ae41abfc9365?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
    //     'https://images.unsplash.com/photo-1501876725168-00c445821c9e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //     'https://images.unsplash.com/photo-1494203484021-3c454daf695d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //   ],
    // ),
    // Room(
    //   roomId: 'r405',
    //   bed: 'Double Bed',
    //   windows: '2 windows left',
    //   withTable: 'Coffee Table',
    //   floorStyle: 'Mozaik',
    //   ac: '1 Ton',
    //   balcony: 'Yes',
    //   title: 'Room 405',
    //   size: 200.0,
    //   imageList: [
    //     'https://images.unsplash.com/photo-1565184099246-7c2dfcbf5811?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //     'https://images.unsplash.com/photo-1567899482751-c8647fda8155?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
    //     'https://images.unsplash.com/photo-1574643156929-51fa098b0394?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //     'https://images.unsplash.com/photo-1484101403633-562f891dc89a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=874&q=80',
    //     'https://images.unsplash.com/photo-1558211583-d26f610c1eb1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=806&q=80',
    //     'https://images.unsplash.com/photo-1615800002234-05c4d488696c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
    //   ],
    // ),
    // Room(
    //   roomId: 'r501',
    //   bed: 'Double Bed',
    //   windows: '1 window left',
    //   withTable: 'Reading Table',
    //   floorStyle: 'Italian Marvel',
    //   ac: 'No',
    //   balcony: 'No',
    //   title: 'Room 501',
    //   size: 640.0,
    //   imageList: [
    //     'https://images.unsplash.com/photo-1560185893-a55cbc8c57e8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //     'https://images.unsplash.com/photo-1618220924273-338d82d6b886?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80',
    //     'https://images.unsplash.com/photo-1618220321979-ecb3a975aa82?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80',
    //     'https://images.unsplash.com/photo-1617104611622-d5f245d317f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=884&q=80',
    //     'https://images.unsplash.com/photo-1592487111738-caa190fcb6e7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=849&q=80',
    //     'https://images.unsplash.com/photo-1560448205-4d9b3e6bb6db?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //   ],
    // ),
    // Room(
    //   roomId: 'r502',
    //   bed: 'Single Bed',
    //   windows: '1 window right',
    //   withTable: 'No',
    //   floorStyle: 'Wooden Floor',
    //   ac: '1 Ton',
    //   balcony: 'No',
    //   title: 'Room 502',
    //   size: 450.0,
    //   imageList: [
    //     'https://images.unsplash.com/photo-1560185893-d9680d601385?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //     'https://images.unsplash.com/photo-1512918728675-ed5a9ecdebfd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //     'https://images.unsplash.com/photo-1507652313519-d4e9174996dd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //     'https://images.unsplash.com/photo-1560185893-a55cbc8c57e8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //     'https://images.unsplash.com/photo-1560448075-57d0285fc59b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //     'https://images.unsplash.com/flagged/photo-1573168710865-2e4c680d921a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //   ],
    // ),
    // Room(
    //   roomId: 'r503',
    //   bed: 'Duplex Bed',
    //   windows: '2 windows left - right',
    //   withTable: 'Coffee Table',
    //   floorStyle: 'Tiles',
    //   ac: 'No',
    //   balcony: 'Yes',
    //   title: 'Room 503',
    //   size: 250.0,
    //   imageList: [
    //     'https://images.unsplash.com/photo-1586105251261-72a756497a11?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=958&q=80',
    //     'https://images.unsplash.com/photo-1616486232086-81d47190669a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80',
    //     'https://images.unsplash.com/photo-1617098474202-0d0d7f60c56b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
    //     'https://images.unsplash.com/photo-1616627686843-ad0c89cc5c0b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
    //     'https://images.unsplash.com/photo-1618221639244-c1a8502c0eb9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
    //     'https://images.unsplash.com/photo-1618296778887-7924838508a2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80',
    //   ],
    // ),
    // Room(
    //   roomId: 'r504',
    //   bed: 'Three Beds',
    //   windows: '2 windows left',
    //   withTable: 'Side Desk',
    //   floorStyle: 'Italian Marvel',
    //   ac: '1 Ton',
    //   balcony: 'Yes',
    //   title: 'Room 504',
    //   size: 300.0,
    //   imageList: [
    //     'https://images.unsplash.com/photo-1565184099246-7c2dfcbf5811?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //     'https://images.unsplash.com/photo-1533633310920-cc9bf1e7f9b0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //     'https://images.unsplash.com/photo-1616464598304-211e2e1b08b9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
    //     'https://images.unsplash.com/photo-1561186793-c214b99ef55b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=776&q=80',
    //     'https://images.unsplash.com/photo-1567899482751-c8647fda8155?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
    //     'https://images.unsplash.com/photo-1494203484021-3c454daf695d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //   ],
    // ),
    // Room(
    //   roomId: 'r505',
    //   bed: 'Three Beds',
    //   windows: '2 windows left',
    //   withTable: 'Coffee Table',
    //   floorStyle: 'Tiles',
    //   ac: 'No',
    //   balcony: 'Yes',
    //   title: 'Room 505',
    //   size: 200.0,
    //   imageList: [
    //     'https://images.unsplash.com/photo-1616594039964-ae9021a400a0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
    //     'https://images.unsplash.com/photo-1616137507072-f7276b168614?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1032&q=80',
    //     'https://images.unsplash.com/photo-1491926626787-62db157af940?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //     'https://images.unsplash.com/photo-1615874959474-d609969a20ed?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
    //     'https://images.unsplash.com/photo-1505691938895-1758d7feb511?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //     'https://images.unsplash.com/photo-1615529162924-f8605388461d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
    //   ],
    // ),
    // Room(
    //   roomId: 'r601',
    //   bed: 'Duplex Bed',
    //   windows: '1 window left',
    //   withTable: 'No',
    //   floorStyle: 'Tiles',
    //   ac: '1 Ton',
    //   balcony: 'Yes',
    //   title: 'Room 601',
    //   size: 480.0,
    //   imageList: [
    //     'https://images.unsplash.com/photo-1618221520382-3d68e64f58ff?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
    //     'https://images.unsplash.com/photo-1616628075500-c4f86a9d7b16?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
    //     'https://images.unsplash.com/photo-1616627561839-074385245ff6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxjb2xsZWN0aW9uLXBhZ2V8MXwxMTc3NzcwMXx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=700&q=60',
    //     'https://images.unsplash.com/photo-1541123603104-512919d6a96c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //     'https://images.unsplash.com/photo-1592487111738-caa190fcb6e7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=849&q=80',
    //     'https://images.unsplash.com/photo-1615800001964-5afd0ae8e49a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
    //   ],
    // ),
    // Room(
    //   roomId: 'r602',
    //   bed: 'Double Bed',
    //   windows: '1 window right',
    //   withTable: 'Side Desk',
    //   floorStyle: 'Italian Marvel',
    //   ac: 'No',
    //   balcony: 'No',
    //   title: 'Room 602',
    //   size: 450.0,
    //   imageList: [
    //     'https://images.unsplash.com/photo-1521782462922-9318be1cfd04?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=876&q=80',
    //     'https://images.unsplash.com/photo-1505821100160-522e6d017a36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=767&q=80',
    //     'https://images.unsplash.com/photo-1512918728675-ed5a9ecdebfd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //     'https://images.unsplash.com/photo-1566665797739-1674de7a421a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
    //     'https://images.unsplash.com/photo-1505773278895-5efa7b11679a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=922&q=80',
    //     'https://images.unsplash.com/photo-1541123356219-284ebe98ae3b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //   ],
    // ),
    // Room(
    //   roomId: 'r603',
    //   bed: 'Three Beds',
    //   windows: '2 windows left',
    //   withTable: 'No',
    //   floorStyle: 'Tiles',
    //   ac: '1 Ton',
    //   balcony: 'Yes',
    //   title: 'Room 603',
    //   size: 350.0,
    //   imageList: [
    //     'https://images.unsplash.com/photo-1445991842772-097fea258e7b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //     'https://images.unsplash.com/photo-1576354302919-96748cb8299e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=929&q=80',
    //     'https://images.unsplash.com/photo-1578898887932-dce23a595ad4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
    //     'https://images.unsplash.com/photo-1578898887155-72e9a7da1fb3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
    //     'https://images.unsplash.com/photo-1578898886175-fa538133191d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
    //     'https://images.unsplash.com/photo-1578898886225-c7c894047899?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
    //   ],
    // ),
    // Room(
    //   roomId: 'r604',
    //   bed: 'Double Bed',
    //   windows: '1 window left',
    //   withTable: 'Reading Table',
    //   floorStyle: 'Italian Marvel',
    //   ac: 'No',
    //   balcony: 'Yes',
    //   title: 'Room 604',
    //   size: 360.0,
    //   imageList: [
    //     'https://images.unsplash.com/photo-1572891086295-6c1c7c476549?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=812&q=80',
    //     'https://images.unsplash.com/photo-1577791465291-35b823edfeba?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
    //     'https://images.unsplash.com/photo-1578898887193-90f85d96cd7c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
    //     'https://images.unsplash.com/photo-1550252225-69800809ba78?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
    //     'https://images.unsplash.com/photo-1583845112203-29329902332e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
    //     'https://images.unsplash.com/photo-1501876725168-00c445821c9e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
    //   ],
    // ),
    // Room(
    //   roomId: 'r605',
    //   bed: 'Double Bed',
    //   windows: '1 window right',
    //   withTable: 'Side Desk',
    //   floorStyle: 'Tiles',
    //   isFavorite: true,
    //   ac: 'No',
    //   balcony: 'Yes',
    //   title: 'Room 605',
    //   size: 500.0,
    //   imageList: [
    //     'https://images.unsplash.com/photo-1562438668-bcf0ca6578f0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80',
    //     'https://images.unsplash.com/photo-1582582621959-48d27397dc69?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80',
    //     'https://images.unsplash.com/photo-1589911057171-44545e48c56b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
    //     'https://images.unsplash.com/photo-1589911057222-ba2c1f74a590?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
    //     'https://images.unsplash.com/photo-1565329921943-7e537b7a2ea9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
    //     'https://images.unsplash.com/photo-1615800002234-05c4d488696c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80',
    //   ],
    // ),
  ];
  List<String> selectedData = [];
  List<Room> get roomList {
    return [..._roomList];
  }

  // List<Room> get selectedRoom => _roomList;
  List<Room> selectedRoom = [];
  Future<void> seleted() async {
    final _list = await _roomList;
    // _list.map((e) {
    //   return e;
    // }).toList();
    for (var item in _list) {
      selectedRoom.add(item);
      // if (selectedData.isEmpty) {
      //   selectedRoom.add(item);
      // } else {
      //   for (var items in selectedData) {
      //     if (bedList[item.ac] == items) {
      //       selectedRoom.add(item);
      //     }
      //   }
      // }
    }
    notifyListeners();
  }

  Future<void> fetchData() async {
    const url =
        'https://firestore.googleapis.com/v1/projects/hotel-app-bd91c/databases/(default)/documents/rooms';
    try {
      final response = await http.get(Uri.parse(url));
      //print(json.decode(response.body));
      final responseData = json.decode(response.body) as Map<String, dynamic>;
      List _gatList = [];
      for (var item in responseData['documents']) {
        _gatList.add(item['fields']);
      }
      //print(_gatList);
      final List<Room> getRoomList = [];
      _gatList.forEach((roomData) {
        getRoomList.add(
          Room(
              roomId: roomData['roomId']['stringValue'].toString(),
              bed: roomData['bed']['stringValue'].toString(),
              windows: roomData['windows']['stringValue'].toString(),
              withTable: roomData['withTable']['stringValue'].toString(),
              floorStyle: roomData['floorStyle']['stringValue'].toString(),
              ac: roomData['ac']['stringValue'].toString(),
              balcony: roomData['balcony']['stringValue'].toString(),
              title: roomData['title']['stringValue'].toString(),
              size: double.parse(roomData['size']['stringValue'].toString()),
              imageList: roomData['imageList']['arrayValue']['values']),
        );
      });
      _roomList = getRoomList;
    } catch (error) {
      print(error);
    }
    notifyListeners();
  }

  Future<void> fetchBed() async {
    const url =
        'https://firestore.googleapis.com/v1/projects/hotel-app-bd91c/databases/(default)/documents/beds';

    final response = await http.get(Uri.parse(url));
    final responsedata = json.decode(response.body) as Map<String, dynamic>;
    List _getdata = [];
    for (var item in responsedata['documents']) {
      _getdata.add(item['fields']);
    }
    List<Bed> _bed = [];
    _getdata.forEach((bedData) {
      _bed.add(Bed(
          name: bedData['name']['stringValue'],
          price: double.parse(bedData['price']['stringValue'].toString())));
    });
    bedList = _bed;
    //print(_getdata);
  }
}
