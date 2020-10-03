import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class MyHistory extends StatefulWidget {
  @override
  _MyHistoryState createState() => _MyHistoryState();
}

class _MyHistoryState extends State<MyHistory> {
  var msgclear = TextEditingController();
  var fs = FirebaseFirestore.instance;
  var authc = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
      ),
      body: Container(
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage('https://i.imgur.com/TyCSG9A.png'),
            ),
            StreamBuilder(
              builder: (context, snapshot) {
                var msg = snapshot.data.docs;
                List<Widget> y = [];
                for (var d in msg) {
                  var number = d.data()['phone_no'];
                  var disease = d.data()['disease'];
                  var doctor = d.data()['doctor'];
                  var msgSender = d.data()['sender'];
                  var msgWidget = Text(
                      "phone number : $number  Disease : $disease Doctor name : $doctor Patient email : $msgSender");
                  y.add(msgWidget);
                }
                return Container(
                  child: Column(
                    children: y,
                  ),
                );
              },
              stream: fs.collection("history").snapshots(),
            ),
          ],
        ),
      ),
    );
  }
}
