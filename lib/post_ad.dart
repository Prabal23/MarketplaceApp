import 'package:bikroy_app/my_posts.dart';
import 'package:bikroy_app/profile_opt.dart';
import 'package:bikroy_app/profile_view.dart';
import 'package:bikroy_app/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './main.dart';
import 'dart:io';
import 'dart:async';
import 'chatlist.dart';
import 'favourite.dart';
import 'homepage.dart';
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
  int maxImageNo = 5;
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
    //images.length = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: header,
        title: Center(
          child: Container(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Post Ad",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
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
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(
                        top: 15, left: 20, right: 20, bottom: 5),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: Colors.white,
                        border: Border.all(width: 0.2, color: Colors.grey)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Location",
                          style: TextStyle(fontSize: 17, color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                            //color: Colors.white,
                            //padding: EdgeInsets.all(20),
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    margin:
                        EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 5),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: Colors.white,
                        border: Border.all(width: 0.2, color: Colors.grey)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              "Image",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.black),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: initMultiPickUp,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 0, right: 10),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        color: Colors.grey[200],
                                        border: Border.all(
                                            width: 0.2, color: Colors.grey)),
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
                                            margin: EdgeInsets.only(left: 5),
                                            child: Text("Gallery",
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 13)))
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 0, right: 10),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      color: Colors.grey[200],
                                      border: Border.all(
                                          width: 0.2, color: Colors.grey)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.photo_camera,
                                        size: 16,
                                        color: Colors.black54,
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(left: 5),
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
                                      color: Colors.blueAccent, fontSize: 13)),
                            ),
                          ],
                        ),
                        (images == null || images.length == 0)
                            ? Container()
                            : Container(
                                margin:
                                    EdgeInsets.only(left: 0, right: 0, top: 10),
                                color: Colors.white,
                                height: 180.0,
                                width: MediaQuery.of(context).size.width,
                                child: new ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (BuildContext context,
                                          int index) =>
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
                    margin:
                        EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 5),
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: Colors.white,
                        border: Border.all(width: 0.2, color: Colors.grey)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "About Advertisement",
                          style: TextStyle(fontSize: 17, color: Colors.black),
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
                                          margin: EdgeInsets.only(left: 3),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                //color: Colors.grey[100],
                                border:
                                    Border.all(width: 0.2, color: Colors.grey)),
                            margin: EdgeInsets.only(top: 10),
                            child: TextField(
                              controller: typeController,
                              decoration: InputDecoration(
                                hintText: 'Type of Product...',
                                labelText: 'Enter Type',
                                //labelStyle: TextStyle(color: header),
                                contentPadding:
                                    EdgeInsets.fromLTRB(10.0, 5.0, 20.0, 5.0),
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
                                margin: EdgeInsets.only(top: 10, bottom: 10),
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
                                        margin:
                                            EdgeInsets.only(left: 0, right: 5),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.only(right: 5),
                                              padding: EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5.0)),
                                                  color: (con == 1 && con1 == 0)
                                                      ? header
                                                      : Colors.white,
                                                  border: Border.all(
                                                      width: 0.2,
                                                      color: Colors.grey)),
                                              child: Icon(Icons.radio_button_checked,
                                                  size: 14,
                                                  color: (con == 1 && con1 == 0)
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
                                        margin:
                                            EdgeInsets.only(left: 20, right: 5),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.only(right: 5),
                                              padding: EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5.0)),
                                                  color: (con1 == 1 && con == 0)
                                                      ? header
                                                      : Colors.white,
                                                  border: Border.all(
                                                      width: 0.2,
                                                      color: Colors.grey)),
                                              child: Icon(Icons.radio_button_checked,
                                                  size: 14,
                                                  color: (con1 == 1 && con == 0)
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                //color: Colors.grey[100],
                                border:
                                    Border.all(width: 0.2, color: Colors.grey)),
                            margin: EdgeInsets.only(top: 10),
                            child: TextField(
                              controller: brandController,
                              decoration: InputDecoration(
                                hintText: 'Type Brand Name...',
                                labelText: 'Enter Brand',
                                //labelStyle: TextStyle(color: header),
                                contentPadding:
                                    EdgeInsets.fromLTRB(10.0, 5.0, 20.0, 5.0),
                                border: InputBorder.none,
                              ),
                            )),
                        Container(
                            margin: EdgeInsets.only(top: 15),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                //color: Colors.grey[100],
                                border:
                                    Border.all(width: 0.2, color: Colors.grey)),
                            child: TextField(
                              controller: modelController,
                              decoration: InputDecoration(
                                hintText: 'Type Model Name...',
                                labelText: 'Enter Model Name',
                                //labelStyle: TextStyle(color: header),
                                contentPadding:
                                    EdgeInsets.fromLTRB(10.0, 5.0, 20.0, 5.0),
                                border: InputBorder.none,
                              ),
                            )),

                        Container(
                            margin: EdgeInsets.only(top: 15),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                //color: Colors.grey[100],
                                border:
                                    Border.all(width: 0.2, color: Colors.grey)),
                            child: TextField(
                              controller: featureController,
                              decoration: InputDecoration(
                                hintText: 'Type Feature...',
                                labelText: 'Enter Product Feature',
                                //labelStyle: TextStyle(color: header),
                                contentPadding:
                                    EdgeInsets.fromLTRB(10.0, 5.0, 20.0, 5.0),
                                border: InputBorder.none,
                              ),
                            )),

                        Container(
                          //height: 80,
                            margin: EdgeInsets.only(top: 15),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                //color: Colors.grey[100],
                                border:
                                    Border.all(width: 0.2, color: Colors.grey)),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(maxHeight: 120.0),
                              child: SingleChildScrollView(
                                child: TextField(
                                  maxLines: null,
                                  controller: descController,
                                  decoration: InputDecoration(
                                    hintText: 'Type Product Description...',
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
                                margin: EdgeInsets.only(top: 10, bottom: 10),
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
                                        margin:
                                            EdgeInsets.only(left: 0, right: 5),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.only(right: 5),
                                              padding: EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5.0)),
                                                  color: (gen == 1 && gen1 == 0)
                                                      ? header
                                                      : Colors.white,
                                                  border: Border.all(
                                                      width: 0.2,
                                                      color: Colors.grey)),
                                              child: Icon(Icons.radio_button_checked,
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
                                        margin:
                                            EdgeInsets.only(left: 20, right: 5),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.only(right: 5),
                                              padding: EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(5.0)),
                                                  color: (gen1 == 1 && gen == 0)
                                                      ? header
                                                      : Colors.white,
                                                  border: Border.all(
                                                      width: 0.2,
                                                      color: Colors.grey)),
                                              child: Icon(Icons.radio_button_checked,
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                //color: Colors.grey[100],
                                border:
                                    Border.all(width: 0.2, color: Colors.grey)),
                            child: TextField(
                              controller: priceController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Type Product Price...',
                                labelText: 'Enter Price',
                                //labelStyle: TextStyle(color: header),
                                contentPadding:
                                    EdgeInsets.fromLTRB(10.0, 5.0, 20.0, 5.0),
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
                            margin: EdgeInsets.only(left: 0, right: 5, top: 10),
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
                                          width: 0.2, color: Colors.grey)),
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
                                        color: Colors.blueAccent, fontSize: 12),
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
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          color: Colors.white,
                          border: Border.all(width: 0.2, color: Colors.grey)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "User Details",
                            style: TextStyle(fontSize: 17, color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 5, right: 5, bottom: 5),
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(top: 5, bottom: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                          //color: Colors.grey[200],
                                          //padding: EdgeInsets.all(20),
                                          child: Text(
                                        "Appifylab",
                                        style: TextStyle(color: Colors.black54),
                                      )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(top: 0, right: 5, bottom: 5),
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 5, bottom: 5),
                                        child: Row(
                                          children: <Widget>[
                                            Icon(Icons.location_on,
                                                color: Colors.grey, size: 16),
                                            Container(
                                                margin:
                                                    EdgeInsets.only(left: 5),
                                                child: Text(
                                                  "Modina Market",
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
                            padding:
                                EdgeInsets.only(top: 0, right: 5, bottom: 5),
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 5, bottom: 5),
                                        child: Row(
                                          children: <Widget>[
                                            Icon(Icons.phone,
                                                color: Colors.grey, size: 16),
                                            Container(
                                                margin:
                                                    EdgeInsets.only(left: 5),
                                                child: Text(
                                                  "017XXXXXXXX",
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
                            padding:
                                EdgeInsets.only(top: 0, right: 5, bottom: 5),
                            width: MediaQuery.of(context).size.width,
                            child: Center(
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        margin:
                                            EdgeInsets.only(top: 5, bottom: 5),
                                        child: Row(
                                          children: <Widget>[
                                            Icon(Icons.email,
                                                color: Colors.grey, size: 16),
                                            Container(
                                                margin:
                                                    EdgeInsets.only(left: 5),
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
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: header,
                        border: Border.all(width: 0.2, color: Colors.grey)),
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
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                },
                child: Container(
                    width: MediaQuery.of(context).size.width / 6,
                    //color: Colors.black,
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.home,
                          color: Colors.grey,
                          size: 30,
                        )
                      ],
                    )),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchPage()),
                  );
                },
                child: Container(
                    width: MediaQuery.of(context).size.width / 6,
                    //color: Colors.black,
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.search,
                          color: Colors.grey,
                          size: 30,
                        )
                      ],
                    )),
              ),
              GestureDetector(
                child: Container(
                    width: MediaQuery.of(context).size.width / 6,
                    //color: Colors.black,
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.search,
                          color: Colors.grey,
                          size: 30,
                        )
                      ],
                    )),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatListPage()),
                  );
                },
                child: Container(
                    width: MediaQuery.of(context).size.width / 6,
                    //color: Colors.black,
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.chat_bubble_outline,
                          color: Colors.grey,
                          size: 30,
                        )
                      ],
                    )),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileOptDialog()),
                  );
                },
                child: Container(
                    width: MediaQuery.of(context).size.width / 6,
                    //color: Colors.black,
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.account_box,
                          color: Colors.grey,
                          size: 30,
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        margin: EdgeInsets.only(top: 35),
        child: new FloatingActionButton(
          backgroundColor: Colors.yellow[800],
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PostAdPage()),
            );
          },
          tooltip: 'Increment',
          child: new Icon(Icons.add),
        ),
      ),
    );
  }

  void locationSearch() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new LocationDialog();
        },
        fullscreenDialog: true));
  }

  void categorySearch() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new CategoryDialog();
        },
        fullscreenDialog: true));
  }
}

