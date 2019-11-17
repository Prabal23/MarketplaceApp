import 'package:bikroy_app/MainScreen/ProductDetailsPage/details.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class ProductPortraitCard extends StatefulWidget {
  final index;
  ProductPortraitCard(this.index);
  @override
  _ProductPortraitCardState createState() => _ProductPortraitCardState();
}

class _ProductPortraitCardState extends State<ProductPortraitCard> {
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
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Container(
                        child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Stack(children: <Widget>[
                        ////// <<<<< Pic start >>>>> //////
                        Center(
                          child: Container(
                            padding: const EdgeInsets.all(5.0),
                            margin: EdgeInsets.only(top: 5),
                            child: Image.asset(
                              widget.index % 2 == 0
                                  ? 'assets/tshirt.png'
                                  : 'assets/shirt.jpg',
                              height: 130,
                              width: 120,
                            ),
                          ),
                        ),
                        ////// <<<<< Pic end >>>>> //////
                        
                        ////// <<<<< New tag start >>>>> //////
                        Container(
                          margin: EdgeInsets.only(top: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
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
                  ),
                  Divider(
                    color: Colors.grey[300],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 8, right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        ////// <<<<< Name start >>>>> //////
                        Expanded(
                          child: Text(
                              widget.index % 2 == 0
                                  ? "Product Name DB"
                                  : "Product Name from list",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 13, color: Colors.black87)),
                        ),
                        ////// <<<<< Name end >>>>> //////
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ////// <<<<< Price start >>>>> //////
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
                                widget.index % 2 == 0 ? "20.25" : "100.25",
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
                  ////// <<<<< Price end >>>>> //////
                  Container(
                    margin: EdgeInsets.only(top: 8, left: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ////// <<<<< Place start >>>>> //////
                        Expanded(
                          child: Container(
                            margin:
                                EdgeInsets.only(right: 8, top: 0, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ////// <<<<< Place end >>>>> //////
                        
                        ////// <<<<< Time start >>>>> //////
                        Container(
                          margin: EdgeInsets.only(right: 8, top: 0, bottom: 10),
                          child: Row(
                            children: <Widget>[
                              Text(
                                  widget.index % 2 == 0
                                      ? "Just Now"
                                      : "2 days ago",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 10)),
                            ],
                          ),
                        ),
                        ////// <<<<< Time end >>>>> //////
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
