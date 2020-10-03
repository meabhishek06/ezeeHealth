import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Appointment extends StatefulWidget {
  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  var msgclear = TextEditingController();
  var fs = FirebaseFirestore.instance;
  var authc = FirebaseAuth.instance;

  String appointmentdetails;

  @override
  Widget build(BuildContext context) {
    var devicewidth = MediaQuery.of(context).size.width;
    var signInUser = authc.currentUser.email;
    return Scaffold(
      appBar: AppBar(
        title: Text("appointment"),
      ),
      body: Container(
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage('https://i.imgur.com/TyCSG9A.png'),
            ),
            Column(
              children: [
                Container(
                  width: devicewidth * 0.70,
                  child: TextField(
                    controller: msgclear,
                    decoration:
                        InputDecoration(hintText: "Enter ur appointment"),
                    onChanged: (value) {
                      appointmentdetails = value;
                    },
                  ),
                ),
                Container(
                  width: devicewidth * 0.20,
                  child: FlatButton(
                    onPressed: () async {
                      msgclear.clear();
                      await fs.collection("appointments").add({
                        "text": appointmentdetails,
                        "sender": signInUser,
                      });
                      print(signInUser);
                    },
                    child: Text("submit"),
                  ),
                ),
                StreamBuilder(
                  builder: (context, snapshot) {
                    var msg = snapshot.data.docs;
                    List<Widget> y = [];
                    for (var d in msg) {
                      var text = d.data()['text'];
                      var msgSender = d.data()['sender'];
                      var msgWidget =
                          Text("appointment: $text, from email : $msgSender");
                      y.add(msgWidget);
                    }
                    return Container(
                      child: Column(
                        children: y,
                      ),
                    );
                  },
                  stream: fs.collection("appointments").snapshots(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
