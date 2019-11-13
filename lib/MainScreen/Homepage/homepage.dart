import 'package:bikroy_app/MainScreen/BottomNavbarPage/ChatListPage/chatlist.dart';
import 'package:bikroy_app/MainScreen/BottomNavbarPage/PostAdPage/post_ad.dart';
import 'package:bikroy_app/MainScreen/BottomNavbarPage/ProductPage/productPage.dart';
import 'package:bikroy_app/MainScreen/BottomNavbarPage/ProfileOptPage/profile_opt.dart';
import 'package:bikroy_app/MainScreen/BottomNavbarPage/SearchPage/searchPage.dart';
import 'package:bikroy_app/main.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool internet = true;
  int currentIndex = selectedPage;
  final pageOptions = [
    ProductPage(),
    SearchPage(),
    PostAdPage(),
    ChatListPage(),
    ProfileOptDialog(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
      body: pageOptions[currentIndex],
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Colors.white,
            primaryColor: header,
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: Colors.grey[500]))),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 20), title: SizedBox.shrink()),
            BottomNavigationBarItem(
                icon: new Stack(children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: new Icon(
                      Icons.search,
                      size: 20,
                    ),
                  ),
                ]),
                title: SizedBox.shrink()),
            BottomNavigationBarItem(
                icon: Container(
                    decoration: BoxDecoration(
                        color: Colors.yellow[800],
                        borderRadius: BorderRadius.circular(25)),
                    padding: EdgeInsets.all(12),
                    child: Icon(Icons.add, size: 20, color: Colors.white)),
                title: SizedBox.shrink()),
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline, size: 20),
                title: SizedBox.shrink()),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle, size: 20),
                title: SizedBox.shrink())
          ],
          onTap: (int _selectedPage) {
            setState(() {
              currentIndex = _selectedPage;
              selectedPage = _selectedPage;
            });
            //print(selectedPage);
          },
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: Container(
      //   margin: EdgeInsets.only(top: 35),
      //   child: new FloatingActionButton(
      //     backgroundColor: Colors.yellow[800],
      //     onPressed: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => PostAdPage()),
      //       );
      //     },
      //     tooltip: 'Increment',
      //     child: new Icon(Icons.add),
      //   ),
      // ),
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
