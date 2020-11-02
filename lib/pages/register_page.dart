import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final_2020_2/classes/auth_firebase.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key, this.auth, this.onSignIn}) : super(key: key);
  final AuthFirebase auth;
  final VoidCallback onSignIn;
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formkey = new GlobalKey<FormState>();
  var email = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formkey,
          child: Column(
            children: formLogin(),
          ),
        ),
      ),
    );
  }

  List<Widget> formLogin() {
    return [
      padded(
        child: TextFormField(
          decoration: InputDecoration(
            icon: Icon(Icons.person),
            labelText: 'Correo electronico',
          ),
          autocorrect: false,
          controller: email,
          validator: (value) {
            if (value.isEmpty) {
              return 'Por favor ingresa tu correo electronico';
            }
            return null;
          },
        ),
      ),
      padded(
        child: TextFormField(
          decoration: InputDecoration(
            icon: Icon(Icons.lock),
            labelText: 'Contraseña',
          ),
          autocorrect: false,
          obscureText: true,
          controller: password,
        ),
      ),
      Column(
        children: [
          RaisedButton(
            onPressed: () {
              if (formkey.currentState.validate()) {
                register(context);
              }
            },
            color: Colors.blue,
            textColor: Colors.white,
            child: Text("Registro"),
          )
        ],
      )
    ];
  }

  Widget padded({Widget child}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: child,
    );
  }

  void register(BuildContext context) {
    widget.auth.createUser(email.text, password.text).then((value) {
      if (value != null) {
        widget.onSignIn();
        Navigator.pop(context);
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Correo electronico o constraseña incorrecta'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(
                        'El usuario y contraseña proporcionados no son credenciales validas para su registro'),
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('Aceptar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    });
  }
}
