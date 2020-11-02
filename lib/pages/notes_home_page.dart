import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final_2020_2/pages/note_create_page.dart';

class NotesHome extends StatefulWidget {
  @override
  _NotesHomeState createState() => _NotesHomeState();
}

class _NotesHomeState extends State<NotesHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes Home Page"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      CreateNote(callBackColorTapped: null, noteColor: null)));
        },
        shape: StadiumBorder(),
        backgroundColor: Colors.red,
        child: Icon(
          Icons.add,
          size: 20.0,
        ),
      ),
    );
  }
}
