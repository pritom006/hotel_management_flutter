import 'package:flutter/material.dart';

class Suggestion extends StatelessWidget {
  const Suggestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Suggestions"),
        backgroundColor: Color(0xFF956DBD),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.deepPurple.shade100,
              Colors.deepPurple.shade300
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(26.0),
                child: const TextField(
                  textInputAction: TextInputAction.done,
                  maxLines: 14,
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: " Write your valuable suggestions ",
                    // contentPadding:
                    //     const EdgeInsets.symmetric(horizontal: 50.0, vertical: 100.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(26.0)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("SEND"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.purpleAccent,
                  fixedSize: Size(MediaQuery.of(context).size.width / 3.5, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
