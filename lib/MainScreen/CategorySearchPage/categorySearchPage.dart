import 'package:flutter/material.dart';

import '../../main.dart';

class CategorySearchDialog extends StatefulWidget {
  @override
  _CategoryDialogState createState() => new _CategoryDialogState();
}

class _CategoryDialogState extends State<CategorySearchDialog> {
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