import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final_2020_2/classes/auth_firebase.dart';
import 'package:proyecto_final_2020_2/pages/note_create_page.dart';
import 'package:proyecto_final_2020_2/pages/notes_home_page.dart';

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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Notas'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (contex) => NotesHome()));
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void signOUt() {
    widget.auth.signOut();
    widget.onSignIn();
  }
}
