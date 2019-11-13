import 'dart:ui' as prefix0;

import 'package:bikroy_app/MainScreen/ChatPage/chat_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';

import '../../main.dart';

class DetailsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DetailsPageState();
  }
}

class DetailsPageState extends State<DetailsPage>
    with SingleTickerProviderStateMixin {
  TextEditingController _reviewController = TextEditingController();
  Animation<double> animation;
  AnimationController controller;
  bool _isLoggedIn = false;
  String _debugLabelString = "", review = '', _ratingStatus = '';
  bool _requireConsent = false;
  CarouselSlider carouselSlider;
  int _current = 0, active = 0;
  List imgList = [
    "assets/tshirt.png",
    "assets/shirt.jpg",
    "assets/pant.jpg",
    "assets/shoe.png"
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  void initState() {
    active = _current + 1;
    super.initState();
  }

  int _rating = 0;

  void rate(int rating) {
    //Other actions based on rating such as api calls.
    setState(() {
      _rating = rating;
    });

    if (rating == 1) {
      _ratingStatus = "Poor";
    }
    if (rating == 2) {
      _ratingStatus = "Average";
    }
    if (rating == 3) {
      _ratingStatus = "Good";
    }
    if (rating == 4) {
      _ratingStatus = "Very Good";
    }
    if (rating == 5) {
      _ratingStatus = "Excellent";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: header,
        title: Center(
          child: Container(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Details",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  // Row(
                  //   children: <Widget>[
                  //     Icon(Icons.star_border),
                  //     SizedBox(
                  //       width: 15,
                  //     ),
                  //     Icon(Icons.share)
                  //   ],
                  // )
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                        height: 300,
                        child: Container(
                          margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              color: Colors.white,
                              border:
                                  Border.all(width: 0.2, color: Colors.grey)),
                          child: CarouselSlider(
                            //height: 400.0,
                            initialPage: 0,
                            enlargeCenterPage: true,
                            autoPlay: false,
                            reverse: false,
                            enableInfiniteScroll: true,
                            autoPlayInterval: Duration(seconds: 2),
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 2000),
                            pauseAutoPlayOnTouch: Duration(seconds: 10),
                            scrollDirection: Axis.horizontal,
                            onPageChanged: (index) {
                              setState(() {
                                _current = index;
                              });
                            },
                            items: imgList.map((imgUrl) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: GestureDetector(
                                      onTap: () {
                                        viewImage(_current);
                                      },
                                      child: Image.asset(
                                        imgUrl,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  );
                                },
                              );
                            }).toList(),
                          ),
                        )),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.all(5),
                            color: Colors.black,
                            child: Text(
                              "${_current + 1}/4",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0,
                ),
                // Container(
                //     width: 50,
                //     child: Divider(
                //       color: mainheader,
                //     )),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin:
                      EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 5),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      color: Colors.white,
                      border: Border.all(width: 0.2, color: Colors.grey)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Product Name",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "Seller : ",
                            style:
                                TextStyle(fontSize: 14, color: Colors.black45),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 3),
                            child: Text("Appifylab",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: header,
                                )),
                          ),
                          Icon(
                            Icons.verified_user,
                            size: 16,
                            color: header,
                          ),
                        ],
                      ),
                      // Container(
                      //   margin: EdgeInsets.only(top: 3),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.start,
                      //     children: <Widget>[
                      //       Row(
                      //         children: <Widget>[
                      //           Text(
                      //             "Rating : ",
                      //             style: TextStyle(
                      //                 fontSize: 14, color: Colors.black45),
                      //           ),
                      //           Icon(
                      //             Icons.star,
                      //             color: golden,
                      //             size: 15,
                      //           ),
                      //           Icon(
                      //             Icons.star,
                      //             color: golden,
                      //             size: 15,
                      //           ),
                      //           Icon(
                      //             Icons.star,
                      //             color: golden,
                      //             size: 15,
                      //           ),
                      //           Icon(
                      //             Icons.star,
                      //             color: golden,
                      //             size: 15,
                      //           ),
                      //           Icon(
                      //             Icons.star_half,
                      //             color: golden,
                      //             size: 15,
                      //           ),
                      //         ],
                      //       ),
                      //     ],
                      //   ),
                      // )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left: 20, right: 20, top: 5),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      color: Colors.white,
                      border: Border.all(width: 0.2, color: Colors.grey)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            color: Colors.yellow[600],
                            border: Border.all(width: 0.2, color: Colors.grey)),
                        padding: EdgeInsets.only(
                            top: 10, right: 10, bottom: 10, left: 5),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.attach_money,
                              color: Colors.black,
                              size: 20,
                            ),
                            SizedBox(
                              width: 0,
                            ),
                            Text(
                              "20.25",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 17),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        //padding: EdgeInsets.all(5),
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.grey,
                          size: 25,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 5),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      color: Colors.white,
                      border: Border.all(width: 0.2, color: Colors.grey)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Product Information",
                        style: TextStyle(fontSize: 17, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 0, right: 5),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 5),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                      //color: Colors.grey[200],
                                      //padding: EdgeInsets.all(20),
                                      child: Text(
                                    "Address : ",
                                    style: TextStyle(color: Colors.grey),
                                  )),
                                  Container(
                                      child: Text(
                                    "Sylhet",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(color: Colors.black54),
                                  ))
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5, bottom: 5),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                      //color: Colors.grey[200],
                                      //padding: EdgeInsets.all(20),
                                      child: Text(
                                    "Product Condition : ",
                                    style: TextStyle(color: Colors.grey),
                                  )),
                                  Container(
                                      child: Text(
                                    "Very Good",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(color: Colors.black54),
                                  ))
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5, bottom: 5),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                      //color: Colors.grey[200],
                                      //padding: EdgeInsets.all(20),
                                      child: Text(
                                    "Type : ",
                                    style: TextStyle(color: Colors.grey),
                                  )),
                                  Container(
                                      child: Text(
                                    "Shirt",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(color: Colors.black54),
                                  ))
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5, bottom: 5),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                      //color: Colors.grey[200],
                                      //padding: EdgeInsets.all(20),
                                      child: Text(
                                    "Category : ",
                                    style: TextStyle(color: Colors.grey),
                                  )),
                                  Container(
                                      child: Text(
                                    "Clothing",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(color: Colors.black54),
                                  ))
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5, bottom: 5),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                      //color: Colors.grey[200],
                                      //padding: EdgeInsets.all(20),
                                      child: Text(
                                    "Posted : ",
                                    style: TextStyle(color: Colors.grey),
                                  )),
                                  Container(
                                      child: Text(
                                    "Just Now",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(color: Colors.black54),
                                  ))
                                ],
                              ),
                            ),
                          ],
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
                        "Product Description",
                        style: TextStyle(fontSize: 17, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Terms and Conditions agreements act as a legal contract between you (the company) who has the website or mobile app and the user who access your website and mobile app.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 15, color: Colors.black45),
                      ),
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
                        "Product Features",
                        style: TextStyle(fontSize: 17, color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "1. Durable with 2 years of guarantee.\n2. Safe, versatile and easy to use\n3. Easy storage and portable.\n4. 100% satisfaction guaranteed.",
                        textAlign: TextAlign.justify,
                        style: TextStyle(fontSize: 15, color: Colors.black45),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin:
                      EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 10),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      color: Colors.white,
                      border: Border.all(width: 0.2, color: Colors.grey)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                                margin: EdgeInsets.only(right: 0),
                                //padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.trending_up,
                                        size: 15, color: Colors.black54),
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text(
                                        "Promote",
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          Container(
                              height: 20,
                              child: VerticalDivider(
                                color: Colors.black54,
                              )),
                          Expanded(
                            child: Container(
                                margin: EdgeInsets.only(left: 0),
                                //padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.report,
                                        size: 15, color: Colors.black54),
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text(
                                        "Report",
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          Container(
                              height: 20,
                              child: VerticalDivider(
                                color: Colors.black54,
                              )),
                          Expanded(
                            child: Container(
                                margin: EdgeInsets.only(left: 0),
                                //padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.share,
                                        size: 15, color: Colors.black54),
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text(
                                        "Share",
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                )),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin:
                      EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      color: Colors.white,
                      border: Border.all(width: 0.2, color: Colors.grey)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 15, top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Related Products",
                              style:
                                  TextStyle(fontSize: 17, color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                            Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Text(
                                  "20 Products",
                                  style: TextStyle(
                                      color: Colors.blueAccent, fontSize: 11),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 0, right: 0),
                              //color: sub_white,
                              width: MediaQuery.of(context).size.width / 1,
                              //padding: EdgeInsets.only(left: 10),
                              height: 240,
                              child: new ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context,
                                        int index) =>
                                    new Container(
                                      //color: Colors.white,
                                      margin:
                                          EdgeInsets.only(left: 15, bottom: 15),
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        color: Colors.white,
                                        border: Border.all(
                                            width: 0.3, color: Colors.grey),
                                        // boxShadow: [
                                        //   BoxShadow(
                                        //     blurRadius: 0.5,
                                        //     color: Colors.black.withOpacity(.5),
                                        //     //offset: Offset(6.0, 7.0),
                                        //   ),
                                        // ],
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailsPage()),
                                          );
                                        },
                                        child: Container(
                                          //padding: EdgeInsets.only(left: 20),
                                          width: 100,
                                          child: Column(
                                            children: <Widget>[
                                              Container(
                                                  height: 100,
                                                  child: Image.asset(
                                                      'assets/shirt.jpg')),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "Product Name",
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black54),
                                                textAlign: TextAlign.center,
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Row(
                                                      children: <Widget>[
                                                        Icon(
                                                          Icons.attach_money,
                                                          color: Colors.black87,
                                                          size: 17,
                                                        ),
                                                        Text(
                                                          "20.25",
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color: Colors
                                                                  .black87,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Row(
                                                      children: <Widget>[
                                                        Icon(
                                                          Icons.location_on,
                                                          color: Colors.black45,
                                                          size: 14,
                                                        ),
                                                        Text(
                                                          "Sylhet",
                                                          style: TextStyle(
                                                              fontSize: 13,
                                                              color: Colors
                                                                  .black45),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    EdgeInsets.only(top: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(
                                                      "23/07/19  12 PM",
                                                      style: TextStyle(
                                                          fontSize: 11,
                                                          color: Colors.grey),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                itemCount: 20,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin:
                      EdgeInsets.only(top: 5, left: 20, right: 20, bottom: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      color: Colors.white,
                      border: Border.all(width: 0.2, color: Colors.grey)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                                margin: EdgeInsets.only(right: 5),
                                //padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.chevron_left,
                                        size: 22, color: header),
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text(
                                        "Previous",
                                        style: TextStyle(
                                            color: header,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          Container(
                              height: 20,
                              child: VerticalDivider(
                                color: Colors.black54,
                              )),
                          Expanded(
                            child: Container(
                                margin: EdgeInsets.only(left: 5),
                                //padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(left: 5),
                                      child: Text("Next",
                                          style: TextStyle(
                                              color: header,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Icon(Icons.chevron_right,
                                        size: 22, color: header),
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    callUser();
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: header,
                        border: Border.all(width: 0.2, color: Colors.grey)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.phone,
                          size: 20,
                          color: Colors.white,
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text("Call",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17)))
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatPage()),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 10, right: 20),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        color: header,
                        border: Border.all(width: 0.2, color: Colors.grey)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.chat_bubble,
                          size: 20,
                          color: Colors.white,
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text("Chat",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17)))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void bottomSheetMenu() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.music_note),
                    title: new Text('Music'),
                    onTap: () => {}),
                new ListTile(
                  leading: new Icon(Icons.videocam),
                  title: new Text('Video'),
                  onTap: () => {},
                ),
              ],
            ),
          );
        });
  }

  void viewImage(int index) {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new SomeDialog(id: index);
        },
        fullscreenDialog: true));
  }

  goToPrevious() {
    carouselSlider.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  goToNext() {
    carouselSlider.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  }

  void callUser() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: Center(
            child: Stack(children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                    padding: EdgeInsets.all(1.0),
                    child: CircleAvatar(
                      radius: 20.0,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/user.png'),
                    ),
                    decoration: new BoxDecoration(
                      color: Colors.grey, // border color
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      //padding: EdgeInsets.all(10),
                      child: Text(
                        "Appifylab",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: header,
                          fontSize: 18,
                        ),
                      )),
                  Divider(),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(top: 10),
                            //padding: EdgeInsets.all(10),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.phone,
                                  color: Colors.black54,
                                  size: 17,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "017XXXXXXXX",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(left: 10, right: 20, top: 20),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          color: header,
                          border: Border.all(width: 0.2, color: Colors.grey)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Text("Call",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14)))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                        //padding: EdgeInsets.all(5),
                        child: Icon(
                      Icons.cancel,
                      color: Colors.grey[400],
                    )),
                  ),
                ],
              )
            ]),
          ),
          // content: Container(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: <Widget>[
          //       Container(
          //           //padding: EdgeInsets.all(10),
          //           child: Row(
          //             children: <Widget>[
          //               Icon(Icons.phone, color: Colors.black54),
          //               SizedBox(width: 5,),
          //               Text(
          //                 "017XXXXXXXX",
          //                 style: TextStyle(
          //                     color: Colors.black54),
          //               ),
          //             ],
          //           )),
          //     ],
          //   ),
          // ),
          // actions: <Widget>[
          //   // usually buttons at the bottom of the dialog
          //   // new FlatButton(
          //   //   child: new Text("Close"),
          //   //   onPressed: () {
          //   //     Navigator.of(context).pop();
          //   //   },
          //   // ),
          //   Center(
          //     child: Container(
          //           margin: EdgeInsets.only(left: 10, right: 20),
          //           padding: EdgeInsets.all(10),
          //           decoration: BoxDecoration(
          //               borderRadius: BorderRadius.all(Radius.circular(5.0)),
          //               color: header,
          //               border: Border.all(width: 0.2, color: Colors.grey)),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: <Widget>[
          //               Container(
          //                   margin: EdgeInsets.only(left: 5),
          //                   child: Text("Call",
          //                       style:
          //                           TextStyle(color: Colors.white, fontSize: 13)))
          //             ],
          //           ),
          //         ),
          //   ),
          // ],
        );
      },
    );
  }
}

