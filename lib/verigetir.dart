import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VeriGetir extends StatefulWidget {
  @override
  _VeriGetirState createState() => _VeriGetirState();
}

class _VeriGetirState extends State<VeriGetir> {
  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Deneme"),
        backgroundColor: Colors.brown,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection("user").snapshots(),
        builder: (context,snapshot){
          if(!snapshot.hasData) return Text("asdhjsadgjsad");
          return ListView(
            children: snapshot.data.documents.map((DocumentSnapshot document) {
              return new ListTile(
                title: new Image.network(document['email']),
                subtitle: new Text(document['password']),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}


