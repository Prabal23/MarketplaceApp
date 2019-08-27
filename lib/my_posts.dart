import 'package:bikroy_app/details.dart';
import 'package:bikroy_app/main.dart';
import 'package:bikroy_app/profile_opt.dart';
import 'package:bikroy_app/search.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

class PostPage extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
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
        backgroundColor: header,
        title: Center(
          child: Container(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("My Posts",
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
                      child: new GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio:
                              (MediaQuery.of(context).size.width / 2) /
                                  (MediaQuery.of(context).size.height / 2.5),
                        ),
                        //scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) =>
                            new Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                margin: EdgeInsets.only(
                                    bottom: 0, top: 5, left: 2.5, right: 2.5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
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
                                          builder: (context) => DetailsPage()),
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
                                                //height: 145,
                                                child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              child: Stack(children: <Widget>[
                                                Center(
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    margin:
                                                        EdgeInsets.only(top: 5),
                                                    child: Image.asset(
                                                      'assets/shirt.jpg',
                                                      width: 130,
                                                      height: 120,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 12),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: <Widget>[
                                                      Container(
                                                          padding:
                                                              EdgeInsets.all(5),
                                                          color: Colors
                                                              .transparent,
                                                          child: Text(
                                                            "",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12),
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
                                            margin: EdgeInsets.only(left: 8),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                    index % 2 == 0
                                                        ? "Product Name DB"
                                                        : "Product Name from list",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        color: Colors.black87)),
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
                                                        Icons.attach_money,
                                                        color: Colors.black87,
                                                        size: 18,
                                                      ),
                                                      Text(
                                                        index % 2 == 0
                                                            ? "20.25"
                                                            : "100.25",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color:
                                                                Colors.black87,
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
                                                  CrossAxisAlignment.center,
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
                                                    margin: EdgeInsets.only(
                                                        right: 8, top: 0, bottom: 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        Icon(
                                                          Icons.location_on,
                                                          size: 13,
                                                          color: header,
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 3),
                                                            child: Text(
                                                                index % 2 == 0
                                                                    ? "Modina Market Sylhet BD"
                                                                    : "Zindabazar Sylhet",
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10,
                                                                    color: Colors
                                                                        .grey,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      right: 8, top: 0, bottom: 10),
                                                  child: Row(
                                                    children: <Widget>[
                                                      Text(
                                                          index % 2 == 0
                                                              ? "Just Now"
                                                              : "2 days ago",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 10)),
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
                      ),
                    )
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
    );
  }
}
