import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:proyecto_final_2020_2/classes/auth_firebase.dart';
import 'package:proyecto_final_2020_2/classes/foto.dart';
import 'package:uuid/uuid.dart';

class AddImagePage extends StatefulWidget {
  final AuthFirebase auth;
  final Foto foto;

  const AddImagePage({Key key, this.auth, this.foto}) : super(key: key);

  @override
  _AddImagePageState createState() => _AddImagePageState();
}

class _AddImagePageState extends State<AddImagePage> {
  PickedFile galleryFile;
  var description = TextEditingController();
  String urlImage;
  final ImagePicker picker = ImagePicker();
  var uuid = Uuid().v1();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.foto != null) {
      description.text = widget.foto.description;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.foto != null ? "Editar imagen" : "Agregar imagen"),
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                          icon: Icon(Icons.description),
                          hintText: 'Agrege una nota a su imagen',
                          labelText: 'Nota'),
                      controller: description,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Por favor ingresa una nota';
                        }
                        return null;
                      },
                    ),
                    RaisedButton(
                        onPressed: imagenSelectorGallery,
                        child: Text('Selecciona una imagen')),
                    SizedBox(
                      child: showImage(),
                    ),
                    RaisedButton(
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          sendData();
                        }
                      },
                      child: Text('Guardar'),
                    )
                  ],
                ))));
  }

  Future<void> saveFirebase(String imageId) async {
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

  showImage() {
    if (galleryFile != null) {
      return Image.file(File(galleryFile.path));
    } else {
      if (widget.foto != null) {
        return Image.network(
          widget.foto.url,
          fit: BoxFit.contain,
        );
      } else {
        return Text('Imagen no seleccionada');
      }
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
      if (widget.foto != null) {
        db.child(widget.foto.key).set(getimage()).then((_) {});
        Navigator.pop(context);
        Navigator.pop(context);
      } else {
        db.child(uuid).set(getimage()).then((_) {});
        Navigator.pop(context);
      }
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
    if (widget.foto != null && galleryFile == null) {
      data['url'] = widget.foto.url;
    } else {
      data['url'] = urlImage != null ? urlImage : "";
    }
    return data;
  }
}
