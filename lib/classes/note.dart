import 'package:firebase_database/firebase_database.dart';

class Note {
  String key;
  String title;
  String description;
  String color;
  String image;

  Note(this.key, this.title, this.description, this.color, this.image);

  Note.getNote(DataSnapshot snapshot)
      : key = snapshot.key,
        title = snapshot.value["title"],
        description = snapshot.value['description'],
        color = snapshot.value['color'],
        image = snapshot.value['image'];
}
