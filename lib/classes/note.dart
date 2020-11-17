import 'package:firebase_database/firebase_database.dart';

class Note {
  String key;
  String title;
  String content;
  String url;
  String color;

  Note(this.key, this.title, this.content, this.url, this.color);

  Note.getNote(DataSnapshot snapshot)
      : key = snapshot.key,
        title = snapshot.value['title'],
        content = snapshot.value['content'],
        url = snapshot.value['url'],
        color = snapshot.value['color'];
}
