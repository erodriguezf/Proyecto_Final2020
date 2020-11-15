import 'package:firebase_database/firebase_database.dart';

class User {
  String key;
  String email;
  String name;
  String lastname;
  String age;
  List<String> gallerImages;

  User(this.key, this.email, this.name, this.lastname, this.age,
      this.gallerImages);

  User.getAnimal(DataSnapshot snapshot)
      : key = snapshot.key,
        email = snapshot.value['email'],
        name = snapshot.value['name'],
        lastname = snapshot.value['lastname'],
        age = snapshot.value['age'];
}
