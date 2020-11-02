import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:proyecto_final_2020_2/classes/auth_firebase.dart';
import 'package:proyecto_final_2020_2/pages/home_page.dart';
import 'package:proyecto_final_2020_2/pages/login_page.dart';

class RootPage extends StatefulWidget {
  RootPage({this.auth});
  final AuthFirebase auth;
  @override
  _RootPageState createState() => _RootPageState();
}

enum AuthStatus {
  notSignIn,
  singedIn,
}

class _RootPageState extends State<RootPage> {
  AuthStatus authStatus = AuthStatus.notSignIn;

  @override
  void initState() {
    widget.auth.auth.authStateChanges().listen((User user) {
      if (user == null) {
        authStatus = AuthStatus.notSignIn;
      } else {
        authStatus = AuthStatus.singedIn;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.notSignIn:
        return (LoginPage(
          auth: widget.auth,
          onSignIn: () => updateAuthStatus(AuthStatus.singedIn),
        ));
      case AuthStatus.singedIn:
        return (HomePage(
          auth: widget.auth,
          onSignIn: () => updateAuthStatus(AuthStatus.notSignIn),
        ));
    }
  }

  void updateAuthStatus(AuthStatus auth) {
    setState(() {
      print("cambio a:" + auth.toString());
      authStatus = auth;
    });
  }
}
