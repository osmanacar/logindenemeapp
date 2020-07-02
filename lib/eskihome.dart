import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logindenemeapp/eskilogin.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;

class EskiHome extends StatefulWidget {
  @override
  _EskiHomeState createState() => _EskiHomeState();
}

class _EskiHomeState extends State<EskiHome> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Deneme"),
        backgroundColor: Colors.brown,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("Cikis"),
              onPressed: () {
                logout();
                Navigator.pushReplacement(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => Login2Page()));
              },
            ),
          ],
        ),
      ),
    );
  }
}


void logout() async{
  await FirebaseAuth.instance.signOut();
}

