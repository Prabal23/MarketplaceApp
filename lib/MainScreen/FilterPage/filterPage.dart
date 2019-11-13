import 'package:flutter/material.dart';

import '../../main.dart';

class FilterSearchDialog extends StatefulWidget {
  @override
  _FilterDialogState createState() => new _FilterDialogState();
}

class _FilterDialogState extends State<FilterSearchDialog> {
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