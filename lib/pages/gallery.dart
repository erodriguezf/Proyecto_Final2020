import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final_2020_2/classes/auth_firebase.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:proyecto_final_2020_2/classes/foto.dart';
import 'package:proyecto_final_2020_2/pages/addImage.dart';

class Gallery extends StatefulWidget {
  final AuthFirebase auth;

  const Gallery({Key key, this.auth}) : super(key: key);
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  List<Foto> fotos = new List<Foto>();
  StreamSubscription<Event> onAddedSubs;
  StreamSubscription<Event> onChangeSubs;
  DatabaseReference db = FirebaseDatabase.instance.reference();

  @override
  void initState() {
    String uid = widget.auth.auth.currentUser.uid;
    var query = db.child("Users").child(uid).child("gallery");
    onAddedSubs = query.onChildAdded.listen(onEntryAdded);
    onChangeSubs = query.onChildChanged.listen(onEntryChanged);
    super.initState();
  }

  onEntryAdded(Event event) {
    setState(() {
      fotos.add(Foto.getFoto(event.snapshot));
    });
  }

  onEntryChanged(Event event) {
    Foto oldEntry = fotos.singleWhere((entry) {
      return entry.key == event.snapshot.key;
    });
    setState(() {
      fotos[fotos.indexOf(oldEntry)] = Foto.getFoto(event.snapshot);
    });
  }

  void disponse() {
    onAddedSubs.cancel();
    onChangeSubs.cancel();
  }

  @override
  Widget build(BuildContext context) {
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
                    auth: widget.auth,
                  );
                }));
              },
              child: Image.network(fotos[index].url),
            );
          },
          itemCount: fotos.length,
        )));
  }
}

class ImagePage extends StatelessWidget {
  final Foto foto;
  final AuthFirebase auth;

  const ImagePage({Key key, this.foto, this.auth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: [
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddImage(
                                  auth: auth,
                                  foto: foto,
                                )));
                  },
                  child: Icon(Icons.edit),
                )),
          ],
        ),
        backgroundColor: Colors.black,
        body: Center(
            child: Column(
          children: [
            Expanded(
              flex: 10,
              child: Image.network(
                foto.url,
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  foto.description,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            )
          ],
        )));
  }
}
