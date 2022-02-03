import 'package:flutter/material.dart';
import 'package:hotel_app/data/room_class.dart';

class RoomCard extends StatefulWidget {
  final String roomTitle;
  final int roomsize;
  final String imgaeUrl;
  final String roomId;
  bool? isFavorite;
  RoomCard(
      {Key? key,
      required this.roomId,
      required this.roomTitle,
      required this.roomsize,
      required this.imgaeUrl,
      this.isFavorite})
      : super(key: key);

  @override
  State<RoomCard> createState() => _RoomCardState();
}

class _RoomCardState extends State<RoomCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          // Navigator.of(context).pushNamed('/details');
          Navigator.pushNamed(context, '/details',
              arguments: SelectedData(detailsRoomId: widget.roomId));
        },
        child: Column(
          children: [
            Image(
              height: 220,
              fit: BoxFit.cover,
              image: NetworkImage(widget.imgaeUrl),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 12.0),
              child: Text(
                widget.roomTitle.toString(),
                textAlign: TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 16),
                //maxLines: 1,
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     IconButton(
            //         onPressed: () {
            //           setState(() {
            //             if (widget.isFavorite == true) {
            //               widget.isFavorite = false;
            //             } else {
            //               widget.isFavorite = true;
            //             }
            //           });
            //         },
            //         icon: widget.isFavorite == true
            //             ? const Icon(
            //                 Icons.favorite,
            //                 color: Colors.red,
            //               )
            //             : const Icon(
            //                 Icons.favorite_border,
            //                 color: Colors.grey,
            //               )),
            //     TextButton(
            //         style: TextButton.styleFrom(
            //             shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(49.0))),
            //         onPressed: () {},
            //         child: const Icon(Icons.share_outlined)),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
