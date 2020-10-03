import 'package:flutter/material.dart';

class EzeeHealth extends StatefulWidget {
  @override
  _EzeeHealthState createState() => _EzeeHealthState();
}

class _EzeeHealthState extends State<EzeeHealth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () => Navigator.pushNamed(context, "home"),
          )
        ],
        title: Text('ezeeHealth'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(10),
                elevation: 10,
                child: MaterialButton(
                  minWidth: 200,
                  height: 40,
                  child: Text("Today's Appointments"),
                  onPressed: () {
                    Navigator.pushNamed(context, "appointment");
                  },
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Material(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(10),
                elevation: 10,
                child: MaterialButton(
                  minWidth: 200,
                  height: 40,
                  child: Text('Refferal'),
                  onPressed: () {
                    Navigator.pushNamed(context, "refferal");
                  },
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Material(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(10),
                elevation: 10,
                child: MaterialButton(
                  minWidth: 200,
                  height: 40,
                  child: Text('History'),
                  onPressed: () {
                    Navigator.pushNamed(context, "history");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
