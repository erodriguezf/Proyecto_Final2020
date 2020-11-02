import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final_2020_2/classes/auth_firebase.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key, this.auth, this.onSignIn}) : super(key: key);
  final AuthFirebase auth;
  final VoidCallback onSignIn;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page"),
        actions: [FlatButton(onPressed: signOUt, child: Text('Cerrar Sesion'))],
      ),
    );
  }

  void signOUt() {
    widget.auth.signOut();
    widget.onSignIn();
  }
}
