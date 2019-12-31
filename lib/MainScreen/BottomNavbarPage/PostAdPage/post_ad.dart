import 'package:bikroy_app/MainScreen/CategorySearchPage/categorySearchPage.dart';
import 'package:bikroy_app/MainScreen/LocationSearchPage/locationSearchPage.dart';
import 'package:bikroy_app/MainScreen/RegisterPage/registerPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../main.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter_multiple_image_picker/flutter_multiple_image_picker.dart';

class PostAdPage extends StatefulWidget {
  @override
  _PostAdPageState createState() => new _PostAdPageState();
}

class _PostAdPageState extends State<PostAdPage> {
  int con = 1, con1 = 0;
  int gen = 1, gen1 = 0;
  int nego = 0;
  String result = '';
  String _radioGenuine;
  TextEditingController typeController = new TextEditingController();
  TextEditingController brandController = new TextEditingController();
  TextEditingController modelController = new TextEditingController();
  TextEditingController featureController = new TextEditingController();
  TextEditingController descController = new TextEditingController();
  TextEditingController priceController = new TextEditingController();
  List images;
  int maxImageNo = 5, _current = 1;
  bool selectSingleImage = false;
  var imgs;

  initMultiPickUp() async {
    setState(() {
      images = null;
      //_platformMessage = 'No Error';
    });
    List resultList;
    //String error;
    try {
      resultList = await FlutterMultipleImagePicker.pickMultiImages(
          maxImageNo, selectSingleImage);
    } on PlatformException catch (e) {
      //error = e.message;
      print(e.message);
    }

    if (!mounted) return;

    setState(() {
      images = resultList;
      imgs = images.toList();
    });
  }

