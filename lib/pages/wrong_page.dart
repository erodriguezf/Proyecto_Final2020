import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WrongPage extends StatefulWidget {
  @override
  _WrongPageState createState() => _WrongPageState();
}

class _WrongPageState extends State<WrongPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wrong"),
      ),
    );
  }
}