class LocationDialog extends StatefulWidget {
  @override
  _LocationDialogState createState() => new _LocationDialogState();
}

class _LocationDialogState extends State<LocationDialog> {
  int _current = 0;
  int _isBack = 0;
  String result = '';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //backgroundColor: Colors.black,
      appBar: new AppBar(
        backgroundColor: header,
        title: const Text('Find Location'),
      ),
      //body: new Text("It's a Dialog!"),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            new Container(
                padding: EdgeInsets.all(0.0),
                //color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Container(
                        //color: Colors.white,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3.0,
                              color: Colors.black.withOpacity(.5),
                              //offset: Offset(6.0, 7.0),
                            ),
                          ],
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.location_on, color: header),
                            Container(
                                margin: EdgeInsets.only(left: 3),
                                child: Text("My current location",
                                    style: TextStyle(
                                        color: Colors.blueAccent,
                                        fontSize: 15))),
                          ],
                        )),
                    Container(
                        height: 3,
                        child: Divider(
                          color: Colors.white,
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(10),
                        color: Colors.grey[200],
                        child: Text(
                          "Select a location",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 17, color: Colors.black87),
                        )),
                    Container(
                        height: 3,
                        child: Divider(
                          color: Colors.grey,
                        )),
                    Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(0.0)),
                          color: Colors.grey[100],
                          border: Border.all(width: 0.2, color: Colors.grey)),
                      child: TextFormField(
                        autofocus: false,
                        decoration: InputDecoration(
                          icon: Container(
                            margin: EdgeInsets.only(left: 10),
                            child: const Icon(
                              Icons.search,
                              color: Colors.black38,
                            ),
                          ),
                          hintText: 'Search a location...',
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
                    Container(height: 2, child: Divider()),
                    Expanded(
                      child: Container(
                        child: ListView(
                          children: <Widget>[
                            ListTile(
                              title: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    'Whole Bangladesh',
                                    style: TextStyle(color: Colors.black54),
                                  )),
                              trailing: Icon(Icons.chevron_right),
                            ),
                            Divider(),
                            ListTile(
                              title: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    'Dhaka',
                                    style: TextStyle(color: Colors.black54),
                                  )),
                            ),
                            Divider(),
                            ListTile(
                              title: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    'Chattogram',
                                    style: TextStyle(color: Colors.black54),
                                  )),
                            ),
                            Divider(),
                            ListTile(
                              title: GestureDetector(
                                onTap: () {
                                  divisionSelect();
                                },
                                child: Container(
                                    padding: EdgeInsets.all(5),
                                    child: Text(
                                      'Sylhet',
                                      style: TextStyle(color: Colors.black54),
                                    )),
                              ),
                            ),
                            Divider(),
                            ListTile(
                              title: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    'Barisal',
                                    style: TextStyle(color: Colors.black54),
                                  )),
                            ),
                            Divider(),
                            ListTile(
                              title: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    'Rajshahi',
                                    style: TextStyle(color: Colors.black54),
                                  )),
                            ),
                            Divider(),
                            ListTile(
                              title: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    'Rangpur',
                                    style: TextStyle(color: Colors.black54),
                                  )),
                            ),
                            Divider(),
                            ListTile(
                              title: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    'Mymenshingh',
                                    style: TextStyle(color: Colors.black54),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }

  void divisionSelect() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Sylhet"),
          content: Container(
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Container(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        'Sylhet Sadar',
                        style: TextStyle(color: Colors.black54),
                      )),
                ),
                Divider(),
                ListTile(
                  title: Container(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        'Moulavibazar',
                        style: TextStyle(color: Colors.black54),
                      )),
                ),
                Divider(),
                ListTile(
                  title: Container(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        'Sunamgonj',
                        style: TextStyle(color: Colors.black54),
                      )),
                ),
                Divider(),
                ListTile(
                  title: Container(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        'Sreemongol',
                        style: TextStyle(color: Colors.black54),
                      )),
                ),
                Divider(),
                ListTile(
                  title: Container(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        'Habigonj',
                        style: TextStyle(color: Colors.black54),
                      )),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text(
                "Close",
                style: TextStyle(color: header),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class CategoryDialog extends StatefulWidget {
  @override
  _CategoryDialogState createState() => new _CategoryDialogState();
}

class _CategoryDialogState extends State<CategoryDialog> {
  int _current = 0;
  int _isBack = 0;
  String result = '';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //backgroundColor: Colors.black,
      appBar: new AppBar(
        backgroundColor: header,
        title: const Text('Find Category'),
      ),
      //body: new Text("It's a Dialog!"),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            new Container(
                padding: EdgeInsets.all(0.0),
                //color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(0.0)),
                          color: Colors.grey[100],
                          border: Border.all(width: 0.2, color: Colors.grey)),
                      child: TextFormField(
                        autofocus: false,
                        decoration: InputDecoration(
                          icon: Container(
                            margin: EdgeInsets.only(left: 10),
                            child: const Icon(
                              Icons.search,
                              color: Colors.black38,
                            ),
                          ),
                          hintText: 'Search a category...',
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
                    Container(height: 2, child: Divider()),
                    Expanded(
                      child: Container(
                        child: ListView(
                          children: <Widget>[
                            ListTile(
                              title: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Text(
                                    'All advertisements',
                                    style: TextStyle(color: Colors.black54),
                                  )),
                              trailing: Icon(Icons.chevron_right),
                            ),
                            Divider(),
                            ListTile(
                              title: GestureDetector(
                                onTap: () {
                                  categorySelect();
                                },
                                child: Container(
                                    child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.phone_android,
                                      color: Colors.black54,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 8),
                                      child: Text(
                                        'Mobile',
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                    ),
                                  ],
                                )),
                              ),
                            ),
                            Divider(),
                            ListTile(
                              title: Container(
                                  child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.lightbulb_outline,
                                    color: Colors.black54,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 8),
                                    child: Text(
                                      'Electronics',
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  ),
                                ],
                              )),
                            ),
                            Divider(),
                            ListTile(
                              title: Container(
                                  child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.train,
                                    color: Colors.black54,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 8),
                                    child: Text(
                                      'Vehicles',
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  ),
                                ],
                              )),
                            ),
                            Divider(),
                            ListTile(
                              title: Container(
                                  child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.location_city,
                                    color: Colors.black54,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 8),
                                    child: Text(
                                      'Property',
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  ),
                                ],
                              )),
                            ),
                            Divider(),
                            ListTile(
                              title: Container(
                                  child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.ac_unit,
                                    color: Colors.black54,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 8),
                                    child: Text(
                                      'Job',
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  ),
                                ],
                              )),
                            ),
                            Divider(),
                            ListTile(
                              title: Container(
                                  child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.stars,
                                    color: Colors.black54,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 8),
                                    child: Text(
                                      'Service',
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  ),
                                ],
                              )),
                            ),
                            Divider(),
                            ListTile(
                              title: Container(
                                  child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.home,
                                    color: Colors.black54,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 8),
                                    child: Text(
                                      'Home and Leading',
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  ),
                                ],
                              )),
                            ),
                            Divider(),
                            ListTile(
                              title: Container(
                                  child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.book,
                                    color: Colors.black54,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 8),
                                    child: Text(
                                      'Education',
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  ),
                                ],
                              )),
                            ),
                            Divider(),
                            ListTile(
                              title: Container(
                                  child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.fastfood,
                                    color: Colors.black54,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 8),
                                    child: Text(
                                      'Food',
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  ),
                                ],
                              )),
                            ),
                            Divider(),
                            ListTile(
                              title: Container(
                                  child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.directions_run,
                                    color: Colors.black54,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 8),
                                    child: Text(
                                      'Sports',
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  ),
                                ],
                              )),
                            ),
                            Divider(),
                            ListTile(
                              title: Container(
                                  child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.watch,
                                    color: Colors.black54,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 8),
                                    child: Text(
                                      'Fashion and Clothing',
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  ),
                                ],
                              )),
                            ),
                            Divider(),
                            ListTile(
                              title: Container(
                                  child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.donut_small,
                                    color: Colors.black54,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 8),
                                    child: Text(
                                      'Health and Beauty',
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  ),
                                ],
                              )),
                            ),
                            Divider(),
                            ListTile(
                              title: Container(
                                  child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.pets,
                                    color: Colors.black54,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 8),
                                    child: Text(
                                      'Animals and Birds',
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                  ),
                                ],
                              )),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }

  void categorySelect() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Mobile"),
          content: Container(
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Container(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        'All advertisements',
                        style: TextStyle(color: Colors.black54),
                      )),
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  title: Container(
                      child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 8),
                        child: Text(
                          'Mobile Phone',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                    ],
                  )),
                ),
                Divider(),
                ListTile(
                  title: Container(
                      child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 8),
                        child: Text(
                          'Accessories',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                    ],
                  )),
                ),
                Divider(),
                ListTile(
                  title: Container(
                      child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 8),
                        child: Text(
                          'SIM Card',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                    ],
                  )),
                ),
                Divider(),
                ListTile(
                  title: Container(
                      child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 8),
                        child: Text(
                          'Service',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                    ],
                  )),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text(
                "Close",
                style: TextStyle(color: header),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
