import 'package:bikroy_app/Cards/ProductLandCard/productLandCard.dart';
import 'package:bikroy_app/Cards/ProductPortraitCard/productPortraitCard.dart';
import 'package:bikroy_app/MainScreen/CategorySearchPage/categorySearchPage.dart';
import 'package:bikroy_app/MainScreen/FilterPage/filterPage.dart';
import 'package:bikroy_app/MainScreen/LocationSearchPage/locationSearchPage.dart';
import 'package:bikroy_app/MainScreen/ProductDetailsPage/details.dart';
import 'package:bikroy_app/main.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';

class ProductPage extends StatefulWidget {
  @override
  ProductPageState createState() => ProductPageState();
}

class ProductPageState extends State<ProductPage> {
  bool internet = true;
  int currentIndex = selectedPage;

  List productList = [
    {
      "image": "assets/pant.jpg",
      "name": "Pant",
      "tag": "",
      "price": 35.5,
      "address": "Pathantula",
      "time": "Just Now",
    },
    {
      "image": "assets/watch.jpeg",
      "name": "Watch",
      "tag": "35% Off",
      "price": 56.5,
      "address": "Akhalia",
      "time": "Just Now",
    },
    {
      "image": "assets/shoe.png",
      "name": "Shoe",
      "tag": "New",
      "price": 43.0,
      "address": "Subidbazar",
      "time": "2 hours ago",
    },
    {
      "image": "assets/s1.jpg",
      "name": "Shirt",
      "tag": "New",
      "price": 40.5,
      "address": "Modina Market",
      "time": "2 days ago",
    },
    {
      "image": "assets/tshirt.png",
      "name": "T-shirt",
      "tag": "",
      "price": 34.0,
      "address": "Bondor Bazar",
      "time": "5 days ago",
    },
    {
      "image": "assets/hoody.jpg",
      "name": "Hoody",
      "tag": "20% Off",
      "price": 40.0,
      "address": "Baghbari",
      "time": "20 days ago",
    },
  ];

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
      body: Container(
        padding: EdgeInsets.only(bottom: 0),
        child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.all(10),
                //color: Colors.white,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ////// <<<<< Location search >>>>> //////
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
                        ////// <<<<< Category search >>>>> //////
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
                        ////// <<<<< Filter products >>>>> //////
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
                ),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        //margin: EdgeInsets.all(5),
                        child: Text("${productList.length} Results",
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
                      child: OrientationBuilder(
                        builder: (context, orientation) {
                          return orientation == Orientation.portrait
                              ////// <<<<< Portrait Card start >>>>> //////
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
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          new Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: ProductPortraitCard(productList[index]),
                                  ),
                                  itemCount: productList.length,
                                )
                              ////// <<<<< Portrait Card end >>>>> //////
                              :
                              ////// <<<<< Landscape Card start >>>>> //////
                              GridView.builder(
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
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          new Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: ProductLandCard(productList[index]),
                                  ),
                                  itemCount: productList.length,
                                );
                          ////// <<<<< Landscape Card end >>>>> //////
                        },
                      ))

                  ////// <<<<< No internet Card start >>>>> //////
                  : Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 1.0,
                            color: Colors.black.withOpacity(.5),
                          ),
                        ],
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
              ////// <<<<< No internet Card end >>>>> //////
            )
          ],
        ),
      ),
    );
  }

  void locationSearch() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return LocationSearchDialog();
        },
        fullscreenDialog: true));
  }

  void categorySearch() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new CategorySearchDialog();
        },
        fullscreenDialog: true));
  }

  void filterPage() {
    Navigator.of(context).push(new MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return new FilterSearchDialog();
        },
        fullscreenDialog: true));
  }
}
