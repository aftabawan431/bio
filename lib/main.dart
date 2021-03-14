
import 'package:biography1/HomePage.dart';
import 'package:biography1/see%20your%20writes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'HomeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'DataProvider.dart';
import 'Login_Screen.dart';
import 'package:biography1/answer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (BuildContext ctx)=>Answers(),
          child: HomeScreen()),
      routes: {
        '/a':(ctx)=>LoginScreen(),
        '/b':(ctx)=>HomePage(),
        '/c':(ctx)=>SeeYourWrites(),
      },
    );
  }
}
