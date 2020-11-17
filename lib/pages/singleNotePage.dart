import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:proyecto_final_2020_2/classes/auth_firebase.dart';
import 'package:proyecto_final_2020_2/classes/note.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_database/firebase_database.dart';
import 'package:uuid/uuid.dart';

class SingleNotePage extends StatefulWidget {
  final AuthFirebase auth;
  final Note note;

  const SingleNotePage({Key key, this.auth, this.note}) : super(key: key);
  @override
  _SingleNotePageState createState() => _SingleNotePageState();
}

class _SingleNotePageState extends State<SingleNotePage> {
  var content = TextEditingController();
  var title = TextEditingController();
  bool enable = true;
  Color pickerColor = Color(0xff443a49);
  Color currentColor = Color(0xff0398fc);
  PickedFile galleryFile;
  final ImagePicker picker = ImagePicker();
  String urlImage;
  var uuid = Uuid().v1();

  @override
  void initState() {
    if (widget.note != null) {
      content.text = widget.note.content;
      title.text = widget.note.title;
      currentColor = HexColor(widget.note.color);
      enable = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Visibility(
              visible: enable,
              child: Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        child: AlertDialog(
                          title: const Text('Elige un color'),
                          content: SingleChildScrollView(
                            child: BlockPicker(
                              pickerColor: currentColor,
                              onColorChanged: changeColor,
                            ),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: const Text('Aceptar'),
                              onPressed: () {
                                setState(() => currentColor = pickerColor);
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      );
                    },
                    child: Icon(Icons.color_lens),
                  ))),
          Visibility(
              visible: !enable,
              child: Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      edited();
                    },
                    child: Icon(Icons.edit),
                  ))),
          Visibility(
              visible: enable,
              child: Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      sendData();
                    },
                    child: Icon(Icons.save),
                  )))
        ],
        title: TextField(
          controller: title,
          enabled: enable,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        backgroundColor: currentColor,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
                flex: 7,
                child: Container(
                    child: Padding(
                        padding: EdgeInsets.all(20), child: showImage()))),
            Visibility(
              visible: enable,
              child: Expanded(
                flex: 1,
                child: Container(
                  child: RaisedButton(
                      onPressed: imagenSelectorGallery,
                      child: Text('Selecciona una imagen')),
                ),
              ),
            ),
            Expanded(
                flex: 7,
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 25, right: 25, bottom: 15, top: 20),
                    child: TextFormField(
                      minLines: 10,
                      controller: content,
                      maxLines: 10,
                      enabled: enable,
                      style: TextStyle(fontSize: 17, color: Colors.black),
                      decoration: InputDecoration(
                        hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 12.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void edited() {
    setState(() {
      enable = true;
    });
  }

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  imagenSelectorGallery() async {
    galleryFile = (await picker.getImage(
      source: ImageSource.gallery,
    ));
    setState(() {});
  }

  Future<void> saveFirebase() async {
    if (galleryFile != null) {
      try {
        await firebase_storage.FirebaseStorage.instance
            .ref()
            .child(uuid)
            .putFile(File(galleryFile.path))
            .then((url) async {
          urlImage = await url.ref.getDownloadURL();
        });
      } on firebase_core.FirebaseException catch (e) {
        // e.g, e.code == 'canceled'
      }
    }
  }

  sendData() {
    saveFirebase().then((_) {
      String uid = widget.auth.auth.currentUser.uid;
      DatabaseReference db = FirebaseDatabase.instance
          .reference()
          .child('Users')
          .child(uid)
          .child('notes');
      if (widget.note != null) {
        db.child(widget.note.key).set(getNote()).then((_) {});
        Navigator.pop(context);
      } else {
        db.child(uuid).set(getNote()).then((_) {});
        Navigator.pop(context);
      }
    });
  }

  Map<String, dynamic> getNote() {
    Map<String, dynamic> data = Map();
    data['url'] = urlImage;
    data['content'] = content.text;
    data['title'] = title.text;
    data['color'] = '#${currentColor.value.toRadixString(16)}';
    if (widget.note != null && galleryFile == null) {
      data['url'] = widget.note.url;
    } else {
      data['url'] = urlImage != null ? urlImage : "";
    }
    return data;
  }

  showImage() {
    if (galleryFile != null) {
      return Image.file(File(galleryFile.path));
    } else {
      if (widget.note != null) {
        if (widget.note.url != null) {
          return FadeInImage.assetNetwork(
            placeholder: "assets/defaultImage.png",
            image: widget.note.url,
            fit: BoxFit.contain,
          );
        } else {
          return Image.asset("assets/defaultImage.png", fit: BoxFit.contain);
        }
      } else {
        return Text('Imagen no seleccionada');
      }
    }
  }
}
