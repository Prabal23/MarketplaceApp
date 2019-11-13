import 'package:flutter/material.dart';

import '../../main.dart';

class LoginDialogBox extends StatefulWidget {
  @override
  _LoginDialogBoxState createState() => _LoginDialogBoxState();
}

class _LoginDialogBoxState extends State<LoginDialogBox> {
  @override
  void initState() {
    showDialogBox();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<Null> showDialogBox() async {
    return showDialog<Null>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return new AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            title: Center(
              child: SingleChildScrollView(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: header, width: 1.5),
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white),
                          child: Icon(
                            Icons.done,
                            color: header,
                            size: 50,
                          )),
                      Container(
                          margin: EdgeInsets.only(top: 12),
                          child: Text(
                            "Password has been reset successfully",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                                fontFamily: 'Oswald',
                                fontWeight: FontWeight.w400),
                          )),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  Navigator.of(context).pop();
                                });
                              },
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.only(
                                      left: 0, right: 0, top: 20, bottom: 0),
                                  decoration: BoxDecoration(
                                      color: header,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100))),
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontFamily: 'BebasNeue',
                                    ),
                                    textAlign: TextAlign.center,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
