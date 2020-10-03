import 'package:ezeeheatlth/screens/appointment.dart';
import 'package:ezeeheatlth/screens/ezeeHealth.dart';
import 'package:ezeeheatlth/screens/history.dart';
import 'package:ezeeheatlth/screens/home.dart';
import 'package:ezeeheatlth/screens/login.dart';
import 'package:ezeeheatlth/screens/refferal.dart';
import 'package:ezeeheatlth/screens/reg.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: "home",
      routes: {
        "home": (context) => MyHome(),
        "reg": (context) => MyReg(),
        "login": (context) => MyLogin(),
        "history": (context) => MyHistory(),
        "appointment": (context) => Appointment(),
        "refferal": (context) => Refferal(),
        "ezeeHealth": (context) => EzeeHealth(),
      },
    ),
  );
}
