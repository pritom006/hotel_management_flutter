import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/data/room_class.dart';
import 'package:hotel_app/data/room_data.dart';
import 'package:hotel_app/models/authentication.dart';

import 'package:hotel_app/widgets/selected/selected.dart';
import 'package:provider/provider.dart';

import 'home_service.dart';
import 'single_bed.dart';

class HomeMainPage extends StatelessWidget {
  // const HomeMainPage({Key? key}) : super(key: key);
  List itemList = [
    {
      'textValue': 'Freedom Fighter 40% Discount',
      'image': 'assets/images/image1.jpg',
    },
    {
      'textValue': 'Friday Deals 5% Discount',
      'image': 'assets/images/image2.jpg',
    },
    {
      'textValue': ' Regular Customer 15% Discount',
      'image': 'assets/images/image3.jpg',
    },
    {
      'textValue': 'Monthly OnSale 10% Discount',
      'image': 'assets/images/wellcome.jpg',
    },
    {
      'textValue': 'Student 20% Discount',
      'image': 'assets/images/image2.jpg',
    }
  ];
  @override
  Widget build(BuildContext context) {
    final _singlebeds = Provider.of<RoomProvider>(context).roomList;
    final _bed = Provider.of<RoomProvider>(context).bedList;
    final _dataList =
        _singlebeds.where((element) => element.bed == 'Single Bed');
    final _dataList1 =
        _singlebeds.where((element) => element.bed == 'Double Bed');

    final _bedData = Provider.of<RoomProvider>(context).fetchBed();
    final _user = Provider.of<Authentication>(context).userDetails();
    // print(_user);
    //print(_bedData);
    return Column(
      //shrinkWrap: true,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.only(top: 10.0, bottom: 5.0, left: 10.0),
          child: Column(
            children: [
              CarouselSlider(
                carouselController: CarouselController(),
                items: itemList.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          //color: i['backgroundColor'],
                          image: DecorationImage(
                              fit: BoxFit.cover, image: AssetImage(i['image'])),
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Center(
                          child: Text(
                            '${i['textValue']}',
                            style: TextStyle(
                                fontSize: 38.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                  viewportFraction: 1.0,
                  height: 170,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 5),
                ),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.red.shade200,
                  Colors.white12,
                  Colors.red.shade200
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                stops: [0.1, 0.5, 0.9]),
          ),
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ServiceContainer(
                    serviceIcon: CircleAvatar(
                        backgroundColor: Colors.red.shade300,
                        radius: 30,
                        child: Icon(
                          Icons.wifi,
                          size: 35,
                          color: Colors.grey.shade200,
                        )),
                    serviceText: 'Wifi',
                  ),
                  ServiceContainer(
                    serviceIcon: CircleAvatar(
                        backgroundColor: Colors.red.shade300,
                        radius: 30,
                        child: Icon(
                          Icons.pool,
                          size: 35,
                          color: Colors.grey.shade200,
                        )),
                    serviceText: 'Pool',
                  ),
                  ServiceContainer(
                    serviceIcon: CircleAvatar(
                        backgroundColor: Colors.red.shade300,
                        radius: 30,
                        child: Icon(
                          Icons.flash_on,
                          size: 35,
                          color: Colors.grey.shade200,
                        )),
                    serviceText: 'Genarator',
                  ),
                  ServiceContainer(
                    serviceIcon: CircleAvatar(
                      backgroundColor: Colors.red.shade300,
                      radius: 30,
                      child: Icon(
                        Icons.bathtub_outlined,
                        size: 35,
                        color: Colors.grey.shade200,
                      ),
                    ),
                    serviceText: 'Cleaning',
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ServiceContainer(
                    serviceIcon: CircleAvatar(
                        backgroundColor: Colors.red.shade300,
                        radius: 30,
                        child: Icon(
                          Icons.fitness_center,
                          size: 35,
                          color: Colors.grey.shade200,
                        )),
                    serviceText: 'Gyms',
                  ),
                  ServiceContainer(
                    serviceIcon: CircleAvatar(
                        backgroundColor: Colors.red.shade300,
                        radius: 30,
                        child: Icon(
                          Icons.restaurant,
                          size: 35,
                          color: Colors.grey.shade200,
                        )),
                    serviceText: 'Restaurant',
                  ),
                  ServiceContainer(
                    serviceIcon: CircleAvatar(
                        backgroundColor: Colors.red.shade300,
                        radius: 30,
                        child: Icon(
                          Icons.local_parking,
                          size: 35,
                          color: Colors.white,
                        )),
                    serviceText: 'Car Parking',
                  ),
                ],
              )
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          //height: 300,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red.shade300, Colors.white70],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              //transform: const GradientRotation(125),
              //stops: [1.0, 1.0, 1.0],
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 00),
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                decoration: BoxDecoration(
                  color: Colors.red.shade300,
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: Text(
                  'Single Bed',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SingleBed(
                selectedRoom: _dataList,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 10, 10, 00),
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                decoration: BoxDecoration(
                  color: Colors.red.shade300,
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: Text(
                  'Double Bed',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SingleBed(
                selectedRoom: _dataList1,
              ),
            ],
          ),
        )
      ],
    );
  }
}

class ServiceContainerButton extends StatelessWidget {
  final String servic;
  final providerName;
  const ServiceContainerButton(
      {Key? key, required this.servic, this.providerName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 80,
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(16.0),
          gradient: LinearGradient(
            transform: GradientRotation(170),
            colors: [Color(0xFFEA5A56), Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            //stops: [0.5, 0.5, 0.5],
          )),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shadowColor: Colors.transparent,
          primary: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        child: Text(servic),
        onPressed: providerName != null
            ? () {
                //Navigator.of(context).pushNamed(context,'/selected',arguments: );
                Navigator.pushNamed(context, '/selected',
                    arguments:
                        SelectedData(listname: providerName, service: servic));
              }
            : () {},
      ),
    );
  }
}
