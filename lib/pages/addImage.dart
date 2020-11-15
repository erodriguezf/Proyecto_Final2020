import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:proyecto_final_2020_2/classes/auth_firebase.dart';
import 'package:uuid/uuid.dart';

class AddImage extends StatefulWidget {
  final AuthFirebase auth;

  const AddImage({Key key, this.auth}) : super(key: key);
  @override
  _AddImageState createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  PickedFile galleryFile;
  var description = TextEditingController();
  String urlImage;
  final ImagePicker picker = ImagePicker();
  var uuid = Uuid();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Agregar imagen"),
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.description),
                      hintText: 'Agrege una nota a su imagen',
                      labelText: 'Nota'),
                  controller: description,
                ),
                RaisedButton(
                    onPressed: imagenSelectorGallery,
                    child: Text('Selecciona una imagen')),
                SizedBox(
                  child: showImage(),
                ),
                RaisedButton(
                  onPressed: sendData,
                  child: Text('Guardar'),
                )
              ],
            )));
  }

  Future<void> saveFirebase(String imageId) async {
    if (galleryFile != null) {
      try {
        await firebase_storage.FirebaseStorage.instance
            .ref()
            .child(uuid.v1())
            .putFile(File(galleryFile.path))
            .then((url) async {
          urlImage = await url.ref.getDownloadURL();
        });
      } on firebase_core.FirebaseException catch (e) {
        // e.g, e.code == 'canceled'
      }
    }
  }

  showImage() {
    if (galleryFile != null) {
      return Image.file(File(galleryFile.path));
    } else {
      return Text('Imagen no seleccionada');
    }
  }

  sendData() {
    saveFirebase(description.text).then((_) {
      String uid = widget.auth.auth.currentUser.uid;
      DatabaseReference db = FirebaseDatabase.instance
          .reference()
          .child('Users')
          .child(uid)
          .child('gallery');

      db.push().set(getimage()).then((_) {});
      Navigator.pop(context);
    });
  }

  imagenSelectorGallery() async {
    galleryFile = (await picker.getImage(
      source: ImageSource.gallery,
    ));
    setState(() {});
  }

  Map<String, dynamic> getimage() {
    Map<String, dynamic> data = Map();
    data['url'] = urlImage;
    data['description'] = description.text;
    return data;
  }
}
