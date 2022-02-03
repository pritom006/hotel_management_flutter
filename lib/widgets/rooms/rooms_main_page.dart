import 'package:flutter/material.dart';
import 'package:hotel_app/data/room_class.dart';
import 'package:hotel_app/data/room_data.dart';
import 'package:provider/provider.dart';

import 'room_card.dart';

class RoomsPage extends StatelessWidget {
  const RoomsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as SelectedData;
    final List bed = Provider.of<RoomProvider>(context, listen: false).bedList;
    final List windows =
        Provider.of<RoomProvider>(context, listen: false).windowsList;

    final List _floor =
        Provider.of<RoomProvider>(context, listen: false).floorStyleList;
    final List _table =
        Provider.of<RoomProvider>(context, listen: false).tableList;
    final List _ac = Provider.of<RoomProvider>(context, listen: false).acList;
    final List<Room> dataList =
        Provider.of<RoomProvider>(context, listen: false).roomList;

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.red.shade300, Colors.red.shade200, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.selectName.toString()),
          centerTitle: true,
          backgroundColor: const Color(0xFFFF4B4B),
        ),
        backgroundColor: Colors.transparent,
        body: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 4),
            ),
            itemCount: dataList.length,
            itemBuilder: (BuildContext context, int index) =>
                NewItemBuilder(indexs: index)),
      ),
    );
  }
}

class NewItemBuilder extends StatelessWidget {
  final int indexs;
  const NewItemBuilder({Key? key, required this.indexs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Room> dataList =
        Provider.of<RoomProvider>(context, listen: false).roomList;
    return RoomCard(
        isFavorite: dataList[indexs].isFavorite,
        roomId: dataList[indexs].roomId,
        roomTitle: dataList[indexs].title,
        roomsize: dataList[indexs].size.round(),
        imgaeUrl: dataList[indexs].imageList[0]);
  }
}
