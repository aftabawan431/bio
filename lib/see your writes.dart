import 'package:flutter/material.dart';


class SeeYourWrites extends StatefulWidget {
  @override
  _SeeYourWritesState createState() => _SeeYourWritesState();
}

class _SeeYourWritesState extends State<SeeYourWrites> {
  final Color primaryColor = Color(0xff18203d);
  final Color secondaryColor = Color(0xff232c51);

  final Color logoGreen = Color(0xff25bcbb);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: Text("Welcome User"),
        backgroundColor:  logoGreen,
      ),
      body: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Color(0xFFFAF9F6),
        ),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Center(child: Text('Your Writes',style: TextStyle(fontSize: 22,fontWeight: FontWeight.w700),)),
          ],
        ),
      ),
    );
  }
}

