import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {

  String _userName;
  SecondPage(this._userName);

  @override
  State<StatefulWidget> createState() {
    return SecondPageState(_userName);
  }
  
}

class SecondPageState extends State<SecondPage> {

  String _userName;
  SecondPageState(this._userName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
        ),

        body: Center(
          child: Text("Merhaba ${_userName}"),

        ),
    );
  }
}