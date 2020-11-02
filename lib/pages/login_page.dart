import 'package:flutter/material.dart';
import 'package:proyecto_final_2020_2/classes/auth_firebase.dart';
import 'package:proyecto_final_2020_2/pages/home_page.dart';
import 'package:proyecto_final_2020_2/pages/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key, this.auth, this.onSignIn}) : super(key: key);
  final AuthFirebase auth;
  final VoidCallback onSignIn;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formkey = new GlobalKey<FormState>();
  var email = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
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
                signIn(context);
              }
            },
            color: Colors.blue,
            textColor: Colors.white,
            child: Text("Iniciar Sesion"),
          ),
          FlatButton(
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RegisterPage(
                            auth: widget.auth,
                            onSignIn: () => widget.onSignIn(),
                          ))),
              child: Text('No tienes una cuenta? Registrate'))
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

  void signIn(BuildContext context) {
    widget.auth.signin(email.text, password.text).then((value) {
      if (value != null) {
        widget.onSignIn();
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
                        'El usuario y contraseña proporcionados no se encuentran registrados, por favor intente nuevamente'),
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
