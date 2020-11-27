import 'package:flutter/material.dart';
import 'package:proyecto_final_2020_2/classes/auth_firebase.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_final_2020_2/widgets/%20FormCardRegister.dart';
import 'package:proyecto_final_2020_2/widgets/FormCardLogin.dart';
import 'package:firebase_database/firebase_database.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key, this.auth, this.onSignIn}) : super(key: key);
  final AuthFirebase auth;
  final VoidCallback onSignIn;

  @override
  _LoginPageState createState() => _LoginPageState();
}

enum Page { login, register }

class _LoginPageState extends State<LoginPage> {
  bool _isSelected = false;
  Page p = Page.login;
  bool loading = false;
  var email = TextEditingController();
  var password = TextEditingController();
  var name = TextEditingController();
  var lastname = TextEditingController();
  var age = TextEditingController();

  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  Widget radioButton(bool isSelected) => Container(
        width: 16.0,
        height: 16.0,
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2.0, color: Colors.black)),
        child: isSelected
            ? Container(
                width: double.infinity,
                height: double.infinity,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.black),
              )
            : Container(),
      );

  Widget horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: ScreenUtil.getInstance().setWidth(120),
          height: 1.0,
          color: Colors.black26.withOpacity(.2),
        ),
      );

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: loading
          ? Center(child: CircularProgressIndicator())
          : Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Image.asset("assets/image_01.png"),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Expanded(child: Image.asset("assets/image_02.png"))
                  ],
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Image.asset(
                              "assets/logo.png",
                              width: ScreenUtil.getInstance().setWidth(110),
                              height: ScreenUtil.getInstance().setHeight(110),
                            ),
                            Text("TCuido",
                                style: TextStyle(
                                    fontFamily: "Poppins-Bold",
                                    fontSize:
                                        ScreenUtil.getInstance().setSp(46),
                                    letterSpacing: .6,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(180),
                        ),
                        changePages(),
                        SizedBox(
                            height: ScreenUtil.getInstance().setHeight(40)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Visibility(
                                visible: p == Page.login ? true : false,
                                child: Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 12.0,
                                    ),
                                    GestureDetector(
                                      onTap: _radio,
                                      child: radioButton(_isSelected),
                                    ),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    Text("Recordarme",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: "Poppins-Medium"))
                                  ],
                                )),
                            InkWell(
                              child: Container(
                                width: ScreenUtil.getInstance().setWidth(330),
                                height: ScreenUtil.getInstance().setHeight(100),
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Color(0xFF17ead9),
                                      Color(0xFF6078ea)
                                    ]),
                                    borderRadius: BorderRadius.circular(6.0),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Color(0xFF6078ea).withOpacity(.3),
                                          offset: Offset(0.0, 8.0),
                                          blurRadius: 8.0)
                                    ]),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      signInORregister(context);
                                    },
                                    child: Center(
                                      child: Text(
                                          p == Page.login
                                              ? "Ingresar"
                                              : "Registrar",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontFamily: "Poppins-Bold",
                                              fontSize: 18,
                                              letterSpacing: 1.0)),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(30),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              p == Page.login
                                  ? "Quieres Registrarte? "
                                  : "Ya tienes una cuenta?",
                              style: TextStyle(fontFamily: "Poppins-Medium"),
                            ),
                            InkWell(
                              onTap: () {
                                toRegister();
                              },
                              child: Text(
                                  p == Page.login ? "Registrarse" : "Ingresa",
                                  style: TextStyle(
                                      color: Color(0xFF5d74e3),
                                      fontFamily: "Poppins-Bold")),
                            )
                          ],
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(40),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            horizontalLine(),
                            Text("Powered by",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontFamily: "Poppins-Medium")),
                            horizontalLine()
                          ],
                        ),
                        SizedBox(
                          height: ScreenUtil.getInstance().setHeight(10),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "TCuido:",
                              style: TextStyle(fontFamily: "Poppins-Medium"),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text("@lazarod, @leiderp, @erodriguez",
                                  style: TextStyle(
                                      color: Color(0xFF5d74e3),
                                      fontFamily: "Poppins-Bold")),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
    );
  }

  Widget changePages() {
    switch (p) {
      case Page.login:
        return FormCard(
          email: email,
          password: password,
        );
        break;
      case Page.register:
        return FormCardRegister(
          email: email,
          name: name,
          age: age,
          lastname: lastname,
          password: password,
        );
        break;
    }
  }

  void toRegister() {
    setState(() {
      if (p == Page.login) {
        p = Page.register;
      } else {
        p = Page.login;
      }
    });
  }

  void signInORregister(BuildContext context) {
    setState(() {
      loading = true;
    });
    if (p == Page.login) {
      signIn(context);
    } else {
      register(context);
    }
  }

  void register(BuildContext context) {
    widget.auth.createUser(email.text, password.text).then((value) {
      if (value != null &&
          value != 'La constraseña ingresada es demasiado debil.' &&
          value !=
              'Ya existe una cuenta registrada con este correo electronico.') {
        DatabaseReference db =
            FirebaseDatabase.instance.reference().child('Users');
        db.child(value).set(getUser()).then((value) {
          widget.onSignIn();
        });
      } else {
        if (value == null)
          value = "Asegúrese de que la informacion sumistrada sea correcta.";
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Correo electronico o constraseña incorrecta'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(value),
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('Aceptar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      loading = false;
                    });
                  },
                ),
              ],
            );
          },
        );
      }
    });
  }

  void signIn(BuildContext context) {
    widget.auth.signin(email.text, password.text).then((value) {
      if (value != null &&
          value != 'No se ha encontrado ningun usuario con este email.' &&
          value != 'Contraseña incorrecta para este usuario.') {
        widget.onSignIn();
      } else {
        if (value == null)
          value = "Asegúrese de que la informacion sumistrada sea correcta.";
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Correo electronico o constraseña incorrecta'),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text(value),
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text('Aceptar'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      loading = false;
                    });
                  },
                ),
              ],
            );
          },
        );
      }
    });
  }

  Map<String, dynamic> getUser() {
    Map<String, dynamic> data = Map();
    data['name'] = name.text;
    data['lastname'] = lastname.text;
    data['age'] = age.text;
    data['email'] = email.text;
    return data;
  }
}
