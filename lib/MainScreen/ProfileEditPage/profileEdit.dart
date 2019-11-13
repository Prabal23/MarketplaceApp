import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../main.dart';

import 'package:image_picker/image_picker.dart';

class ProfileEditDialog extends StatefulWidget {
  @override
  _ProfileEditDialogState createState() => new _ProfileEditDialogState();
}

class _ProfileEditDialogState extends State<ProfileEditDialog> {
  String result = '', date = 'Select Birth Date';
  TextEditingController nameController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController bdController = new TextEditingController();
  var dd, finalDate;
  DateTime _date = DateTime.now();
  int gen = 1, gen1 = 0;
  Future<File> fileImage;

  @override
  void initState() {
    nameController.text = 'John Smith';
    addressController.text = 'Modina Market';
    phoneController.text = '017XXXXXXXX';
    emailController.text = 'john.smith@gmail.com';
    bdController.text = '23/01/1993';
    var now = new DateTime.now();
    date = new DateFormat("dd/MM/yyyy").format(now);
    super.initState();
  }

  pickImagefromGallery(ImageSource src) {
    setState(() {
      fileImage = ImagePicker.pickImage(source: src);
    });
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1915),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _date) {
      dd = DateTime.parse(_date.toString());
      String d = "${dd.day}";
      if (d.length == 1) {
        d = "0" + d;
      } else {
        d = d;
      }
      String m = "${dd.month}";
      if (m.length == 1) {
        m = "0" + m;
      } else {
        m = m;
      }
      finalDate = "$d/$m/${dd.year}";
      date = finalDate.toString();
      //print('Birth Date : $finalDate');
      //print('Birth Date : $date');
      setState(() {
        _date = picked;
        var dd1 = DateTime.parse(_date.toString());
        String d = "${dd1.day}";
        if (d.length == 1) {
          d = "0" + d;
        } else {
          d = d;
        }
        String m = "${dd1.month}";
        if (m.length == 1) {
          m = "0" + m;
        } else {
          m = m;
        }
        finalDate = "$d/$m/${dd.year}";
        var finalDate1 = "$d/$m/${dd1.year}";
        date = finalDate1.toString();
        // DateTime dateTime = DateTime.parse(date);
        // Fluttertoast.showToast(msg: dateTime.toString(),toastLength: Toast.LENGTH_SHORT);
        // _date = dateTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //backgroundColor: Colors.black,
      appBar: new AppBar(
        backgroundColor: header,
        title: const Text('Edit Profile'),
      ),
      //body: new Text("It's a Dialog!"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: new Container(
              padding: EdgeInsets.all(0.0),
              //color: Colors.white,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        FutureBuilder<File>(
                          future: fileImage,
                          builder: (BuildContext context,
                              AsyncSnapshot<File> snapshot) {
                            if (snapshot.connectionState ==
                                    ConnectionState.done &&
                                snapshot.data != null) {
                              return Container(
                                //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                padding: EdgeInsets.all(1.0),
                                child: CircleAvatar(
                                  radius: 50.0,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: FileImage(snapshot.data),
                                ),
                                decoration: new BoxDecoration(
                                  color: Colors.grey, // border color
                                  shape: BoxShape.circle,
                                ),
                              );
                            } else if (snapshot.error != null) {
                              return const Text(
                                'Error Picking Image',
                                textAlign: TextAlign.center,
                              );
                            } else {
                              return Container(
                                //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                padding: EdgeInsets.all(1.0),
                                child: CircleAvatar(
                                  radius: 50.0,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage:
                                      AssetImage('assets/user.png'),
                                ),
                                decoration: new BoxDecoration(
                                  color: Colors.grey, // border color
                                  shape: BoxShape.circle,
                                ),
                              );
                            }
                          },
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            pickImagefromGallery(ImageSource.gallery);
                          },
                          child: Container(
                            width: 160,
                            margin: EdgeInsets.only(left: 0, right: 0, top: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                color: Colors.grey[200],
                                border:
                                    Border.all(width: 0.2, color: Colors.grey)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.image,
                                  size: 16,
                                  color: Colors.black54,
                                ),
                                Container(
                                    margin: EdgeInsets.only(left: 5),
                                    child: Text("Select photo",
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 13)))
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 2,
                      child: Divider()),
                  Container(
                      padding: EdgeInsets.only(
                          left: 15, right: 15, top: 10, bottom: 10),
                      child: Container(
                          margin: EdgeInsets.only(left: 8, top: 0),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              color: Colors.grey[100],
                              border:
                                  Border.all(width: 0.2, color: Colors.grey)),
                          child: TextField(
                            controller: nameController,
                            autofocus: true,
                            style: TextStyle(color: Colors.black54),
                            decoration: InputDecoration(
                              hintText: 'Type your name...',
                              labelText: 'Enter Name',
                              labelStyle: TextStyle(color: header),
                              contentPadding:
                                  EdgeInsets.fromLTRB(10.0, 5.0, 20.0, 5.0),
                              border: InputBorder.none,
                            ),
                          ))),
                  // Container(
                  //     margin: EdgeInsets.only(top: 0),
                  //     height: 2,
                  //     child: Divider()),
                  Container(
                      padding: EdgeInsets.only(
                          left: 15, right: 15, top: 10, bottom: 10),
                      child: Container(
                          margin: EdgeInsets.only(left: 8, top: 0),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              color: Colors.grey[100],
                              border:
                                  Border.all(width: 0.2, color: Colors.grey)),
                          child: TextField(
                            controller: addressController,
                            style: TextStyle(color: Colors.black54),
                            decoration: InputDecoration(
                              hintText: 'Type your address...',
                              labelText: 'Enter Address',
                              labelStyle: TextStyle(color: header),
                              contentPadding:
                                  EdgeInsets.fromLTRB(10.0, 5.0, 20.0, 5.0),
                              border: InputBorder.none,
                            ),
                          ))),
                  // Container(
                  //     margin: EdgeInsets.only(top: 0),
                  //     height: 2,
                  //     child: Divider()),
                  Container(
                      padding: EdgeInsets.only(
                          left: 15, right: 15, top: 10, bottom: 10),
                      child: Container(
                          margin: EdgeInsets.only(left: 8, top: 0),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              color: Colors.grey[100],
                              border:
                                  Border.all(width: 0.2, color: Colors.grey)),
                          child: TextField(
                            controller: phoneController,
                            style: TextStyle(color: Colors.black54),
                            decoration: InputDecoration(
                              hintText: 'Type your phone number...',
                              labelText: 'Enter Phone Number',
                              labelStyle: TextStyle(color: header),
                              contentPadding:
                                  EdgeInsets.fromLTRB(10.0, 5.0, 20.0, 5.0),
                              border: InputBorder.none,
                            ),
                          ))),
                  Container(
                      margin: EdgeInsets.only(top: 0),
                      height: 2,
                      child: Divider()),
                  Container(
                      padding: EdgeInsets.only(
                          left: 15, right: 15, top: 10, bottom: 10),
                      child: Container(
                          margin: EdgeInsets.only(left: 8, top: 0),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              color: Colors.grey[100],
                              border:
                                  Border.all(width: 0.2, color: Colors.grey)),
                          child: TextField(
                            controller: emailController,
                            style: TextStyle(color: Colors.black54),
                            decoration: InputDecoration(
                              hintText: 'Type your email...',
                              labelText: 'Enter Email',
                              labelStyle: TextStyle(color: header),
                              contentPadding:
                                  EdgeInsets.fromLTRB(10.0, 5.0, 20.0, 5.0),
                              border: InputBorder.none,
                            ),
                          ))),
                  Container(
                      margin: EdgeInsets.only(top: 0),
                      height: 2,
                      child: Divider()),
                  Container(
                    margin: EdgeInsets.only(
                        left: 25, top: 10, bottom: 10, right: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: Colors.grey[100],
                        border: Border.all(width: 0.2, color: Colors.grey)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(left: 10, top: 5),
                                child: Text(
                                  "Select Birth Date",
                                  style: TextStyle(color: header, fontSize: 12),
                                )),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                  margin: EdgeInsets.only(left: 10, top: 3),
                                  child: Text(
                                    '$date',
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 16),
                                  )),
                              GestureDetector(
                                  onTap: () {
                                    _selectDate(context);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 15),
                                    child: Text(
                                      "Choose",
                                      style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 0),
                      height: 2,
                      child: Divider()),
                  Container(
                    margin: EdgeInsets.only(
                        left: 25, top: 10, bottom: 10, right: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: Colors.grey[100],
                        border: Border.all(width: 0.2, color: Colors.grey)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(left: 10, top: 5),
                                child: Text(
                                  "Select Gender",
                                  style: TextStyle(color: header, fontSize: 12),
                                )),
                          ],
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(top: 10, bottom: 10, left: 10),
                          child: new Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    gen = 1;
                                    gen1 = 0;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 0, right: 5),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(right: 5),
                                        padding: EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5.0)),
                                            color: (gen == 1 && gen1 == 0)
                                                ? header
                                                : Colors.white,
                                            border: Border.all(
                                                width: 0.2,
                                                color: Colors.grey)),
                                        child: Icon(Icons.done,
                                            size: 14,
                                            color: (gen == 1 && gen1 == 0)
                                                ? Colors.white
                                                : Colors.grey),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            gen = 1;
                                            gen1 = 0;
                                          });
                                        },
                                        child: Text(
                                          'Female',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    gen1 = 1;
                                    gen = 0;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 20, right: 5),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(right: 5),
                                        padding: EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5.0)),
                                            color: (gen1 == 1 && gen == 0)
                                                ? header
                                                : Colors.white,
                                            border: Border.all(
                                                width: 0.2,
                                                color: Colors.grey)),
                                        child: Icon(Icons.done,
                                            size: 14,
                                            color: (gen1 == 1 && gen == 0)
                                                ? Colors.white
                                                : Colors.grey),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            gen1 = 1;
                                            gen = 0;
                                          });
                                        },
                                        child: Text(
                                          'Male',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 25, right: 15, bottom: 20, top: 5),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: header,
                        border: Border.all(width: 0.2, color: Colors.grey)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.edit,
                          size: 20,
                          color: Colors.white,
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text("Edit",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17)))
                      ],
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
