import 'package:flutter/material.dart';
import 'package:hotel_app/data/room_class.dart';
import '/widgets/rooms/room_card.dart';

class SingleBed extends StatefulWidget {
  final Iterable<Room> selectedRoom;
  const SingleBed({Key? key, required this.selectedRoom}) : super(key: key);

  @override
  State<SingleBed> createState() => _SingleBedState();
}

class _SingleBedState extends State<SingleBed> {
  @override
  Widget build(BuildContext context) {
    // final _singlebeds = Provider.of<RoomProvider>(context).roomList;
    // final _bed = Provider.of<RoomProvider>(context).bedList;

    // final _dataList =
    //     _singlebeds.where((element) => element.bed == 'Single Bed');
    return GridView.count(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 2 / 2.5,
      children: [
        ...widget.selectedRoom.map((room) {
          return RoomCard(
            roomId: room.roomId,
            roomTitle: room.title,
            roomsize: room.size.round(),
            imgaeUrl: room.imageList[0]['stringValue'],
          );
        }).toList(),
      ],
    );
  }
}
