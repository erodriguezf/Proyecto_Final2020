import 'package:flutter/material.dart';
import 'Iniciarsecion.dart';
import 'registrarse.dart';

void main() => runApp(MyHome());

class MyHome extends StatelessWidget{
 
 @override
 Widget build(BuildContext context){
   return MaterialApp(
     title: 'My nav',
     theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),


   );

 }

}

class Home extends StatelessWidget{
  final controler1 = TextEditingController();
   @override
   Widget build(BuildContext context){
     return Scaffold(
       appBar: AppBar(
         title: Text('My app'),
       ),
       body: ListView
       (children: <Widget>[
            
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
               TextField(
          obscureText: false,
        	decoration: InputDecoration(
          	border: OutlineInputBorder(),
          	hintText: "Email",
        	),
      	),
        
         TextField(
          obscureText: true,
        	decoration: InputDecoration(
          	border: OutlineInputBorder(),
          	hintText: "Pasword",
        	),
      	),
             _row(context, "Iniciar",
              Iniciar()), 
              _row(context, "Registrate",
              Registrate()),
             // Navegar()
            ],
          ),
        ])

     );

   }
}

Widget _row(BuildContext context, String text, Widget destination) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
              onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => destination),
                    )
                  },
              child: Text(text)),
          SizedBox(height: 20.0)
        ]);
  }

