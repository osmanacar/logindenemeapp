import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'eskihome.dart';
final FirebaseAuth _auth = FirebaseAuth.instance;

class Login2Page extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<Login2Page> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  String _email, _password;

  String userId;
  bool success;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DenemeLogin"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: emailController,
            ),
            TextFormField(
              controller: passwordController,
            ),
            RaisedButton(
              child: Text("SignUp"),
              onPressed: () {
                signUpWithEmailPassword();
              },
            ),
            RaisedButton(
              child: Text("SignIn"),
              onPressed: () {
                signInWithEmailPassword();

              },
            ),
            RaisedButton(
              child: Text("Google Giris"),
              onPressed: () {
                //_googleSignUp();
              },
            )
          ],
        ),
      ),
    );
  }

  Future<void> signUpWithEmailPassword() async {
    try {
      FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
              email: emailController.text.trim(),
              password: passwordController.text.trim()))
          .user;


      if (user != null) {
        print("KAYIT OLDU");
      } else {
        print("KAYIT OLMADI");
      }
    } catch (e) {
      return null;
    }
  }

  Future<void> signInWithEmailPassword() async {
    FirebaseUser user = (await _auth.signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim()))
        .user;

    Firestore.instance.collection("user").document().setData(
        {
          'email' : this.emailController.text,
          'password' : this.passwordController.text,
        }
    );

    Navigator.pushReplacement(
        context, new MaterialPageRoute(builder: (context) => EskiHome()));

    if (user != null) {
      print("GIRDI");

    } else {
      print("GIRMEDI");
    }
  }

}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Deneme"),
        backgroundColor: Colors.brown,
      ),
    );
  }
}
//  GoogleSignIn googleSignIn = new GoogleSignIn();
//
//  Future<void> _googleSignUp() async {
//    try {
//      final GoogleSignInAccount googleSignInAccount =
//      await googleSignIn.signIn();
//      final GoogleSignInAuthentication googleSignInAuthentication =
//      await googleSignInAccount.authentication;
//      final AuthCredential credential = GoogleAuthProvider.getCredential(
//        idToken: googleSignInAuthentication.accessToken,
//        accessToken: googleSignInAuthentication.idToken,
//      );
//
//      final FirebaseUser user =
//          (await _auth.signInWithCredential(credential)).user;
//      assert(user.displayName != null);
//      assert(await user.getIdToken() != null);
//
//      final FirebaseUser currentUser = await _auth.currentUser();
//      assert(user.uid == currentUser.uid);
//      setState(() {
//        if (user != null) {
//          success = true;
//          print("YES");
//          userId = user.uid;
//        }
//        else {
//          print("NO");
//        }
//
//      });
//    } catch (e) {
//      e.toString();
//    }
//  }

//  Future<void> signUpWithEmailPassword() async {
//    FirebaseUser user;
//    try {
//      user = (await _auth.createUserWithEmailAndPassword(
//          email: emailController.text.trim(),
//          password: passwordController.text.trim())) as FirebaseUser;
//    } catch (e) {
//      print(e.toString());
//    }
//  }

//  Future<void> signInWithEmailPassword() async {
//    FirebaseUser user;
//    try {
//      user = (await _auth.signInWithEmailAndPassword(
//          email: emailController.text.trim(),
//          password: passwordController.text.trim())) as FirebaseUser;
//    } catch (e) {
//      print(e.toString());
//    } finally {
//      if (user != null) {
//        print("User is signed IN");
//      }
//      else{
//        print("NOT");
//      }
//    }
//  }
