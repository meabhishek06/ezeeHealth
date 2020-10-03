import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Refferal extends StatefulWidget {
  @override
  _RefferalState createState() => _RefferalState();
}

class _RefferalState extends State<Refferal> {
  var msgclear = TextEditingController();
  var msgclear1 = TextEditingController();
  var fs = FirebaseFirestore.instance;
  var authc = FirebaseAuth.instance;

  String doctor;
  String no;
  String diseasename;
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    var devicewidth = MediaQuery.of(context).size.width;
    var signInUser = authc.currentUser.email;
    return Scaffold(
      appBar: AppBar(
        title: Text("refferal"),
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
                  width: devicewidth * 0.60,
                  child: TextField(
                    controller: msgclear,
                    decoration: InputDecoration(hintText: "Patient's Mob No."),
                    onChanged: (value1) {
                      no = value1;
                    },
                  ),
                ),
                Container(
                  width: devicewidth * 0.40,
                  padding: EdgeInsets.all(20.0),
                  child: DropdownButton(
                      value: _value,
                      items: [
                        DropdownMenuItem(
                          child: Text("doc1"),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text("doc2"),
                          value: 2,
                        ),
                        DropdownMenuItem(child: Text("doc3"), value: 3),
                        DropdownMenuItem(child: Text("doc4"), value: 4)
                      ],
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      }),
                ),
                Container(
                  width: devicewidth * 0.60,
                  child: TextField(
                    controller: msgclear1,
                    decoration: InputDecoration(hintText: "Disease name."),
                    onChanged: (value2) {
                      diseasename = value2;
                    },
                  ),
                ),
                Container(
                  width: devicewidth * 0.20,
                  child: FlatButton(
                    onPressed: () async {
                      msgclear1.clear();
                      msgclear.clear();
                      await fs.collection("history").add({
                        "phone_no": no,
                        "disease": diseasename,
                        "sender": signInUser,
                        "doctor": _value,
                      });
                      print(signInUser);
                    },
                    child: Text("send"),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
