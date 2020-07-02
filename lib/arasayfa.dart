import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logindenemeapp/eskihome.dart';
import 'package:logindenemeapp/eskilogin.dart';

//final FirebaseAuth _auth = FirebaseAuth.instance;

class Arasayfa extends StatefulWidget {
  @override
  _ArasayfaState createState() => _ArasayfaState();
}

class _ArasayfaState extends State<Arasayfa> {
  
  bool isLoggedIn;

  @override
  void initState() {
    // TODO: implement initState
    isLoggedIn = false;
    FirebaseAuth.instance.currentUser().then((user) => user != null
        ? setState(() {
      isLoggedIn = true;
    })
        : null);

    super.initState();

     new Future.delayed(const Duration(seconds: 2));
  }
  
  @override
  Widget build(BuildContext context) {
      return isLoggedIn ? new EskiHome() : new Login2Page();
  }
}
//return _auth.currentUser == null ? new Login2Page() : new EskiHome();

/*return FutureBuilder<FirebaseUser>(
future: FirebaseAuth.instance.currentUser(),
builder: (BuildContext context,AsyncSnapshot<FirebaseUser> snapshot){
if(snapshot.hasData){
FirebaseUser user = snapshot.data;
return EskiHome();
}
return Login2Page();
},
);*/