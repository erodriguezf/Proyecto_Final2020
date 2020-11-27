import 'package:flutter/material.dart';
import 'package:proyecto_final_2020_2/classes/auth_firebase.dart';
import 'package:proyecto_final_2020_2/classes/note.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:proyecto_final_2020_2/pages/singleNotePage.dart';

class CardViewNote extends StatelessWidget {
  Note note;
  BuildContext context;
  AuthFirebase auth;

  CardViewNote(this.note, this.context, this.auth);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SingleNotePage(auth: auth, note: note)));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 144.0,
              width: 500.0,
              color: HexColor(note.color),
              child: note.url != null
                  ? FadeInImage.assetNetwork(
                      placeholder: "assets/defaultImage.png",
                      image: note.url,
                      fit: BoxFit.contain,
                    )
                  : Image.asset("assets/defaultImage.png", fit: BoxFit.contain),
            ),
            Padding(
              padding: EdgeInsets.all(7.0),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Icon(Icons.note),
                  ),
                  Padding(
                    padding: EdgeInsets.all(7.0),
                    child: Text(
                      note.title,
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