  void _handleRadioValueChange(String value) {
    setState(() {
      _radioGenuine = value;

      switch (_radioGenuine) {
        case '1':
          //Fluttertoast.showToast(msg: 'Male',toastLength: Toast.LENGTH_SHORT);
          break;
        case '2':
          //Fluttertoast.showToast(msg: 'Female',toastLength: Toast.LENGTH_SHORT);
          break;
      }
      debugPrint(_radioGenuine);
    });
  }

  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   await showDialogBox();
    // });
    super.initState();
  }

  Future<Null> showDialogBox() async {
    return showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            content: SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  Container(
                    color: Colors.transparent,
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.only(top: 35),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(top: 25),
                                child: Text(
                                  "Sign in to your account",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontFamily: 'Oswald',
                                      fontWeight: FontWeight.w400),
                                )),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 0.2, color: Colors.grey)),
                              child: TextFormField(
                                autofocus: false,
                                style: TextStyle(fontSize: 14),
                                decoration: InputDecoration(
                                  icon: Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: const Icon(
                                      Icons.email,
                                      color: Colors.black38,
                                      size: 17,
                                    ),
                                  ),
                                  hintText: 'Email',
                                  hintStyle: TextStyle(fontSize: 14),
                                  //labelText: 'Enter E-mail',
                                  contentPadding:
                                      EdgeInsets.fromLTRB(0.0, 5.0, 20.0, 5.0),
                                  border: InputBorder.none,
                                ),
                                validator: (val) =>
                                    val.isEmpty ? 'Field is empty' : null,
                                onSaved: (val) => result = val,
                                //validator: _validateEmail,
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.only(top: 5),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  color: Colors.white,
                                  border: Border.all(
                                      width: 0.2, color: Colors.grey)),
                              child: TextFormField(
                                autofocus: false,
                                obscureText: true,
                                style: TextStyle(fontSize: 14),
                                decoration: InputDecoration(
                                  icon: Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: const Icon(
                                      Icons.lock,
                                      color: Colors.black38,
                                      size: 17,
                                    ),
                                  ),
                                  hintText: 'Password',
                                  hintStyle: TextStyle(fontSize: 14),

                                  //labelText: 'Enter E-mail',
                                  contentPadding:
                                      EdgeInsets.fromLTRB(0.0, 5.0, 20.0, 5.0),
                                  border: InputBorder.none,
                                ),
                                validator: (val) =>
                                    val.isEmpty ? 'Field is empty' : null,
                                onSaved: (val) => result = val,
                                //validator: _validateEmail,
                              ),
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          Navigator.of(context).pop();
                                          _current = 1;
                                        });
                                      },
                                      child: Container(
                                          padding: EdgeInsets.all(10),
                                          margin: EdgeInsets.only(
                                              left: 0,
                                              right: 0,
                                              top: 10,
                                              bottom: 0),
                                          decoration: BoxDecoration(
                                              color: header,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))),
                                          child: Text(
                                            "Submit",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontFamily: 'BebasNeue',
                                            ),
                                            textAlign: TextAlign.center,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(
                                    left: 0, top: 15, bottom: 0),
                                child: Text(
                                  "Forget password?",
                                  style: TextStyle(
                                      color: header,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400),
                                )),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                child: Text(
                              "Don't have an account?",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w300),
                            )),
                            GestureDetector(
                              onTap: () {
                                //Navigator.of(context).pop();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterPage()),
                                );
                              },
                              child: Container(
                                  margin: EdgeInsets.only(left: 5),
                                  child: Text(
                                    "Sign up",
                                    style: TextStyle(
                                        color: header,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                    padding: EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/bikroy.png'),
                    ),
                    decoration: new BoxDecoration(
                      color: Colors.white, // border color
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //backgroundColor: Colors.black,
      body: _current == 0
          ? Container()
          : SafeArea(
              child: SingleChildScrollView(
                child: new Container(
                    padding: EdgeInsets.all(0.0),
                    //color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(
                              top: 15, left: 20, right: 20, bottom: 5),
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              color: Colors.white,
                              border:
                                  Border.all(width: 0.2, color: Colors.grey)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Location",
                                style: TextStyle(
                                    fontSize: 17, color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                  //color: Colors.white,
                                  //padding: EdgeInsets.all(20),
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Icon(Icons.location_on, color: header),
                                      Container(
                                          margin: EdgeInsets.only(left: 3),
                                          child: Text("Modina Market",
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 15))),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      locationSearch();
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(5),
                                      child: Text("Change",
                                          style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 13)),
                                    ),
                                  ),
                                ],
                              )),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(
                              top: 5, left: 20, right: 20, bottom: 5),
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              color: Colors.white,
                              border:
                                  Border.all(width: 0.2, color: Colors.grey)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    "Image",
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    " (Max 5)",
                                    style: TextStyle(
                                        fontSize: 11, color: Colors.blueAccent),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      GestureDetector(
                                        onTap: initMultiPickUp,
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              left: 0, right: 10),
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                              color: Colors.grey[200],
                                              border: Border.all(
                                                  width: 0.2,
                                                  color: Colors.grey)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(
                                                Icons.image,
                                                size: 16,
                                                color: Colors.black54,
                                              ),
                                              Container(
                                                  margin:
                                                      EdgeInsets.only(left: 5),
                                                  child: Text("Gallery",
                                                      style: TextStyle(
                                                          color: Colors.black54,
                                                          fontSize: 13)))
                                            ],
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            EdgeInsets.only(left: 0, right: 10),
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5.0)),
                                            color: Colors.grey[200],
                                            border: Border.all(
                                                width: 0.2,
                                                color: Colors.grey)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Icon(
                                              Icons.photo_camera,
                                              size: 16,
                                              color: Colors.black54,
                                            ),
                                            Container(
                                                margin:
                                                    EdgeInsets.only(left: 5),
                                                child: Text("Camera",
                                                    style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 13)))
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                        (images == null || images.length == 0)
                                            ? "0/5"
                                            : "${images.length}/5",
                                        style: TextStyle(
                                            color: Colors.blueAccent,
                                            fontSize: 13)),
                                  ),
                                ],
                              ),
                              (images == null || images.length == 0)
                                  ? Container()
                                  : Container(
                                      margin: EdgeInsets.only(
                                          left: 0, right: 0, top: 10),
                                      color: Colors.white,
                                      height: 180.0,
                                      width: MediaQuery.of(context).size.width,
                                      child: new ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder:
                                            (BuildContext context, int index) =>
                                                Padding(
                                          padding:
                                              const EdgeInsets.only(right: 5),
                                          child: Container(
                                            padding: EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5.0)),
                                                color: Colors.white,
                                                border: Border.all(
                                                    width: 0.2,
                                                    color: Colors.grey)),
                                            child: Container(
                                              //color: Colors.red,
                                              child: Stack(
                                                children: <Widget>[
                                                  Container(
                                                    //color: Colors.green,
                                                    child: Image.file(
                                                      File(images[index]
                                                          .toString()),
                                                      width: 100,
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      //var imgs = images;
                                                      setState(() {
                                                        imgs.removeAt(index);
                                                        images = imgs;
                                                        //print(images.length);
                                                      });
                                                    },
                                                    child: Container(
                                                        color: Colors.black
                                                            .withOpacity(.5),
                                                        margin: EdgeInsets.only(
                                                            left: 2,
                                                            right: 10,
                                                            bottom: 10),
                                                        padding:
                                                            EdgeInsets.all(2),
                                                        child: Icon(
                                                          Icons.cancel,
                                                          color: Colors.grey,
                                                          size: 21,
                                                        )),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                        itemCount: images.length,
                                      ),
                                    )
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(
                              top: 5, left: 20, right: 20, bottom: 5),
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              color: Colors.white,
                              border:
                                  Border.all(width: 0.2, color: Colors.grey)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "About Advertisement",
                                style: TextStyle(
                                    fontSize: 17, color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Container(
                                            margin: EdgeInsets.only(top: 15),
                                            child: Text(
                                              "Category",
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 12),
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                        //color: Colors.white,
                                        //padding: EdgeInsets.all(20),
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Icon(Icons.list, color: header),
                                            Container(
                                                margin:
                                                    EdgeInsets.only(left: 3),
                                                child: Text("Select Category",
                                                    style: TextStyle(
                                                        color: Colors.black54,
                                                        fontSize: 15))),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            categorySearch();
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(5),
                                            child: Text("Select",
                                                style: TextStyle(
                                                    color: Colors.blueAccent,
                                                    fontSize: 13)),
                                          ),
                                        ),
                                      ],
                                    )),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5),
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      //color: Colors.grey[100],
                                      border: Border.all(
                                          width: 0.2, color: Colors.grey)),
                                  margin: EdgeInsets.only(top: 10),
                                  child: TextField(
                                    controller: typeController,
                                    decoration: InputDecoration(
                                      hintText: 'Type of Product...',
                                      labelText: 'Enter Type',
                                      //labelStyle: TextStyle(color: header),
                                      contentPadding: EdgeInsets.fromLTRB(
                                          10.0, 5.0, 20.0, 5.0),
                                      border: InputBorder.none,
                                    ),
                                  )),
                              SizedBox(height: 5),
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Container(
                                            margin: EdgeInsets.only(top: 15),
                                            child: Text(
                                              "Condition",
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 12),
                                            )),
                                      ],
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 10, bottom: 10),
                                      child: new Row(
                                        children: <Widget>[
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                con = 1;
                                                con1 = 0;
                                              });
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  left: 0, right: 5),
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        right: 5),
                                                    padding: EdgeInsets.all(2),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5.0)),
                                                        color: (con == 1 &&
                                                                con1 == 0)
                                                            ? header
                                                            : Colors.white,
                                                        border: Border.all(
                                                            width: 0.2,
                                                            color:
                                                                Colors.grey)),
                                                    child: Icon(
                                                        Icons
                                                            .radio_button_checked,
                                                        size: 14,
                                                        color: (con == 1 &&
                                                                con1 == 0)
                                                            ? Colors.white
                                                            : Colors.grey),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        con = 1;
                                                        con1 = 0;
                                                      });
                                                    },
                                                    child: Text(
                                                      'Second Hand',
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
                                                con1 = 1;
                                                con = 0;
                                              });
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(
                                                  left: 20, right: 5),
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        right: 5),
                                                    padding: EdgeInsets.all(2),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5.0)),
                                                        color: (con1 == 1 &&
                                                                con == 0)
                                                            ? header
                                                            : Colors.white,
                                                        border: Border.all(
                                                            width: 0.2,
                                                            color:
                                                                Colors.grey)),
                                                    child: Icon(
                                                        Icons
                                                            .radio_button_checked,
                                                        size: 14,
                                                        color: (con1 == 1 &&
                                                                con == 0)
                                                            ? Colors.white
                                                            : Colors.grey),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        con1 = 1;
                                                        con = 0;
                                                      });
                                                    },
                                                    child: Text(
                                                      'New',
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
                              // Container(
                              //     margin: EdgeInsets.only(top: 0),
                              //     height: 2,
                              //     child: Divider()),
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      //color: Colors.grey[100],
                                      border: Border.all(
                                          width: 0.2, color: Colors.grey)),
                                  margin: EdgeInsets.only(top: 10),
                                  child: TextField(
                                    controller: brandController,
                                    decoration: InputDecoration(
                                      hintText: 'Type Brand Name...',
                                      labelText: 'Enter Brand',
                                      //labelStyle: TextStyle(color: header),
                                      contentPadding: EdgeInsets.fromLTRB(
                                          10.0, 5.0, 20.0, 5.0),
                                      border: InputBorder.none,
                                    ),
                                  )),
                              Container(
                                  margin: EdgeInsets.only(top: 15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      //color: Colors.grey[100],
                                      border: Border.all(
                                          width: 0.2, color: Colors.grey)),
                                  child: TextField(
                                    controller: modelController,
                                    decoration: InputDecoration(
                                      hintText: 'Type Model Name...',
                                      labelText: 'Enter Model Name',
                                      //labelStyle: TextStyle(color: header),
                                      contentPadding: EdgeInsets.fromLTRB(
                                          10.0, 5.0, 20.0, 5.0),
                                      border: InputBorder.none,
                                    ),
                                  )),

                              Container(
                                  margin: EdgeInsets.only(top: 15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      //color: Colors.grey[100],
                                      border: Border.all(
                                          width: 0.2, color: Colors.grey)),
                                  child: TextField(
                                    controller: featureController,
                                    decoration: InputDecoration(
                                      hintText: 'Type Feature...',
                                      labelText: 'Enter Product Feature',
                                      //labelStyle: TextStyle(color: header),
                                      contentPadding: EdgeInsets.fromLTRB(
                                          10.0, 5.0, 20.0, 5.0),
                                      border: InputBorder.none,
                                    ),
                                  )),

                              Container(
                                  //height: 80,
                                  margin: EdgeInsets.only(top: 15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      //color: Colors.grey[100],
                                      border: Border.all(
                                          width: 0.2, color: Colors.grey)),
                                  child: ConstrainedBox(
                                    constraints:
                                        BoxConstraints(maxHeight: 120.0),
                                    child: SingleChildScrollView(
                                      child: TextField(
                                        maxLines: null,
                                        controller: descController,
                                        decoration: InputDecoration(
                                          hintText:
                                              'Type Product Description...',
                                          labelText: 'Enter Description',
                                          //labelStyle: TextStyle(color: header),
                                          contentPadding: EdgeInsets.fromLTRB(
                                              10.0, 5.0, 20.0, 5.0),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  )),

                              Container(
                                margin: EdgeInsets.only(top: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        Container(
                                            margin: EdgeInsets.only(top: 5),
                                            child: Text(
                                              "Genuine",
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 12),
                                            )),
                                      ],
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 10, bottom: 10),
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
                                              margin: EdgeInsets.only(
                                                  left: 0, right: 5),
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        right: 5),
                                                    padding: EdgeInsets.all(2),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5.0)),
                                                        color: (gen == 1 &&
                                                                gen1 == 0)
                                                            ? header
                                                            : Colors.white,
                                                        border: Border.all(
                                                            width: 0.2,
                                                            color:
                                                                Colors.grey)),
                                                    child: Icon(
                                                        Icons
                                                            .radio_button_checked,
                                                        size: 14,
                                                        color: (gen == 1 &&
                                                                gen1 == 0)
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
                                                      'Refurnished',
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
                                              margin: EdgeInsets.only(
                                                  left: 20, right: 5),
                                              child: Row(
                                                children: <Widget>[
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        right: 5),
                                                    padding: EdgeInsets.all(2),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5.0)),
                                                        color: (gen1 == 1 &&
                                                                gen == 0)
                                                            ? header
                                                            : Colors.white,
                                                        border: Border.all(
                                                            width: 0.2,
                                                            color:
                                                                Colors.grey)),
                                                    child: Icon(
                                                        Icons
                                                            .radio_button_checked,
                                                        size: 14,
                                                        color: (gen1 == 1 &&
                                                                gen == 0)
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
                                                      'Original',
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
                                  margin: EdgeInsets.only(top: 15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      //color: Colors.grey[100],
                                      border: Border.all(
                                          width: 0.2, color: Colors.grey)),
                                  child: TextField(
                                    controller: priceController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      hintText: 'Type Product Price...',
                                      labelText: 'Enter Price',
                                      //labelStyle: TextStyle(color: header),
                                      contentPadding: EdgeInsets.fromLTRB(
                                          10.0, 5.0, 20.0, 5.0),
                                      border: InputBorder.none,
                                    ),
                                  )),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    nego++;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: 0, right: 5, top: 10),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(right: 5),
                                        padding: EdgeInsets.all(1),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(0.0)),
                                            color: nego % 2 == 0
                                                ? Colors.white
                                                : Colors.white,
                                            border: Border.all(
                                                width: 0.2,
                                                color: Colors.grey)),
                                        child: Icon(Icons.done,
                                            size: 15,
                                            color: nego % 2 == 0
                                                ? Colors.white
                                                : header),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            nego++;
                                          });
                                        },
                                        child: Text(
                                          'Negotiable',
                                          style: TextStyle(
                                              color: Colors.blueAccent,
                                              fontSize: 12),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.only(
                                top: 5, left: 20, right: 20, bottom: 5),
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                color: Colors.white,
                                border:
                                    Border.all(width: 0.2, color: Colors.grey)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "User Details",
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      top: 5, right: 5, bottom: 5),
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 5, bottom: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Container(
                                                //color: Colors.grey[200],
                                                //padding: EdgeInsets.all(20),
                                                child: Text(
                                              "John Smith",
                                              style: TextStyle(
                                                  color: Colors.black54),
                                            )),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      top: 0, right: 5, bottom: 5),
                                  width: MediaQuery.of(context).size.width,
                                  child: Center(
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 5, bottom: 5),
                                              child: Row(
                                                children: <Widget>[
                                                  Icon(Icons.location_on,
                                                      color: Colors.grey,
                                                      size: 16),
                                                  Container(
                                                      margin: EdgeInsets.only(
                                                          left: 5),
                                                      child: Text(
                                                        "Sanfrancisco, USA",
                                                        style: TextStyle(
                                                            color: Colors.grey),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      top: 0, right: 5, bottom: 5),
                                  width: MediaQuery.of(context).size.width,
                                  child: Center(
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 5, bottom: 5),
                                              child: Row(
                                                children: <Widget>[
                                                  Icon(Icons.phone,
                                                      color: Colors.grey,
                                                      size: 16),
                                                  Container(
                                                      margin: EdgeInsets.only(
                                                          left: 5),
                                                      child: Text(
                                                        "91XXXXXXXX",
                                                        style: TextStyle(
                                                            color: Colors.grey),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(
                                      top: 0, right: 5, bottom: 5),
                                  width: MediaQuery.of(context).size.width,
                                  child: Center(
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 5, bottom: 5),
                                              child: Row(
                                                children: <Widget>[
                                                  Icon(Icons.email,
                                                      color: Colors.grey,
                                                      size: 16),
                                                  Container(
                                                      margin: EdgeInsets.only(
                                                          left: 5),
                                                      child: Text(
                                                        "john.smith@gmail.com",
                                                        style: TextStyle(
                                                            color: Colors.grey),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        Container(
                          margin: EdgeInsets.only(
                              left: 20, right: 20, bottom: 20, top: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              color: header,
                              border:
                                  Border.all(width: 0.2, color: Colors.grey)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.send,
                                size: 16,
                                color: Colors.white,
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 5),
                                  child: Text("Post Ad",
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

  void locationSearch() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new LocationSearchDialog();
        },
        fullscreenDialog: true));
  }

  void categorySearch() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new CategorySearchDialog();
        },
        fullscreenDialog: true));
  }
}
