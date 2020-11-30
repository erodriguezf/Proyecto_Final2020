import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:proyecto_final_2020_2/classes/auth_firebase.dart';
import 'package:proyecto_final_2020_2/pages/alarm_page.dart';
import 'package:proyecto_final_2020_2/pages/galleryPage.dart';
import 'package:proyecto_final_2020_2/pages/game1_card.dart';
import 'package:proyecto_final_2020_2/pages/graphic.dart';
import 'package:proyecto_final_2020_2/pages/informationPage.dart';
import 'package:proyecto_final_2020_2/pages/notesPage.dart';

import 'listViewGames.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key, this.auth, this.onSignIn}) : super(key: key);
  final AuthFirebase auth;
  final VoidCallback onSignIn;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return Scaffold(
      appBar: AppBar(
        title: Text("TCUIDO"),
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      drawer: Drawer(
          child: Container(
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xFF6078ea), Color(0xFF1BB5FD)]),
            borderRadius: BorderRadius.circular(6.0),
            boxShadow: [
              BoxShadow(
                  color: Color(0xFF17ead9).withOpacity(.3),
                  offset: Offset(0.0, 8.0),
                  blurRadius: 8.0)
            ]),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: ListTile(
                title: Text(
                  "TCuido",
                  style: TextStyle(
                      //color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w800),
                ),
                subtitle: Text(
                  "Juntos contra el Alzheimer",
                  style: TextStyle(
                    //color: Color(0xFF1BB5FD),
                    fontSize: 18,
                  ),
                ),
                leading: CircleAvatar(
                  child: Image.asset(
                    "assets/logo.png",
                  ),
                  radius: 40,
                ),
              ),
            ),
            ListTile(
              title: Text('Entender el Alzheimer'),
              leading: Icon(Icons.info),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => InformationPage()));
              },
            ),
            ListTile(
              title: Text('Dudas Generales'),
              leading: Icon(Icons.help),
              onTap: () {},
            ),
            ListTile(
              title: Text('Recursos'),
              leading: Icon(Icons.source),
              onTap: () {},
            ),
            ListTile(
              title: Text('Notas'),
              leading: Icon(Icons.note),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotePage(
                              auth: widget.auth,
                            )));
              },
            ),
            ListTile(
              title: Text('Alarmas'),
              leading: Icon(Icons.alarm),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AlarmPage()));
              },
            ),
            ListTile(
              title: Text('Galeria'),
              leading: Icon(Icons.photo_album),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GalleryPage(
                              auth: widget.auth,
                            )));
              },
            ),
            ListTile(
              title: Text('Juegos'),
              leading: Icon(Icons.games),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ListViewGames()));
              },
            ),
            ListTile(
              title: Text('Cerrar sesion'),
              leading: Icon(Icons.exit_to_app),
              onTap: signOUt,
            ),
          ],
        ),
      )),
      body: Stack(
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
              padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0),
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
                              fontSize: ScreenUtil.getInstance().setSp(46),
                              letterSpacing: .6,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getInstance().setHeight(300),
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
                              fontSize: 16.0, fontFamily: "Poppins-Medium")),
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
                                fontSize: 12,
                                color: Color(0xFF5d74e3),
                                fontFamily: "Poppins-Bold")),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          // SideBar(
          //   onSignIn: widget.onSignIn,
          //   auth: widget.auth,
          // ),
        ],
      ),
    );
  }

  void signOUt() {
    widget.auth.signOut();
    widget.onSignIn();
  }
}

Widget horizontalLine() => Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: ScreenUtil.getInstance().setWidth(120),
        height: 1.0,
        color: Colors.black26.withOpacity(.2),
      ),
    );
