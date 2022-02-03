import 'package:flutter/material.dart';

class CheckOut extends StatefulWidget {
  CheckOut({Key? key}) : super(key: key);

  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: Container(
          padding: EdgeInsets.all(10.0),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: Colors.cyan[300],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "CHECKOUT",
                style: TextStyle(
                  fontSize: 38.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 270,
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: Colors.orangeAccent,
                borderRadius: BorderRadius.circular(16.0)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          //color: Colors.red,
                          border: Border(
                            right: BorderSide(
                              color: Colors.white,
                              width: 2.0,
                              style: BorderStyle.solid,
                            ),
                            bottom: BorderSide(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                        ),
                        height: 30,
                        width: MediaQuery.of(context).size.width / 2,
                        // color: Colors.orangeAccent,
                        child: Text("__Charge"),
                      ),
                      Container(
                        //alignment: Alignment.center,
                        //width: double.infinity,
                        decoration: BoxDecoration(
                          //color: Colors.red,
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                        ),
                        height: 30,
                        //width: MediaQuery.of(context).size.width / 2,
                        // color: Colors.orangeAccent,
                        child: Center(
                          child: Text(
                            "300TK",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Expanded(
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     crossAxisAlignment: CrossAxisAlignment.stretch,
                //     children: [
                //       Container(
                //         alignment: Alignment.center,
                //         decoration: BoxDecoration(
                //           //color: Colors.red,
                //           border: Border(
                //             right: BorderSide(
                //               color: Colors.white,
                //               width: 2.0,
                //               style: BorderStyle.solid,
                //             ),
                //             bottom: BorderSide(
                //               color: Colors.white,
                //               width: 2.0,
                //             ),
                //           ),
                //         ),
                //         height: 30,
                //         width: 250,
                //         // color: Colors.orangeAccent,
                //         child: Text("__Charge"),
                //       ),
                //       Container(
                //         alignment: Alignment.center,
                //         decoration: BoxDecoration(
                //           //color: Colors.red,
                //           border: Border(
                //             bottom: BorderSide(
                //               color: Colors.white,
                //               width: 2.0,
                //             ),
                //           ),
                //         ),
                //         height: 30,
                //         width: 234,
                //         // color: Colors.orangeAccent,
                //         child: Text("300TK"),
                //       ),
                //     ],
                //   ),
                // ),
                // Expanded(
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     crossAxisAlignment: CrossAxisAlignment.stretch,
                //     children: [
                //       Container(
                //         alignment: Alignment.center,
                //         decoration: BoxDecoration(
                //           //color: Colors.red,
                //           border: Border(
                //             right: BorderSide(
                //               color: Colors.white,
                //               width: 2.0,
                //               style: BorderStyle.solid,
                //             ),
                //             bottom: BorderSide(
                //               color: Colors.white,
                //               width: 2.0,
                //             ),
                //           ),
                //         ),
                //         height: 30,
                //         width: 250,
                //         // color: Colors.orangeAccent,
                //         child: Text("__Charge"),
                //       ),
                //       Container(
                //         alignment: Alignment.center,
                //         decoration: BoxDecoration(
                //           //color: Colors.red,
                //           border: Border(
                //             bottom: BorderSide(
                //               color: Colors.white,
                //               width: 2.0,
                //             ),
                //           ),
                //         ),
                //         height: 30,
                //         width: 234,
                //         // color: Colors.orangeAccent,
                //         child: Text("300TK"),
                //       ),
                //     ],
                //   ),
                // ),
                // Expanded(
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     crossAxisAlignment: CrossAxisAlignment.stretch,
                //     children: [
                //       Container(
                //         alignment: Alignment.center,
                //         decoration: BoxDecoration(
                //           //color: Colors.red,
                //           border: Border(
                //             right: BorderSide(
                //               color: Colors.white,
                //               width: 2.0,
                //               style: BorderStyle.solid,
                //             ),
                //             bottom: BorderSide(
                //               color: Colors.white,
                //               width: 2.0,
                //             ),
                //           ),
                //         ),
                //         height: 30,
                //         width: 250,
                //         // color: Colors.orangeAccent,
                //         child: Text("__Charge"),
                //       ),
                //       Container(
                //         alignment: Alignment.center,
                //         decoration: BoxDecoration(
                //           //color: Colors.red,
                //           border: Border(
                //             bottom: BorderSide(
                //               color: Colors.white,
                //               width: 2.0,
                //             ),
                //           ),
                //         ),
                //         height: 30,
                //         width: 234,
                //         // color: Colors.orangeAccent,
                //         child: Text("300TK"),
                //       ),
                //     ],
                //   ),
                // ),
                // Expanded(
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     crossAxisAlignment: CrossAxisAlignment.stretch,
                //     children: [
                //       Container(
                //         alignment: Alignment.center,
                //         decoration: BoxDecoration(
                //           //color: Colors.red,
                //           border: Border(
                //             right: BorderSide(
                //               color: Colors.white,
                //               width: 2.0,
                //               style: BorderStyle.solid,
                //             ),
                //             bottom: BorderSide(
                //               color: Colors.white,
                //               width: 2.0,
                //             ),
                //           ),
                //         ),
                //         height: 30,
                //         width: 250,
                //         // color: Colors.orangeAccent,
                //         child: Text("Total"),
                //       ),
                //       Container(
                //         alignment: Alignment.center,
                //         decoration: BoxDecoration(
                //           //color: Colors.red,
                //           border: Border(
                //             bottom: BorderSide(
                //               color: Colors.white,
                //               width: 2.0,
                //             ),
                //           ),
                //         ),
                //         height: 30,
                //         width: 234,
                //         // color: Colors.orangeAccent,
                //         child: Text("1380TK"),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
          SizedBox(height: 5),
          Column(
            children: [
              Container(
                height: 150,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(38),
                  color: Colors.pink[200],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Center(
                            child: Text(
                              "21-DEC 2021",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          height: 25,
                          width: 220,
                          margin: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0)),
                          ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              "22-DEC 2021",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          height: 25,
                          width: 220,
                          margin: EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0)),
                          ),
                        ),
                      ],
                    )),
                    Expanded(
                        child: Row(
                      children: [
                        Container(
                          child: Center(
                            child: Text(
                              "23-DEC 2021",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          height: 25,
                          width: 220,
                          margin: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0)),
                          ),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              "24-DEC 2021",
                              textAlign: TextAlign.center,
                            ),
                          ),
                          height: 25,
                          width: 220,
                          margin: EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0)),
                          ),
                        ),
                      ],
                    )),
                    Expanded(
                        child: Row(
                      children: [
                        Container(
                          child: Center(
                            child: Text(
                              "Total",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          height: 25,
                          width: 220,
                          margin: EdgeInsets.only(left: 20),
                          // decoration: BoxDecoration(
                          //   borderRadius: BorderRadius.only(
                          //       topLeft: Radius.circular(10.0),
                          //       bottomLeft: Radius.circular(10.0)),
                          // ),
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Container(
                          child: Center(
                            child: Text(
                              "4000TK",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          height: 25,
                          width: 220,
                          margin: EdgeInsets.only(right: 20),
                          // decoration: BoxDecoration(
                          //   borderRadius: BorderRadius.only(
                          //       topRight: Radius.circular(10.0),
                          //       bottomRight: Radius.circular(10.0)),
                          // ),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.only(
                        left: 5.0, top: 5.0, right: 5.0, bottom: 5.0),
                    height: 50,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5.0),
                        bottomRight: Radius.circular(5.0),
                        topLeft: Radius.circular(5.0),
                        bottomLeft: Radius.circular(5.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Bkash",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.only(
                        left: 5.0, top: 5.0, right: 5.0, bottom: 5.0),
                    height: 50,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5.0),
                        bottomRight: Radius.circular(5.0),
                        topLeft: Radius.circular(5.0),
                        bottomLeft: Radius.circular(5.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Rocket",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 11,
                                color: Colors.white,
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.only(
                        left: 5.0, top: 5.0, right: 5.0, bottom: 5.0),
                    height: 50,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5.0),
                        bottomRight: Radius.circular(5.0),
                        topLeft: Radius.circular(5.0),
                        bottomLeft: Radius.circular(5.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "DBL",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    padding: EdgeInsets.only(
                        left: 5.0, top: 5.0, right: 5.0, bottom: 5.0),
                    height: 50,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5.0),
                        bottomRight: Radius.circular(5.0),
                        topLeft: Radius.circular(5.0),
                        bottomLeft: Radius.circular(5.0),
                      ),
                    ),
                    child: Column(
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "UCB",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          // SizedBox(
          //   height: 3,
          // ),
          Container(
              padding: EdgeInsets.all(12.0),
              margin: EdgeInsets.only(
                  left: 300.0, top: 5.0, right: 10.0, bottom: 5.0),
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blueAccent),
                  ),
                  onPressed: () {},
                  child: Text(
                    "PAY",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ))),
        ],
      ),
    );
  }
}
