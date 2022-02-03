import 'package:flutter/material.dart';
import 'package:hotel_app/data/room_data.dart';
import 'package:hotel_app/widgets/rooms/room_card.dart';
import 'package:provider/provider.dart';

import '../bottom_navigation_bar.dart';
import 'expansion.dart';
import 'windows_expansion.dart';

class Rooms extends StatefulWidget {
  @override
  State<Rooms> createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var _isInit = true;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   Provider.of<RoomProvider>(context).fetchData();
  //   super.initState();
  // }

  // @override
  // void didChangeDependencies() {
  //   // TODO: implement didChangeDependencies

  //   if (_isInit) {
  //     Provider.of<RoomProvider>(context).fetchData();
  //   }
  //   _isInit = false;
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    final _allRoom = Provider.of<RoomProvider>(context).roomList;
    final _allbed = Provider.of<RoomProvider>(context).bedList;

    return Scaffold(
      key: _scaffoldKey,
      bottomNavigationBar: const BottomAppBar(
        child: BottomBar(),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              TextButton(
                onPressed: () {
                  _scaffoldKey.currentState!.openEndDrawer();
                },
                child: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
              ),
            ],
            flexibleSpace: const FlexibleSpaceBar(
              title: Text("Rooms"),
            ),
          ),
          SliverGrid.count(
            crossAxisCount: 2,
            childAspectRatio: 2 / 2.5,
            children: [
              ..._allRoom.map((room) {
                return RoomCard(
                  roomId: room.roomId,
                  roomTitle: room.title,
                  roomsize: room.size.round(),
                  imgaeUrl: room.imageList[0]['stringValue'],
                );
              }),
            ],
          ),
        ],
      ),
      endDrawer: Drawer(
        backgroundColor: Colors.red.shade100,
        child: ListView(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(
                    Icons.align_horizontal_left_rounded,
                    color: Colors.white,
                  ),
                  const Text(
                    'Filters',
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            // RoomFilterExpansion(
            //   getList: _allbed,
            // ),
            // WindowsFilterExpansion(
            //   getList: Provider.of<RoomProvider>(context).windowsList,
            // ),
          ],
        ),
      ),
    );
  }
}
