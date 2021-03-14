import 'package:flutter/material.dart';
import 'Login_Screen.dart';
import 'package:provider/provider.dart';
import 'package:biography1/FadeAnimation.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF1a203d),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/96.png',
              height: 250,
            ),
            SizedBox(
              height: 20,
            ),
            FadeAnimation(2, Text(
              'Welcome to Biography App',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),),
            SizedBox(height: 20),
            FadeAnimation(2.5,Text(
              'A one-stop portal for you to learn the latest Biographies',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),),
            SizedBox(
              height: 30,
            ),
            //LoginScreen
            FadeAnimation(3, MaterialButton(

              elevation: 0,
              height: 50,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>LoginScreen()));
              },
              color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Get Started',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
              textColor: Colors.white,
            ),),
          ],
        ),
      ),
    );
  }
}
