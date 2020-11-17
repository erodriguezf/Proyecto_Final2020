import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final_2020_2/classes/auth_firebase.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:proyecto_final_2020_2/classes/foto.dart';
import 'package:proyecto_final_2020_2/pages/addImagePage.dart';

class GalleryPage extends StatefulWidget {
  final AuthFirebase auth;

  const GalleryPage({Key key, this.auth}) : super(key: key);
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<GalleryPage> {
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
                    builder: (context) => AddImagePage(auth: widget.auth)));
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
                      remove: () => deleteItem(index, fotos[index]),
                    );
                  }));
                },
                child: FadeInImage.assetNetwork(
                  placeholder: "assets/defaultImage.png",
                  image: fotos[index].url,
                  fit: BoxFit.contain,
                ));
          },
          itemCount: fotos.length,
        )));
  }

  void deleteItem(int index, Foto foto) {
    setState(() {
      db
          .child("Users")
          .child(widget.auth.auth.currentUser.uid)
          .child("gallery")
          .child(foto.key)
          .remove();

      fotos.removeAt(index);
    });
  }
}

class ImagePage extends StatefulWidget {
  final Foto foto;
  final AuthFirebase auth;
  final VoidCallback remove;

  const ImagePage({Key key, this.foto, this.auth, this.remove})
      : super(key: key);

  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  DatabaseReference db = FirebaseDatabase.instance.reference().child("Users");

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
                            builder: (context) => AddImagePage(
                                  auth: widget.auth,
                                  foto: widget.foto,
                                )));
                  },
                  child: Icon(Icons.edit),
                )),
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text(
                              '¿Esta seguro que desea eliminar esta imagende su galeria?'),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Aceptar'),
                              onPressed: () {
                                widget.remove();
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              },
                            ),
                            FlatButton(
                              child: Text('Cancelar'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Icon(Icons.delete),
                ))
          ],
        ),
        backgroundColor: Colors.black,
        body: Center(
            child: Column(
          children: [
            Expanded(
              flex: 10,
              child: Image.network(
                widget.foto.url,
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  widget.foto.description,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            )
          ],
        )));
  }
}
