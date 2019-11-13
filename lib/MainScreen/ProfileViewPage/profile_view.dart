import 'package:bikroy_app/MainScreen/ProfileEditPage/profileEdit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../main.dart';
import 'package:intl/intl.dart';

class ProfileViewPage extends StatefulWidget {
  @override
  _ProfileViewPageState createState() => new _ProfileViewPageState();
}

class _ProfileViewPageState extends State<ProfileViewPage> {
  String result = '';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: header,
        title: Center(
          child: Container(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("My Profile",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  GestureDetector(
                      onTap: () {
                        editProfile();
                      },
                      child: Container(
                          padding: EdgeInsets.all(5), child: Icon(Icons.edit)))
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: new Container(
              padding: EdgeInsets.all(0.0),
              //color: Colors.white,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                          padding: EdgeInsets.all(1.0),
                          child: CircleAvatar(
                            radius: 30.0,
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage('assets/user.png'),
                          ),
                          decoration: new BoxDecoration(
                            color: Colors.grey, // border color
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Hello,",
                              style: TextStyle(
                                  fontSize: 13, color: Colors.black38),
                            ),
                            Text(
                              "John Smith",
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 2,
                      child: Divider()),
                  Container(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.home,
                            color: Colors.grey,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 8),
                                  child: Text(
                                    'Address',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 8, top: 3),
                                    child: Text(
                                      "Modina Market",
                                      style: TextStyle(
                                          color: Colors.black38, fontSize: 15),
                                    ))
                              ],
                            ),
                          ),
                        ],
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 0),
                      height: 2,
                      child: Divider()),
                  Container(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.phone,
                            color: Colors.grey,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 8),
                                  child: Text(
                                    'Phone Number',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 8, top: 3),
                                    child: Text(
                                      "017XXXXXXXX",
                                      style: TextStyle(
                                          color: Colors.black38, fontSize: 15),
                                    ))
                              ],
                            ),
                          ),
                        ],
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 0),
                      height: 2,
                      child: Divider()),
                  Container(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.email,
                            color: Colors.grey,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 8),
                                  child: Text(
                                    'Email',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 8, top: 3),
                                    child: Text(
                                      "john.smith@gmail.com",
                                      style: TextStyle(
                                          color: Colors.black38, fontSize: 15),
                                    ))
                              ],
                            ),
                          ),
                        ],
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 0),
                      height: 2,
                      child: Divider()),
                  Container(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.calendar_today,
                            color: Colors.grey,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 8),
                                  child: Text(
                                    'Birth Date',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 8, top: 3),
                                    child: Text(
                                      "23/07/1994",
                                      style: TextStyle(
                                          color: Colors.black38, fontSize: 15),
                                    ))
                              ],
                            ),
                          ),
                        ],
                      )),
                  Container(
                      margin: EdgeInsets.only(top: 0),
                      height: 2,
                      child: Divider()),
                  Container(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.supervisor_account,
                            color: Colors.grey,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 8),
                                  child: Text(
                                    'Gender',
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 8, top: 3),
                                    child: Text(
                                      "Male",
                                      style: TextStyle(
                                          color: Colors.black38, fontSize: 15),
                                    ))
                              ],
                            ),
                          ),
                        ],
                      )),
                ],
              )),
        ),
      ),
    );
  }

  void editProfile() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new ProfileEditDialog();
        },
        fullscreenDialog: true));
  }
}

