import 'package:bikroy_app/chatlist.dart';
import 'package:bikroy_app/details.dart';
import 'package:bikroy_app/main.dart';
import 'package:bikroy_app/post_ad.dart';
import 'package:bikroy_app/profile_opt.dart';
import 'package:bikroy_app/search.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool internet = true;
  @override
  void initState() {
    internetCheck();
    super.initState();
  }

  void internetCheck() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      //print("Connected to Mobile Network");
      setState(() {
        internet = true;
      });
    } else if (connectivityResult == ConnectivityResult.wifi) {
      //print("Connected to WiFi");
      setState(() {
        internet = true;
      });
    } else {
      setState(() {
        internet = false;
      });
    }
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
              margin: EdgeInsets.only(top: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(right: 5),
                      width: 25,
                      child: Image.asset(
                        'assets/bikroy.png',
                      )),
                  Text("Market Place",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 0),
        child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(10),
                //color: Colors.white,
                decoration: BoxDecoration(
                  // boxShadow: [
                  //   BoxShadow(
                  //     blurRadius: 10.0,
                  //     color: Colors.black.withOpacity(.5),
                  //     //offset: Offset(6.0, 7.0),
                  //   ),
                  // ],
                  //shape: BoxShape.rectangle,
                  //border: Border.all(),
                  color: Colors.white,
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              locationSearch();
                            },
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.location_on,
                                    color: header,
                                  ),
                                  Text("Location"),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                            height: 20,
                            child: VerticalDivider(
                              color: Colors.grey,
                            )),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              categorySearch();
                            },
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.label_important,
                                    color: header,
                                  ),
                                  Text("Category"),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                            height: 20,
                            margin: EdgeInsets.only(right: 10),
                            child: VerticalDivider(
                              color: Colors.grey,
                            )),
                        GestureDetector(
                          onTap: () {
                            filterPage();
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.filter_list,
                                  color: header,
                                  size: 25,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
            Container(
              height: 1,
              child: Divider(
                color: Colors.grey[400],
              ),
            ),
            Container(
                padding: EdgeInsets.all(10),
                //color: Colors.white,
                decoration: BoxDecoration(
                  color: Colors.white,
                  // boxShadow: [
                  //   BoxShadow(
                  //     blurRadius: 10.0,
                  //     color: Colors.black.withOpacity(.5),
                  //     //offset: Offset(6.0, 7.0),
                  //   ),
                  // ],
                ),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        //margin: EdgeInsets.all(5),
                        child: Text("1903 Results",
                            style: TextStyle(fontSize: 12, color: header)),
                      ),
                    ],
                  ),
                )),
            Container(
              height: 1,
              child: Divider(
                color: Colors.grey[400],
              ),
            ),
            Expanded(
              child: internet
                  ? Container(
                      margin: EdgeInsets.only(
                        left: 0,
                        right: 0,
                      ),
                      color: sub_white,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(left: 5, right: 5),
                      //height: MediaQuery.of(context).size.height,
                      child: OrientationBuilder(
                        builder: (context, orientation) {
                          return orientation == Orientation.portrait
                              ? GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: (MediaQuery.of(context)
                                                .size
                                                .width /
                                            2) /
                                        (MediaQuery.of(context).size.height /
                                            2.5),
                                  ),
                                  //scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          new Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          bottom: 0,
                                          top: 5,
                                          left: 2.5,
                                          right: 2.5),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        //border: Border.all(width: 0.5, color: Colors.grey),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 1.0,
                                            color: Colors.black.withOpacity(.5),
                                            //offset: Offset(6.0, 7.0),
                                          ),
                                        ],
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
                                        child: GridTile(
                                          child: Container(
                                            //width: 100,
                                            padding: EdgeInsets.only(bottom: 0),
                                            child: Column(
                                              children: <Widget>[
                                                Expanded(
                                                  child: Container(
                                                      //height: 150,
                                                      child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: Stack(children: <
                                                        Widget>[
                                                      Center(
                                                        child: Container(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(5.0),
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 5),
                                                          child: Image.asset(
                                                            index % 2 == 0
                                                                ? 'assets/tshirt.png'
                                                                : 'assets/shirt.jpg',
                                                            height: 130,
                                                            width: 120,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            top: 12),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(5),
                                                                color: index %
                                                                            2 ==
                                                                        0
                                                                    ? header
                                                                    : Colors
                                                                        .transparent,
                                                                child: Text(
                                                                  index % 2 == 0
                                                                      ? "New"
                                                                      : "",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          12),
                                                                )),
                                                          ],
                                                        ),
                                                      )
                                                    ]),
                                                  )),
                                                ),
                                                Divider(
                                                  color: Colors.grey[300],
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(left: 8, right: 8),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      Expanded(
                                                        child: Text(
                                                            index % 2 == 0
                                                                ? "Product Name DB"
                                                                : "Product Name from list",
                                                            maxLines: 1,
                                                            overflow: TextOverflow
                                                                .ellipsis,
                                                            style: TextStyle(
                                                                fontSize: 13,
                                                                color: Colors
                                                                    .black87)),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            top: 0, left: 6),
                                                        child: Row(
                                                          children: <Widget>[
                                                            Icon(
                                                              Icons
                                                                  .attach_money,
                                                              color: Colors
                                                                  .black87,
                                                              size: 18,
                                                            ),
                                                            Text(
                                                              index % 2 == 0
                                                                  ? "20.25"
                                                                  : "100.25",
                                                              style: TextStyle(
                                                                  fontSize: 16,
                                                                  color: Colors
                                                                      .black87,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 8, left: 8),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      // Container(
                                                      //   child: Row(
                                                      //     children: <Widget>[
                                                      //       Icon(
                                                      //         Icons.star,
                                                      //         color: golden,
                                                      //         size: 12,
                                                      //       ),
                                                      //       Icon(
                                                      //         Icons.star,
                                                      //         color: golden,
                                                      //         size: 12,
                                                      //       ),
                                                      //       Icon(
                                                      //         Icons.star,
                                                      //         color: golden,
                                                      //         size: 12,
                                                      //       ),
                                                      //       Icon(
                                                      //         Icons.star,
                                                      //         color: golden,
                                                      //         size: 12,
                                                      //       ),
                                                      //       Icon(
                                                      //         Icons.star,
                                                      //         color: golden,
                                                      //         size: 12,
                                                      //       ),
                                                      //     ],
                                                      //   ),
                                                      // ),
                                                      Expanded(
                                                        child: Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  right: 8,
                                                                  top: 0,
                                                                  bottom: 10),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: <Widget>[
                                                              Icon(
                                                                Icons
                                                                    .location_on,
                                                                size: 13,
                                                                color: header,
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              3),
                                                                  child: Text(
                                                                      index % 2 == 0
                                                                          ? "Modina Market Sylhet BD"
                                                                          : "Zindabazar Sylhet",
                                                                      maxLines:
                                                                          1,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              10,
                                                                          color: Colors
                                                                              .grey,
                                                                          fontWeight:
                                                                              FontWeight.bold)),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            right: 8,
                                                            top: 0,
                                                            bottom: 10),
                                                        child: Row(
                                                          children: <Widget>[
                                                            Text(
                                                                index % 2 == 0
                                                                    ? "Just Now"
                                                                    : "2 days ago",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .grey,
                                                                    fontSize:
                                                                        10)),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  itemCount: 20,
                                )
                              : GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: (MediaQuery.of(context)
                                                .size
                                                .width /
                                            2) /
                                        (MediaQuery.of(context).size.height /
                                            2.5),
                                  ),
                                  //scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          new Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          bottom: 0,
                                          top: 5,
                                          left: 2.5,
                                          right: 2.5),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        //border: Border.all(width: 0.5, color: Colors.grey),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 1.0,
                                            color: Colors.black.withOpacity(.5),
                                            //offset: Offset(6.0, 7.0),
                                          ),
                                        ],
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
                                        child: GridTile(
                                          child: Container(
                                            //width: 100,
                                            padding: EdgeInsets.only(bottom: 0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Container(
                                                    //height: 150,
                                                    child: Container(
                                                  child:
                                                      Stack(children: <Widget>[
                                                    Center(
                                                      child: Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5.0),
                                                        margin: EdgeInsets.only(
                                                            top: 5),
                                                        child: Image.asset(
                                                          index % 2 == 0
                                                              ? 'assets/tshirt.png'
                                                              : 'assets/shirt.jpg',
                                                          height: 110,
                                                          width: 100,
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: 12),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: <Widget>[
                                                          Container(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(5),
                                                              color: index %
                                                                          2 ==
                                                                      0
                                                                  ? header
                                                                  : Colors
                                                                      .transparent,
                                                              child: Text(
                                                                index % 2 == 0
                                                                    ? "New"
                                                                    : "",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        12),
                                                              )),
                                                        ],
                                                      ),
                                                    )
                                                  ]),
                                                )),
                                                VerticalDivider(
                                                  color: Colors.grey[300],
                                                ),
                                                Expanded(
                                                  child: Center(
                                                    child: Container(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 8, right: 8),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: <
                                                                  Widget>[
                                                                Expanded(
                                                                  child: Text(
                                                                      index % 2 ==
                                                                              0
                                                                          ? "Product Name DB"
                                                                          : "Product Name from list",
                                                                      maxLines: 1,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              13,
                                                                          color: Colors
                                                                              .black87)),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Container(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: <
                                                                  Widget>[
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          top:
                                                                              0,
                                                                          left:
                                                                              6),
                                                                  child: Row(
                                                                    children: <
                                                                        Widget>[
                                                                      Icon(
                                                                        Icons
                                                                            .attach_money,
                                                                        color: Colors
                                                                            .black87,
                                                                        size:
                                                                            18,
                                                                      ),
                                                                      Text(
                                                                        index % 2 ==
                                                                                0
                                                                            ? "20.25"
                                                                            : "100.25",
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                16,
                                                                            color:
                                                                                Colors.black87,
                                                                            fontWeight: FontWeight.bold),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    top: 8,
                                                                    left: 8),
                                                            child: Row(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: <
                                                                  Widget>[
                                                                // Container(
                                                                //   child: Row(
                                                                //     children: <Widget>[
                                                                //       Icon(
                                                                //         Icons.star,
                                                                //         color: golden,
                                                                //         size: 12,
                                                                //       ),
                                                                //       Icon(
                                                                //         Icons.star,
                                                                //         color: golden,
                                                                //         size: 12,
                                                                //       ),
                                                                //       Icon(
                                                                //         Icons.star,
                                                                //         color: golden,
                                                                //         size: 12,
                                                                //       ),
                                                                //       Icon(
                                                                //         Icons.star,
                                                                //         color: golden,
                                                                //         size: 12,
                                                                //       ),
                                                                //       Icon(
                                                                //         Icons.star,
                                                                //         color: golden,
                                                                //         size: 12,
                                                                //       ),
                                                                //     ],
                                                                //   ),
                                                                // ),
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    margin: EdgeInsets.only(
                                                                        right:
                                                                            8,
                                                                        top: 0,
                                                                        bottom:
                                                                            10),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: <
                                                                          Widget>[
                                                                        Icon(
                                                                          Icons
                                                                              .location_on,
                                                                          size:
                                                                              13,
                                                                          color:
                                                                              header,
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Container(
                                                                            margin:
                                                                                EdgeInsets.only(left: 3),
                                                                            child: Text(index % 2 == 0 ? "Modina Market Sylhet BD" : "Zindabazar Sylhet",
                                                                                maxLines: 1,
                                                                                overflow: TextOverflow.ellipsis,
                                                                                style: TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold)),
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
                                                            //color: Colors.red,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    right: 8,
                                                                    top: 0,
                                                                    bottom: 0,
                                                                    left: 10),
                                                            child: Row(
                                                              children: <
                                                                  Widget>[
                                                                Icon(
                                                                  Icons.timer,
                                                                  size: 13,
                                                                  color: header,
                                                                ),
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          left:
                                                                              3),
                                                                  child: Text(
                                                                      index % 2 ==
                                                                              0
                                                                          ? "Just Now"
                                                                          : "2 days ago",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .grey,
                                                                          fontSize:
                                                                              10)),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  itemCount: 20,
                                );
                        },
                      ))
                  : Container(
                      margin: EdgeInsets.all(10), padding: EdgeInsets.all(10),
                      //color: Colors.white,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1.0,
                            color: Colors.black.withOpacity(.5),
                            //offset: Offset(6.0, 7.0),
                          ),
                        ],
                        //shape: BoxShape.rectangle,
                        //border: Border.all(),
                        color: Colors.white,
                      ),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 180,
                              child: Center(
                                child: Container(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Image.asset(
                                    'assets/no_net.jpg',
                                  ),
                                ),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 10, bottom: 10),
                                child: Text("No Internet Connection!",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black54)))
                          ],
                        ),
                      ),
                    ),
            )
          ],
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
                          color: header,
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

  void filterPage() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new FilterDialog();
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

