import 'package:bikroy_app/Cards/ProductLandCard/productLandCard.dart';
import 'package:bikroy_app/Cards/ProductPortraitCard/productPortraitCard.dart';
import 'package:bikroy_app/MainScreen/ProductDetailsPage/details.dart';
import 'package:bikroy_app/main.dart';
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
                                    child: ProductPortraitCard(index),
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
                                    child: ProductLandCard(index),
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
    );
  }
}
