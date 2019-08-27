import 'package:bikroy_app/my_posts.dart';
import 'package:bikroy_app/post_ad.dart';
import 'package:bikroy_app/profile_view.dart';
import 'package:bikroy_app/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './main.dart';
import 'chatlist.dart';
import 'favourite.dart';
import 'homepage.dart';

class ProfileOptDialog extends StatefulWidget {
  @override
  _ProfileOptDialogState createState() => new _ProfileOptDialogState();
}

class _ProfileOptDialogState extends State<ProfileOptDialog> {
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
                  Text("Account",
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
                            style:
                                TextStyle(fontSize: 13, color: Colors.black38),
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
                Expanded(
                  child: Container(
                    child: ListView(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfileViewPage()),
                            );
                          },
                          child: Container(
                            child: ListTile(
                              title: Container(
                                  child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.account_circle,
                                    color: Colors.black54,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 8),
                                    child: Text(
                                      'My Profile',
                                      style: TextStyle(color: Colors.black54),
                                    ),
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PostPage()),
                            );
                          },
                          child: ListTile(
                            title: Container(
                                child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.bookmark_border,
                                  color: Colors.black54,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 8),
                                  child: Text(
                                    'My Posts',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ),
                              ],
                            )),
                            trailing: Icon(Icons.chevron_right),
                          ),
                        ),
                        Divider(),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FavouritePage()),
                            );
                          },
                          child: ListTile(
                            title: Container(
                                child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.favorite_border,
                                  color: Colors.black54,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 8),
                                  child: Text(
                                    'Favourites',
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ),
                              ],
                            )),
                            trailing: Icon(Icons.chevron_right),
                          ),
                        ),
                        Divider(),
                        GestureDetector(
                          onTap: () {
                            //selection(3);
                          },
                          child: ListTile(
                            title: Container(
                                child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.settings_power,
                                  color: Colors.black54,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 8),
                                  child: Text(
                                    'Logout',
                                    style: TextStyle(color: Colors.black54),
                                  ),
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
                          color: header,
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