class SomeDialog extends StatefulWidget {
  final int id;

  SomeDialog({Key key, @required this.id}) : super(key: key);
  @override
  _SomeDialogPageState createState() => new _SomeDialogPageState();
}

class _SomeDialogPageState extends State<SomeDialog> {
  int _current = 0;
  int _isBack = 0;
  List imgList = [
    "assets/tshirt.png",
    "assets/shirt.jpg",
    "assets/pant.jpg",
    "assets/shoe.png"
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      // appBar: new AppBar(
      //     //title: const Text('Dialog Magic'),
      //     ),
      //body: new Text("It's a Dialog!"),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                setState(() {
                  _isBack++;
                });
              },
              child: Center(
                child: new Container(
                  padding: EdgeInsets.all(0.0),
                  color: Colors.black,
                  child: CarouselSlider(
                    height: 450.0,
                    initialPage: widget.id,
                    enlargeCenterPage: true,
                    autoPlay: false,
                    reverse: false,
                    enableInfiniteScroll: true,
                    autoPlayInterval: Duration(seconds: 2),
                    autoPlayAnimationDuration: Duration(milliseconds: 2000),
                    pauseAutoPlayOnTouch: Duration(seconds: 10),
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index) {
                      setState(() {
                        _current = index;
                      });
                    },
                    items: imgList.map((imgUrl) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Image.asset(
                              imgUrl,
                              fit: BoxFit.contain,
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: _isBack % 2 == 0
                  ? Row(
                      children: <Widget>[
                        BackButton(
                          color: Colors.white,
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text("Product name",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17))),
                      ],
                    )
                  : Container(),
            )
          ],
        ),
      ),
    );
  }
}
