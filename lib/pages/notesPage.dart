import 'dart:async';
import 'package:flutter/material.dart';
import 'package:proyecto_final_2020_2/classes/auth_firebase.dart';
import 'package:proyecto_final_2020_2/classes/note.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:proyecto_final_2020_2/pages/singleNotePage.dart';
import 'package:proyecto_final_2020_2/widgets/cardViewNote.dart';

class NotePage extends StatefulWidget {
  final AuthFirebase auth;

  const NotePage({Key key, this.auth}) : super(key: key);
  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  List<Note> notas = new List<Note>();
  StreamSubscription<Event> onAddedSubs;
  StreamSubscription<Event> onChangeSubs;
  DatabaseReference db = FirebaseDatabase.instance.reference();

  @override
  void initState() {
    String uid = widget.auth.auth.currentUser.uid;
    var query = db.child("Users").child(uid).child("notes");
    onAddedSubs = query.onChildAdded.listen(onEntryAdded);
    onChangeSubs = query.onChildChanged.listen(onEntryChanged);
    super.initState();
  }

  onEntryAdded(Event event) {
    setState(() {
      notas.add(Note.getNote(event.snapshot));
    });
  }

  onEntryChanged(Event event) {
    Note oldEntry = notas.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });
    setState(() {
      notas[notas.indexOf(oldEntry)] = Note.getNote(event.snapshot);
    });
  }

  void disponse() {
    onAddedSubs.cancel();
    onChangeSubs.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notas"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SingleNotePage(auth: widget.auth)));
        },
        shape: StadiumBorder(),
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.add,
          size: 20.0,
        ),
      ),
      body: ListView.builder(
        itemCount: notas.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext contex, int index) {
          return Dismissible(
            key: ObjectKey(notas[index]),
            child: CardViewNote(notas[index], contex, widget.auth),
          );
        },
      ),
    );
  }
}
