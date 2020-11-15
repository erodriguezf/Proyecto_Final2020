import 'package:firebase_database/firebase_database.dart';

class Foto {
  String key;
  String url;
  String description;

  Foto(this.key, this.description, this.url);

  Foto.getFoto(DataSnapshot snapshot)
      : key = snapshot.key,
        url = snapshot.value['url'],
        description = snapshot.value['description'];
}
