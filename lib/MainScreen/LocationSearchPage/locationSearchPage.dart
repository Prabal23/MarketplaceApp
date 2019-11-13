import 'package:flutter/material.dart';

import '../../main.dart';

class LocationSearchDialog extends StatefulWidget {
  @override
  _LocationDialogState createState() => new _LocationDialogState();
}

class _LocationDialogState extends State<LocationSearchDialog> {
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