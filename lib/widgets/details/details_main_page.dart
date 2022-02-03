import 'package:flutter/material.dart';
import 'package:hotel_app/data/imageList.dart';
import 'package:hotel_app/data/room_class.dart';
import 'package:hotel_app/data/room_data.dart';
import 'package:provider/provider.dart';

class DetailsMainPage extends StatefulWidget {
  const DetailsMainPage({Key? key}) : super(key: key);

  @override
  State<DetailsMainPage> createState() => _DetailsMainPageState();
}

class _DetailsMainPageState extends State<DetailsMainPage> {
  int _imageIndex = 0;
  String _status = 'overView';
  @override
  Widget build(BuildContext context) {
    final List _images = [];
    final _args = ModalRoute.of(context)!.settings.arguments as SelectedData;
    final _roomsData = Provider.of<RoomProvider>(context)
        .roomList
        .where((element) => element.roomId == _args.detailsRoomId);
    _roomsData.forEach((element) {
      for (var item in element.imageList) {
        _images.add(item['stringValue']);
      }
    });

    Future<void> details(String data) async {
      setState(() {
        _status = data;
      });
    }

    return Scaffold(
      bottomNavigationBar: Container(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(140, 55),
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(16.0),
            // ),
          ),
          child: Text(
            'BOOKING NOW',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
          onPressed: () {
            // Navigator.of(context).pushNamed('/checkout');
            Navigator.pushNamed(context, '/checkout',
                arguments: SelectedData(roomId: _args.detailsRoomId));
          },
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverAppBar(
              iconTheme: IconThemeData(color: Colors.black),
              title: Text(
                'Details',
                style: TextStyle(color: Colors.black),
              ),
              expandedHeight: 400,
              backgroundColor: Colors.black12,
              flexibleSpace: FlexibleSpaceBar(
                background: Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(_images[_imageIndex] ?? _images[0])),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Column(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.only(left: 20.0, top: 10, bottom: 10.0),
                      alignment: Alignment.centerLeft,
                      child: Text('Gallery',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Container(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: _images.map((imagelink) {
                          return Container(
                            margin: const EdgeInsets.all(4),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _imageIndex = _images.indexOf(imagelink);
                                });
                              },
                              child: Image(
                                  width: 120,
                                  height: 80,
                                  fit: BoxFit.cover,
                                  image: NetworkImage(imagelink.toString())),
                            ),
                          );
                        }).toList()),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.all(8.0),
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                          //color: Color(0xFF8394FF),
                          borderRadius: BorderRadius.circular(16.0)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Text(
                              _roomsData.first.title,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                letterSpacing: 3,
                                color: Colors.black,
                                fontSize: 20,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            //alignment:,
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              'Rating by Customer',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '4.8/5',
                                style: TextStyle(
                                    fontSize: 23,
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.red,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.red,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.red,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.red,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.red,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 16.0),
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Apartment Fasilitas',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              sliver: SliverGrid.count(
                crossAxisCount: 3,
                childAspectRatio: 2 / 1.4,
                children: [
                  Container(
                    //color: Colors.amber,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.bed_outlined,
                          size: 38,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 7.0,
                        ),
                        Text(
                          '1 Beds',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    //color: Colors.amber,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.wifi,
                          size: 38,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 7.0,
                        ),
                        Text(
                          'WIFI',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    //color: Colors.amber,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.tv_outlined,
                          size: 38,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 7.0,
                        ),
                        Text(
                          'TV',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    //color: Colors.amber,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.bathroom_outlined,
                          size: 38,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 7.0,
                        ),
                        Text(
                          '1 bathroom',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    //color: Colors.amber,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.table_chart_outlined,
                          size: 38,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 7.0,
                        ),
                        Text(
                          '1 table',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    //color: Colors.amber,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.ac_unit_outlined,
                          size: 38,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 7.0,
                        ),
                        Text(
                          '1 Ton',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size.fromHeight(55),
                                  primary: _status == 'overView'
                                      ? Colors.green.withOpacity(0.9)
                                      : Colors.green.withOpacity(0.5),
                                ),
                                child: Text('Over View'),
                                onPressed: () => details('overView')),
                          ),
                          SizedBox(
                            width: 6.0,
                          ),
                          Expanded(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size.fromHeight(55),
                                  primary: _status == 'rating'
                                      ? Colors.green.withOpacity(0.9)
                                      : Colors.green.withOpacity(0.5),
                                ),
                                child: Text('Rating & Reviews (100)'),
                                onPressed: () => details('rating')),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    _status == 'overView'
                        ? Container(
                            margin: EdgeInsets.only(bottom: 16.0),
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                              children: [
                                Text(
                                  'Bed : ${_roomsData.first.bed} , Window : ${_roomsData.first.windows} , Floor Style : ${_roomsData.first.floorStyle} , Table : ${_roomsData.first.withTable} , Balcony : ${_roomsData.first.balcony} , AC : ${_roomsData.first.ac}',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            //color: Colors.green,
                            //height: 300,
                            margin: EdgeInsets.only(bottom: 16.0),
                            child: Text(
                              'Not Work ',
                              style: TextStyle(fontSize: 30),
                            ),
                          )
                  ],
                ),
              ),
            )
          ],
        ),
      ),

      // body: SingleChildScrollView(
      //   child: Padding(
      //     padding: const EdgeInsets.only(bottom: 20.0),
      //     child: Column(
      //       children: [
      //         Container(
      //           child: Row(
      //             children: [
      //               Container(
      //                 width: MediaQuery.of(context).size.width / 3.9,
      //                 height: 300,
      //                 child: SingleChildScrollView(
      //                   child: Column(
      //                       children: _images.map((imagelink) {
      //                     return Container(
      //                       margin: const EdgeInsets.all(4),
      //                       child: GestureDetector(
      //                         onTap: () {
      //                           setState(() {
      //                             _imageIndex = _images.indexOf(imagelink);
      //                           });
      //                         },
      //                         child: Image(
      //                             width: 90,
      //                             image: NetworkImage(imagelink.toString())),
      //                       ),
      //                     );
      //                   }).toList()),
      //                 ),
      //               ),
      //               Container(
      //                 margin: EdgeInsets.only(left: 10.0),
      //                 child: Image(
      //                   width: MediaQuery.of(context).size.width / 1.4,
      //                   height: 300,
      //                   fit: BoxFit.fill,
      //                   image: NetworkImage(_images[_imageIndex] ?? _images[0]),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //         SizedBox(
      //           height: 10,
      //         ),
      //         Container(
      //           margin: EdgeInsets.all(8.0),
      //           padding: EdgeInsets.all(16.0),
      //           decoration: BoxDecoration(
      //               color: Color(0xFF8394FF),
      //               borderRadius: BorderRadius.circular(16.0)),
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               Row(
      //                 children: [
      //                   Text(
      //                     '4.8/5',
      //                     style: TextStyle(
      //                         fontSize: 23,
      //                         color: Colors.white,
      //                         fontWeight: FontWeight.bold),
      //                   ),
      //                   SizedBox(
      //                     width: 10,
      //                   ),
      //                   Container(
      //                     alignment: Alignment.center,
      //                     child: Row(
      //                       children: [
      //                         Icon(
      //                           Icons.star,
      //                           color: Colors.red,
      //                         ),
      //                         Icon(
      //                           Icons.star,
      //                           color: Colors.red,
      //                         ),
      //                         Icon(
      //                           Icons.star,
      //                           color: Colors.red,
      //                         ),
      //                         Icon(
      //                           Icons.star,
      //                           color: Colors.red,
      //                         ),
      //                         Icon(
      //                           Icons.star,
      //                           color: Colors.red,
      //                         ),
      //                       ],
      //                     ),
      //                   )
      //                 ],
      //               ),
      //               Row(
      //                 children: [
      //                   Text(
      //                     _roomsData.first.title,
      //                     style: TextStyle(
      //                       letterSpacing: 3,
      //                       color: Colors.black,
      //                       fontSize: 20,
      //                       fontFamily: 'Montserrat',
      //                       fontWeight: FontWeight.bold,
      //                     ),
      //                   ),
      //                 ],
      //               )
      //             ],
      //           ),
      //         ),
      //         Container(
      //           child: Column(
      //             children: [
      //               ListTile(
      //                 title: Text('Bed : ${_roomsData.first.roomId}'),
      //               ),
      //               ListTile(
      //                 title: Text('Window : ${_roomsData.first.windows}'),
      //               ),
      //               ListTile(
      //                 title:
      //                     Text('Floor Style : ${_roomsData.first.floorStyle}'),
      //               ),
      //               ListTile(
      //                 title: Text('Table : ${_roomsData.first.withTable}'),
      //               ),
      //               ListTile(
      //                 title: Text('A C : ${_roomsData.first.ac}'),
      //               ),
      //               ListTile(
      //                 title: Text('Balcony : ${_roomsData.first.balcony}'),
      //               ),
      //               ListTile(
      //                 title: Text('Room Size : ${_roomsData.first.size}'),
      //               ),
      //             ],
      //           ),
      //         ),
      //         Container(
      //           margin: EdgeInsets.only(right: 10.0),
      //           alignment: Alignment.bottomRight,
      //           child: ElevatedButton(
      //             style: ElevatedButton.styleFrom(
      //                 fixedSize: Size(140, 55),
      //                 shape: RoundedRectangleBorder(
      //                     borderRadius: BorderRadius.circular(16.0))),
      //             child: Text(
      //               'BOOKING',
      //               textAlign: TextAlign.center,
      //               style: TextStyle(fontSize: 20),
      //             ),
      //             onPressed: () {
      //               // Navigator.of(context).pushNamed('/checkout');
      //               Navigator.pushNamed(context, '/checkout',
      //                   arguments: SelectedData(roomId: _args.detailsRoomId));
      //             },
      //           ),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
