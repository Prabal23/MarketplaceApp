import 'package:bikroy_app/Forms/RegisterForm/registerForm.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String email = "", pass = "", name = "", adderss = "";
  String loginEmail = "", loginPass = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(color: header),
        backgroundColor: Colors.white,
        title: Center(
          child: Container(
            margin: EdgeInsets.only(top: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text("Sign up",
                    style: TextStyle(fontSize: 17, color: Colors.black54)),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: RegisterForm(),
      ),
    );
  }
}
