import 'package:flutter/material.dart';
import 'package:hotel_app/data/room_class.dart';
import 'package:hotel_app/data/room_data.dart';
import 'package:hotel_app/models/booking.dart';
import 'package:hotel_app/widgets/booking_details/booking_details.dart';
import 'package:hotel_app/widgets/checkout/checkout_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CheckOutMain extends StatefulWidget {
  const CheckOutMain({Key? key}) : super(key: key);

  @override
  State<CheckOutMain> createState() => _CheckOutMainState();
}

class _CheckOutMainState extends State<CheckOutMain> {
  final List<DateTime> _addOut = [DateTime.now(), DateTime.now()];

  final _inDateController = TextEditingController();
  final _outDateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  DateTime _start = DateTime.now();
  DateTime _out = DateTime.now();
  void _outdate() async {
    final _inDate = await Provider.of<CheckOutProvider>(context, listen: false)
        .selectDate(context);
    if (_inDate == null) return;
    setState(() {
      _out = DateTime(_inDate.year, _inDate.month, _inDate.day);
      _outDateController.text = DateFormat('yyyy-MM-dd').format(_out);

      _addOut[1] = _out;
    });
  }

  void _indate() async {
    final _inDate = await Provider.of<CheckOutProvider>(context, listen: false)
        .selectDate(context);
    if (_inDate == null) return;
    setState(() {
      _start = DateTime(_inDate.year, _inDate.month, _inDate.day);
      _inDateController.text = DateFormat('yyyy-MM-dd').format(_start);

      _addOut[0] = _start;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<double> _total = [];
    String? _bed;
    String? _window;
    String? _floorStyle;
    String? _table;
    String? _balcony;
    String? _ac;

    final _args = ModalRoute.of(context)!.settings.arguments as SelectedData;
    final _room = Provider.of<RoomProvider>(context)
        .roomList
        .where((element) => element.roomId == _args.roomId);

    _room.forEach((element) {
      _bed = element.bed;
      _window = element.windows;
      _floorStyle = element.floorStyle;
      _table = element.withTable;
      _ac = element.ac;
      _balcony = element.balcony;
    });
    final _getbed = Provider.of<RoomProvider>(context)
        .bedList
        .where((element) => element.name == _bed);
    _total.add(_getbed.first.price);

    final _getwindow = Provider.of<RoomProvider>(context)
        .windowsList
        .where((element) => element['name'] == _window);
    _total.add(_getwindow.first['price']);

    final _getfloor = Provider.of<RoomProvider>(context)
        .floorStyleList
        .where((element) => element['name'] == _floorStyle);
    _total.add(_getfloor.first['price']);

    final _getac = Provider.of<RoomProvider>(context)
        .acList
        .where((element) => element['name'] == _ac);
    _total.add(_getac.first['price']);
    final _gettable = Provider.of<RoomProvider>(context)
        .tableList
        .where((element) => element['name'] == _table);
    _total.add(_gettable.first['price']);
    final _getbalcony = Provider.of<RoomProvider>(context)
        .balconyList
        .where((element) => element['name'] == _balcony.toString());
    _total.add(_getbalcony.first['price']);

    double _totalPrice = _total.reduce((a, b) => a + b);
    double total = 0.0;
    int _day = 0;
    if (_addOut.isNotEmpty) {
      final int days = _addOut[1].difference(_addOut[0]).inDays;
      _day += days;
      total += days.toDouble() * _totalPrice;
    }
    double _totals = total;
    //print(_getbed.first.name);
    return Scaffold(
      appBar: AppBar(
        title: Text('Total Charge'),
      ),
      body: SingleChildScrollView(
        primary: true,
        //physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            topRight: Radius.circular(12.0)),
                        color: Colors.amber.shade700,
                      ),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.all(16.0),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  width: 2.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            width: MediaQuery.of(context).size.width / 1.7,
                            child: Text(
                              _getbed.first.name,
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  width: 2.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width / 3,
                            child: Text(
                              _getbed.first.price.toString(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.amber.shade700,
                      ),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.all(16.0),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  width: 2.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            width: MediaQuery.of(context).size.width / 1.7,
                            child: Text(
                              _getwindow.first['name'],
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: const BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  width: 2.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width / 3,
                            child: Text(
                              _getwindow.first['price'].toString(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.amber.shade700,
                      ),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.all(16.0),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  width: 2.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            width: MediaQuery.of(context).size.width / 1.7,
                            child: Text(
                              _gettable.first['name'],
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: const BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  width: 2.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width / 3,
                            child: Text(
                              _gettable.first['price'].toString(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.amber.shade700,
                      ),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  width: 2.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            width: MediaQuery.of(context).size.width / 1.7,
                            child: Text(
                              _getfloor.first['name'],
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: const BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  width: 2.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width / 3,
                            child: Text(
                              _getfloor.first['price'].toString(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.amber.shade700,
                      ),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  width: 2.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            width: MediaQuery.of(context).size.width / 1.7,
                            child: Text(
                              "Balcony ${_getbalcony.first['name']}",
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: const BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  width: 2.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width / 3,
                            child: Text(
                              _getbalcony.first['price'].toString(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    _getac.first['name'] != 'No'
                        ? Container(
                            decoration: BoxDecoration(
                              color: Colors.amber.shade700,
                            ),
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(16.0),
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      right: BorderSide(
                                        width: 2.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width / 1.7,
                                  child: Text(
                                    "Ac ${_getac.first['name']}",
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(16.0),
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      left: BorderSide(
                                        width: 2.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width / 3,
                                  child: Text(
                                    _getac.first['price'].toString(),
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        : const SizedBox(
                            //: 4,
                            ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(12.0),
                            bottomRight: Radius.circular(12.0)),
                        color: Colors.amber.shade700,
                      ),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.all(16.0),
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              border: Border(
                                right: BorderSide(
                                  width: 2.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            width: MediaQuery.of(context).size.width / 1.7,
                            child: const Text(
                              'Total Charge',
                              style: TextStyle(fontSize: 18.0),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(16.0),
                            decoration: const BoxDecoration(
                              border: Border(
                                left: BorderSide(
                                  width: 2.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width / 3,
                            child: Text(
                              _totalPrice.toString(),
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: Container(
                  //width: double.infinity,
                  padding: const EdgeInsets.all(26.0),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(16.0)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2.4,
                              height: 40,
                              padding: const EdgeInsets.only(
                                top: 12.0,
                              ),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16.0),
                                      bottomLeft: Radius.circular(16.0))),
                              child: TextFormField(
                                readOnly: true,
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Check-In',
                                    hintStyle: TextStyle(fontSize: 20)),
                              ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2.6,
                              height: 40,
                              padding: const EdgeInsets.only(
                                top: 12.0,
                              ),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(16.0),
                                      bottomRight: Radius.circular(16.0))),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'yyyy-mm-dd',
                                    hintStyle: TextStyle(fontSize: 20)),
                                keyboardType: TextInputType.datetime,
                                onTap: () => _indate(),
                                controller: _inDateController,
                                textInputAction: TextInputAction.done,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2.4,
                              height: 40,
                              padding: const EdgeInsets.only(
                                top: 12.0,
                              ),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(16.0),
                                      bottomLeft: Radius.circular(16.0))),
                              child: TextFormField(
                                readOnly: true,
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Check-Out',
                                    hintStyle: TextStyle(fontSize: 20)),
                              ),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2.6,
                              height: 40,
                              padding: EdgeInsets.only(
                                top: 12.0,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(16.0),
                                      bottomRight: Radius.circular(16.0))),
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'yyyy-mm-dd',
                                    hintStyle: TextStyle(fontSize: 20)
                                    //filled: true,
                                    //fillColor: Colors.white,
                                    ),
                                keyboardType: TextInputType.datetime,
                                onTap: () => _outdate(),
                                controller: _outDateController,
                                textInputAction: TextInputAction.done,
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width / 2.4,
                                height: 40,
                                padding: const EdgeInsets.only(
                                  top: 12.0,
                                ),
                                child: const Text(
                                  'TOTAL',
                                  style: TextStyle(fontSize: 24),
                                  textAlign: TextAlign.center,
                                )),
                            const SizedBox(
                              width: 4,
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width / 2.6,
                                height: 40,
                                padding: const EdgeInsets.only(
                                  top: 12.0,
                                ),
                                child: Text(
                                  total.abs().toString(),
                                  style: const TextStyle(fontSize: 24),
                                  textAlign: TextAlign.center,
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 16.0, right: 16.0),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        image: DecorationImage(
                            image: AssetImage('assets/images/bkash.jpg')),
                      ),
                      child: GestureDetector(
                        onTap: () {},
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        image: DecorationImage(
                            image: AssetImage('assets/images/rocket.png')),
                      ),
                      child: GestureDetector(
                        onTap: () {},
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        image: DecorationImage(
                            image: AssetImage('assets/images/naged.png')),
                      ),
                      child: GestureDetector(
                        onTap: () {},
                      ),
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
                        image: DecorationImage(
                            image: AssetImage('assets/images/nexuspay.jpeg')),
                      ),
                      child: GestureDetector(
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.centerRight,
                //margin: const EdgeInsets.only(right: 20.0),
                //width: 80,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    child: const Text(
                      'CHACKOUT',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => BookingDetails()));
                      Navigator.of(context).pushNamed(
                        '/booking-details',
                        arguments:
                            // SelectedData(
                            //     roomId: _args.roomId,
                            //     charge: _totalPrice,
                            //     amount: total.toString(),
                            //     days: _day),
                            Booking(
                                roomId: _args.roomId,
                                charge: _totalPrice,
                                amount: total,
                                days: _day,
                                bed: _getbed,
                                window: _getwindow,
                                ac: _getac,
                                table: _gettable,
                                floor: _getfloor,
                                balcony: _getbalcony,
                                inDate: _addOut[0],
                                outDate: _addOut[1]),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