class FilterDialog extends StatefulWidget {
  @override
  _FilterDialogState createState() => new _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  int _current = 0;
  int _isBack = 0;
  String result = '';

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //backgroundColor: Colors.black,
      appBar: new AppBar(
        backgroundColor: header,
        title: const Text('Filter'),
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
                    Container(height: 2, child: Divider()),
                    Expanded(
                      child: Container(
                        child: ListView(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                selection(1);
                              },
                              child: Container(
                                child: ListTile(
                                  title: Container(
                                      child: Row(
                                    children: <Widget>[
                                      Icon(
                                        Icons.attach_money,
                                        color: Colors.grey,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Container(
                                                margin:
                                                    EdgeInsets.only(left: 8),
                                                child: Text(
                                                  'Price',
                                                  style: TextStyle(
                                                      color: Colors.black54,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                              margin: EdgeInsets.only(
                                                  left: 8, top: 3),
                                              child: Text(
                                                "Find product by range of price",
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontSize: 12),
                                              ))
                                        ],
                                      ),
                                    ],
                                  )),
                                  trailing: Icon(Icons.chevron_right),
                                ),
                              ),
                            ),
                            Divider(),
                            GestureDetector(
                              onTap: () {
                                selection(2);
                              },
                              child: ListTile(
                                title: Container(
                                    child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.calendar_today,
                                      color: Colors.grey,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.only(left: 8),
                                              child: Text(
                                                'Date',
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(
                                                left: 8, top: 3),
                                            child: Text(
                                              "Find product by suitable date",
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 12),
                                            ))
                                      ],
                                    ),
                                  ],
                                )),
                                trailing: Icon(Icons.chevron_right),
                              ),
                            ),
                            Divider(),
                            GestureDetector(
                              onTap: () {
                                selection(3);
                              },
                              child: ListTile(
                                title: Container(
                                    child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.account_circle,
                                      color: Colors.grey,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.only(left: 8),
                                              child: Text(
                                                'User',
                                                style: TextStyle(
                                                    color: Colors.black54,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(left: 8),
                                            child: Text(
                                              "Find product by posts of user",
                                              style: TextStyle(
                                                  color: Colors.black54,
                                                  fontSize: 12),
                                            ))
                                      ],
                                    ),
                                  ],
                                )),
                                trailing: Icon(Icons.chevron_right),
                              ),
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

  void selection(int num) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(num == 1 ? "Price" : num == 2 ? "Date" : "User"),
          content: num == 1
              ? Container(
                  child: ListView(
                    children: <Widget>[
                      ListTile(
                        title: Container(
                            child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 8),
                              child: Text(
                                'Lower to Higher',
                                style: TextStyle(color: Colors.black54),
                              ),
                            ),
                          ],
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
                                'Higher to Lower',
                                style: TextStyle(color: Colors.black54),
                              ),
                            ),
                          ],
                        )),
                        trailing: Icon(Icons.chevron_right),
                      ),
                    ],
                  ),
                )
              : num == 2
                  ? Container(
                      child: ListView(
                        children: <Widget>[
                          ListTile(
                            title: Container(
                                child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 8),
                                  child: Text(
                                    'Old at first',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ),
                              ],
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
                                    'New at first',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ),
                              ],
                            )),
                            trailing: Icon(Icons.chevron_right),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      child: ListView(
                        children: <Widget>[
                          ListTile(
                            title: Container(
                                child: Row(
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(left: 8),
                                  child: Text(
                                    'All User',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ),
                              ],
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
                                    'Only Members',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ),
                              ],
                            )),
                            trailing: Icon(Icons.chevron_right),
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
