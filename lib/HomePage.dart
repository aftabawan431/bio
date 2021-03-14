
import 'package:biography1/see%20your%20writes.dart';
import 'package:flutter/material.dart';
import 'About.dart';
import 'package:firebase_auth/firebase_auth.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Color primaryColor = Color(0xff18203d);
  final Color secondaryColor = Color(0xff232c51);

  final Color logoGreen = Color(0xff25bcbb);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: Text("Biography"),
        backgroundColor:  logoGreen,
      ),
      drawer: Drawer(
        child: MainDrawer(),
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


class MainDrawer extends StatefulWidget {
  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  final Color primaryColor = Color(0xff18203d);

  final Color secondaryColor = Color(0xff232c51);

  final Color logoGreen = Color(0xff25bcbb);

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();

  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        child: Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20,),
              Image.asset('assets/96.png'),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "Biography App",
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "Write your Words",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 40.0,
      ),
      ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>About()));

        },
        leading: Icon(
          Icons.person,
          color: Colors.black,
        ),
        trailing: Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,size: 18,),
        title: Text("Write Biography"),
      ),

      ListTile(
        onTap: ()
        {
          Navigator.of(context).push(MaterialPageRoute(builder :(ctx)=>SeeYourWrites()));
        },
        leading: Icon(
          Icons.inbox,
          color: Colors.black,
        ),
        title: Text("See your Writes"),
        trailing: Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,size: 18,),
      ),
      ListTile(
        onTap: () {
          _signOut();
        },
        leading: Icon(
          Icons.logout,
          color: Colors.black,
        ),
        title: Text("SignOut"),
        trailing: Icon(Icons.arrow_forward_ios_rounded,color: Colors.black,size: 18,),
      ),

    ]);
  }
}
