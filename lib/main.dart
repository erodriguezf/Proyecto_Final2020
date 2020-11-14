import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:proyecto_final_2020_2/pages/loading_page.dart';
import 'package:proyecto_final_2020_2/pages/root_page.dart';
import 'package:proyecto_final_2020_2/pages/wrong_page.dart';

import 'classes/auth_firebase.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return WrongPage();
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return RootPage(
            auth: new AuthFirebase(),
          );
        }
        // Otherwise, show something whilst waiting for initialization to complete
        return LoadingPage();
      },
    );
  }
}
