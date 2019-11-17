import 'package:bikroy_app/MainScreen/ProductDetailsPage/details.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class ProductLandCard extends StatefulWidget {
  final index;
  ProductLandCard(this.index);
  @override
  _ProductLandCardState createState() => _ProductLandCardState();
}

class _ProductLandCardState extends State<ProductLandCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailsPage()),
          );
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 0, top: 5, left: 2.5, right: 2.5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                blurRadius: 1.0,
                color: Colors.black.withOpacity(.5),
              ),
            ],
          ),
          child: GridTile(
            child: Container(
              padding: EdgeInsets.only(bottom: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      child: Container(
                    child: Stack(children: <Widget>[
                      ////// <<<<< Picture start >>>>> //////
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          margin: EdgeInsets.only(top: 5),
                          child: Image.asset(
                            widget.index % 2 == 0
                                ? 'assets/tshirt.png'
                                : 'assets/shirt.jpg',
                            height: 110,
                            width: 100,
                          ),
                        ),
                      ),
                      ////// <<<<< Picture end >>>>> //////
                      
                      ////// <<<<< New tag start >>>>> //////
                      Container(
                        margin: EdgeInsets.only(top: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.all(5),
                                color: widget.index % 2 == 0
                                    ? header
                                    : Colors.transparent,
                                child: Text(
                                  widget.index % 2 == 0 ? "New" : "",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                )),
                          ],
                        ),
                      )
                      ////// <<<<< New tag end >>>>> //////
                    ]),
                  )),
                  VerticalDivider(
                    color: Colors.grey[300],
                  ),
                  Expanded(
                    child: Center(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 8, right: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  ////// <<<<< Product name start >>>>> //////
                                  Expanded(
                                    child: Text(
                                        widget.index % 2 == 0
                                            ? "Product Name DB"
                                            : "Product Name from list",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 13,
                                            color: Colors.black87)),
                                  ),
                                  ////// <<<<< Product name end >>>>> //////
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            ////// <<<<< Product price start >>>>> //////
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(top: 0, left: 6),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.attach_money,
                                          color: Colors.black87,
                                          size: 18,
                                        ),
                                        Text(
                                          widget.index % 2 == 0
                                              ? "20.25"
                                              : "100.25",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black87,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ////// <<<<< Product price end >>>>> //////
                            
                            
                            ////// <<<<< Product place start >>>>> //////
                            Container(
                              margin: EdgeInsets.only(top: 8, left: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          right: 8, top: 0, bottom: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Icon(
                                            Icons.location_on,
                                            size: 13,
                                            color: header,
                                          ),
                                          Expanded(
                                            child: Container(
                                              margin: EdgeInsets.only(left: 3),
                                              child: Text(
                                                  widget.index % 2 == 0
                                                      ? "Modina Market Sylhet BD"
                                                      : "Zindabazar Sylhet",
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ////// <<<<< Product price end >>>>> //////
                            
                            ////// <<<<< Time start >>>>> //////
                            Container(
                              margin: EdgeInsets.only(
                                  right: 8, top: 0, bottom: 0, left: 10),
                              child: Row(
                                children: <Widget>[
                                  Icon(
                                    Icons.timer,
                                    size: 13,
                                    color: header,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 3),
                                    child: Text(
                                        widget.index % 2 == 0
                                            ? "Just Now"
                                            : "2 days ago",
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 10)),
                                  ),
                                ],
                              ),
                            ),
                            ////// <<<<< Time end >>>>> //////
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
    );
  }
}
