import 'package:bikroy_app/my_posts.dart';
import 'package:bikroy_app/post_ad.dart';
import 'package:bikroy_app/profile_opt.dart';
import 'package:bikroy_app/profile_view.dart';
import 'package:bikroy_app/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './main.dart';
import 'chat_page.dart';
import 'favourite.dart';
import 'homepage.dart';

class ChatListPage extends StatefulWidget {
  @override
  _ChatListPageState createState() => new _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  int _current = 0;
  int _isBack = 0;
  String result = '';

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
                  Text("Chat List",
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: new Container(
            padding: EdgeInsets.all(0.0),
            //color: Colors.white,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: ListView(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatPage()),
                            );
                          },
                          child: Container(
                            child: ListTile(
                              title: Container(
                                margin:
                                    EdgeInsets.only(left: 0, right: 0, top: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                      padding: EdgeInsets.all(1.0),
                                      child: CircleAvatar(
                                        radius: 25.0,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage:
                                            AssetImage('assets/user.png'),
                                      ),
                                      decoration: new BoxDecoration(
                                        color: Colors.grey, // border color
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Container(
                                        //margin: EdgeInsets.only(top: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.only(top: 0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          right: 15),
                                                      child: Text(
                                                        "Sadek Hossain",
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontSize: 16),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    "24/07/19",
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        color: Colors.black54),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 4),
                                              child: Text(
                                                "lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 5),
                                              child: Row(
                                                children: <Widget>[
                                                  // Text(
                                                  //   "Product : ",
                                                  //   style: TextStyle(
                                                  //       fontSize: 12,
                                                  //       color: Colors.black38),
                                                  // ),
                                                  Icon(
                                                    Icons.shopping_basket,
                                                    color: header,
                                                    size: 16,
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 4),
                                                    child: Text(
                                                      "T-shirt",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color:
                                                              Colors.black54),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // trailing: Text(
                              //             "24/07/19",
                              //             style: TextStyle(
                              //                 fontSize: 11,
                              //                 color: Colors.black38),
                              //           ),
                            ),
                          ),
                        ),
                        Container(height: 15, child: Divider()),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatPage()),
                            );
                          },
                          child: Container(
                            child: ListTile(
                              title: Container(
                                margin:
                                    EdgeInsets.only(left: 0, right: 0, top: 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                      padding: EdgeInsets.all(1.0),
                                      child: CircleAvatar(
                                        radius: 25.0,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage:
                                            AssetImage('assets/user.png'),
                                      ),
                                      decoration: new BoxDecoration(
                                        color: Colors.grey, // border color
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Container(
                                        //margin: EdgeInsets.only(top: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.only(top: 0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          right: 15),
                                                      child: Text(
                                                        "Pranto Protim Roy",
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontSize: 16),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    "24/07/19",
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        color: Colors.black54),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 4),
                                              child: Text(
                                                "lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 5),
                                              child: Row(
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.shopping_basket,
                                                    color: header,
                                                    size: 16,
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 4),
                                                    child: Text(
                                                      "Shoe",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color:
                                                              Colors.black54),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // trailing: Text(
                              //             "24/07/19",
                              //             style: TextStyle(
                              //                 fontSize: 11,
                              //                 color: Colors.black38),
                              //           ),
                            ),
                          ),
                        ),
                        Container(height: 15, child: Divider()),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatPage()),
                            );
                          },
                          child: Container(
                            child: ListTile(
                              title: Container(
                                margin:
                                    EdgeInsets.only(left: 0, right: 0, top: 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                      padding: EdgeInsets.all(1.0),
                                      child: CircleAvatar(
                                        radius: 25.0,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage:
                                            AssetImage('assets/user.png'),
                                      ),
                                      decoration: new BoxDecoration(
                                        color: Colors.grey, // border color
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Container(
                                        //margin: EdgeInsets.only(top: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.only(top: 0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          right: 15),
                                                      child: Text(
                                                        "Bijoya Banik",
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontSize: 16),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    "24/07/19",
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        color: Colors.black54),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 4),
                                              child: Text(
                                                "lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 5),
                                              child: Row(
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.shopping_basket,
                                                    color: header,
                                                    size: 16,
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 4),
                                                    child: Text(
                                                      "Dress",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color:
                                                              Colors.black54),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // trailing: Text(
                              //             "24/07/19",
                              //             style: TextStyle(
                              //                 fontSize: 11,
                              //                 color: Colors.black38),
                              //           ),
                            ),
                          ),
                        ),
                        Container(height: 15, child: Divider()),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatPage()),
                            );
                          },
                          child: Container(
                            child: ListTile(
                              title: Container(
                                margin:
                                    EdgeInsets.only(left: 0, right: 0, top: 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                      padding: EdgeInsets.all(1.0),
                                      child: CircleAvatar(
                                        radius: 25.0,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage:
                                            AssetImage('assets/user.png'),
                                      ),
                                      decoration: new BoxDecoration(
                                        color: Colors.grey, // border color
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Container(
                                        //margin: EdgeInsets.only(top: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.only(top: 0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          right: 15),
                                                      child: Text(
                                                        "Humayun Rahi",
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontSize: 16),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    "24/07/19",
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        color: Colors.black54),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 4),
                                              child: Text(
                                                "lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 5),
                                              child: Row(
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.shopping_basket,
                                                    color: header,
                                                    size: 16,
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 4),
                                                    child: Text(
                                                      "Shirt",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color:
                                                              Colors.black54),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // trailing: Text(
                              //             "24/07/19",
                              //             style: TextStyle(
                              //                 fontSize: 11,
                              //                 color: Colors.black38),
                              //           ),
                            ),
                          ),
                        ),
                        Container(height: 15, child: Divider()),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChatPage()),
                            );
                          },
                          child: Container(
                            child: ListTile(
                              title: Container(
                                margin:
                                    EdgeInsets.only(left: 0, right: 0, top: 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                                      padding: EdgeInsets.all(1.0),
                                      child: CircleAvatar(
                                        radius: 25.0,
                                        backgroundColor: Colors.transparent,
                                        backgroundImage:
                                            AssetImage('assets/user.png'),
                                      ),
                                      decoration: new BoxDecoration(
                                        color: Colors.grey, // border color
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Container(
                                        //margin: EdgeInsets.only(top: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.only(top: 0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Expanded(
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          right: 15),
                                                      child: Text(
                                                        "Hachibur Rahman",
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                            fontSize: 16),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    "24/07/19",
                                                    style: TextStyle(
                                                        fontSize: 11,
                                                        color: Colors.black54),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 4),
                                              child: Text(
                                                "lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor lorem ipsum dolor",
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey),
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 5),
                                              child: Row(
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.shopping_basket,
                                                    color: header,
                                                    size: 16,
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 4),
                                                    child: Text(
                                                      "Pant",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color:
                                                              Colors.black54),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // trailing: Text(
                              //             "24/07/19",
                              //             style: TextStyle(
                              //                 fontSize: 11,
                              //                 color: Colors.black38),
                              //           ),
                            ),
                          ),
                        ),
                        Container(height: 15, child: Divider()),
                      ],
                    ),
                  ),
                )
              ],
            )),
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
}
