import 'package:flutter/material.dart';

 enum FormType {
  login,
  register
}

 class Registrate extends StatelessWidget {
  final TextEditingController _email = new TextEditingController();
  final TextEditingController _pasword = new TextEditingController();

  String _email1 = "";
  String _password1 = "";
  FormType _form = FormType.login;

  _LoginPageState() {
    _email.addListener(_emailListen);
    _pasword.addListener(_passwordListen);
  }

  void _emailListen() {
    if (_email.text.isEmpty) {
      _email1 = "";
    } else {
      _email1 = _email.text;
    }
  }

  void _passwordListen() {
    if (_pasword.text.isEmpty) {
      _password1 = "";
    } else {
      _password1 = _pasword.text;
    }
  }

  @override
   build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Registrate'),
      ),
      body: new Center(
        child: Column(
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

        RaisedButton(
          onPressed: (){

            if(_email1!=" " && _password1!=" "){
                 Navigator.pop(context);
            }else{
              print('error');
            }
    

          },
        child: Text('regresar'),
        ),

            ]
          
        ),
      ),
    );
  }

  void _createAccountPressed () {
    print('The user wants to create an accoutn with $_email and $_pasword');

  }

}
 