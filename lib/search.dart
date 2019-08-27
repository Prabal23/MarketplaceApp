import 'dart:ui' as prefix0;

import 'package:bikroy_app/homepage.dart';
import 'package:bikroy_app/post_ad.dart';
import 'package:bikroy_app/profile_opt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import './main.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'chatlist.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SearchPageState();
  }
}

class SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  TextEditingController _reviewController = TextEditingController();
  Animation<double> animation;
  AnimationController controller;
  bool _isLoggedIn = false;
  String _debugLabelString = "", review = '', _ratingStatus = '', result = '';
  bool _requireConsent = false;
  CarouselSlider carouselSlider;
  int _current = 0, active = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: header,
        title: Center(
          child: Container(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Search",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: sub_white,
          //height: MediaQuery.of(context).size.height,
          child: Container(
              color: Colors.white,
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
                        hintText: 'Search a location...',
                        //labelText: 'Enter E-mail',
                        contentPadding:
                            EdgeInsets.fromLTRB(0.0, 5.0, 20.0, 5.0),
                        border: InputBorder.none,
                      ),
                      validator: (val) => val.isEmpty ? 'Field is empty' : null,
                      onSaved: (val) => result = val,
                      //validator: _validateEmail,
                    ),
                  ),
                  Container(
                      height: 3,
                      child: Divider(
                        color: Colors.grey,
                      )),
                  Container(
                      //color: Colors.white,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(Icons.location_on, color: header),
                              Container(
                                  margin: EdgeInsets.only(left: 3),
                                  child: Text("Whole Bangladesh",
                                      style: TextStyle(
                                          color: Colors.black87,
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
                                      color: Colors.blueAccent, fontSize: 13)),
                            ),
                          ),
                        ],
                      )),
                  Container(
                      height: 3,
                      child: Divider(
                        color: Colors.grey,
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10),
                      color: Colors.grey[200],
                      child: Text(
                        "Select a category",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 17, color: Colors.black87),
                      )),
                  Container(
                      height: 3,
                      child: Divider(
                        color: Colors.grey,
                      )),
                  Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  categorySelect();
                                },
                                child: Container(
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(0)),
                                    //border: Border.all(width: 0.5, color: Colors.grey),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.phone_android,
                                        color: Colors.grey,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 8),
                                        child: Text(
                                          'Mobile',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 13),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                  height: 50,
                                  child: VerticalDivider(
                                    color: Colors.grey,
                                  )),
                              Container(
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0)),
                                  //border: Border.all(width: 0.5, color: Colors.grey),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.lightbulb_outline,
                                      color: Colors.grey,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 8),
                                      child: Text(
                                        'Electronics',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 13),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  height: 50,
                                  child: VerticalDivider(
                                    color: Colors.grey,
                                  )),
                              Container(
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0)),
                                  //border: Border.all(width: 0.5, color: Colors.grey),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.train,
                                      color: Colors.grey,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 8),
                                      child: Text(
                                        'Vehicles',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 13),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            child: Divider(
                              color: Colors.grey,
                            )),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0)),
                                  //border: Border.all(width: 0.5, color: Colors.grey),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.location_city,
                                      color: Colors.grey,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 8),
                                      child: Text(
                                        'Property',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 13),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  height: 50,
                                  child: VerticalDivider(
                                    color: Colors.grey,
                                  )),
                              Container(
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0)),
                                  //border: Border.all(width: 0.5, color: Colors.grey),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.ac_unit,
                                      color: Colors.grey,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 8),
                                      child: Text(
                                        'Job',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 13),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  height: 50,
                                  child: VerticalDivider(
                                    color: Colors.grey,
                                  )),
                              Container(
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0)),
                                  //border: Border.all(width: 0.5, color: Colors.grey),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.stars,
                                      color: Colors.grey,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 8),
                                      child: Text(
                                        'Service',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 13),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            child: Divider(
                              color: Colors.grey,
                            )),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0)),
                                  //border: Border.all(width: 0.5, color: Colors.grey),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.home,
                                      color: Colors.grey,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 8),
                                      child: Text(
                                        'Home and Leading',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 13),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  height: 50,
                                  child: VerticalDivider(
                                    color: Colors.grey,
                                  )),
                              Container(
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0)),
                                  //border: Border.all(width: 0.5, color: Colors.grey),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.book,
                                      color: Colors.grey,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 8),
                                      child: Text(
                                        'Education\n',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 13),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  height: 50,
                                  child: VerticalDivider(
                                    color: Colors.grey,
                                  )),
                              Container(
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0)),
                                  //border: Border.all(width: 0.5, color: Colors.grey),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.fastfood,
                                      color: Colors.grey,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 8),
                                      child: Text(
                                        'Food\n',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 13),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            child: Divider(
                              color: Colors.grey,
                            )),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0)),
                                  //border: Border.all(width: 0.5, color: Colors.grey),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.directions_run,
                                      color: Colors.grey,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 8),
                                      child: Text(
                                        'Sports\n',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 13),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  height: 50,
                                  child: VerticalDivider(
                                    color: Colors.grey,
                                  )),
                              Container(
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0)),
                                  //border: Border.all(width: 0.5, color: Colors.grey),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.watch,
                                      color: Colors.grey,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 8),
                                      child: Text(
                                        'Fashion and Cloth',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 13),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  height: 50,
                                  child: VerticalDivider(
                                    color: Colors.grey,
                                  )),
                              Container(
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0)),
                                  //border: Border.all(width: 0.5, color: Colors.grey),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.donut_small,
                                      color: Colors.grey,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 8),
                                      child: Text(
                                        'Health and Beauty',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 13),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            child: Divider(
                              color: Colors.grey,
                            )),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0)),
                                  //border: Border.all(width: 0.5, color: Colors.grey),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.pets,
                                      color: Colors.grey,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 8),
                                      child: Text(
                                        'Animals and Birds',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 13),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  height: 50,
                                  child: VerticalDivider(
                                    color: Colors.grey,
                                  )),
                              Container(
                                width: 70,
                              ),
                              Container(
                                  height: 20,
                                  child: VerticalDivider(
                                    color: Colors.white,
                                  )),
                              Container(
                                width: 70,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
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
                          color: header,
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
