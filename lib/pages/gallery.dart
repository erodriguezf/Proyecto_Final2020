import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final_2020_2/classes/auth_firebase.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:proyecto_final_2020_2/pages/addImage.dart';

class Gallery extends StatefulWidget {
  final AuthFirebase auth;

  const Gallery({Key key, this.auth}) : super(key: key);
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  bool loading;
  List<String> fotos = new List<String>();
  List<String> descripciones = new List<String>();
  StreamSubscription<Event> onAddedSubs;
  DatabaseReference db = FirebaseDatabase.instance.reference();

  @override
  void initState() {
    loading = true;
    String uid = widget.auth.auth.currentUser.uid;
    var query = db.child("Users").child(uid).child("gallery");
    onAddedSubs = query.onChildAdded.listen(onEntryAdded);
    loading = false;
    super.initState();
  }

  onEntryAdded(Event event) {
    setState(() {
      fotos.add(event.snapshot.value['url']);
      descripciones.add(event.snapshot.value['description']);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return (Scaffold(
        appBar: AppBar(
          title: Text("Galeria de fotos"),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ));
    }
    return (Scaffold(
        appBar: AppBar(
          title: Text("Galeria de fotos"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddImage(auth: widget.auth)));
          },
          shape: StadiumBorder(),
          backgroundColor: Colors.blue,
          child: Icon(
            Icons.add,
            size: 20.0,
          ),
        ),
        body: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ImagePage(
                    foto: fotos[index],
                    descripcion: descripciones[index],
                  );
                }));
              },
              child: Image.network(fotos[index]),
            );
          },
          itemCount: fotos.length,
        )));
  }
}

class ImagePage extends StatelessWidget {
  final String foto;
  final String descripcion;

  const ImagePage({Key key, this.foto, this.descripcion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: Center(
            child: Column(
          children: [
            Expanded(
              flex: 10,
              child: Image.network(
                foto,
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  descripcion,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            )
          ],
        )));
  }
}
