import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../main.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => new _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  int _current = 0;
  int _isBack = 0;
  String result = '', msg = '';
  TextEditingController msgController = new TextEditingController();
  //ScrollController _scrollController = new ScrollController();
  List<String> messages = [];

  @override
  void initState() {
    // _scrollController.animateTo(
    //   0.0,
    //   curve: Curves.easeOut,
    //   duration: const Duration(milliseconds: 300),
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: header,
        title: Center(
          child: Container(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("User Name",
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
            //color: Colors.grey[100],
            color: chat_back,
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(10),
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      // Container(
                      //   //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                      //   padding: EdgeInsets.all(1.0),
                      //   child: CircleAvatar(
                      //     radius: 25.0,
                      //     backgroundColor: Colors.transparent,
                      //     backgroundImage: AssetImage('assets/user.png'),
                      //   ),
                      //   decoration: new BoxDecoration(
                      //     color: Colors.grey, // border color
                      //     shape: BoxShape.circle,
                      //   ),
                      // ),
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        margin: EdgeInsets.only(top: 5),
                        decoration: new BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          border: Border.all(width: 0.5, color: Colors.grey),
                        ),
                        child: Image.asset(
                          'assets/shirt.jpg',
                          width: 40,
                          height: 30,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 3),
                                child: Text(
                                  "Product Name",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 3),
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.location_on,
                                        size: 15, color: header),
                                    Container(
                                      margin: EdgeInsets.only(left: 3),
                                      child: Text(
                                        "Modina Market",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey),
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
                Container(
                  height: 2,
                  child: Divider(
                    color: Colors.black38,
                  ),
                ),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                        //controller: _scrollController,
                        itemCount: messages.length,
                        //reverse: true,
                        itemBuilder: (BuildContext context, int index) =>
                            index % 2 == 0
                                ? Container(
                                    child: ListTile(
                                      title: Container(
                                        margin: EdgeInsets.only(
                                            left: 0, right: 0, top: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Expanded(
                                              child: Container(
                                                //margin: EdgeInsets.only(top: 5),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: <Widget>[
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      margin: EdgeInsets.only(
                                                          top: 4, left: 70),
                                                      decoration:
                                                          new BoxDecoration(
                                                        //color: header,
                                                        color: my_chat,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5)),
                                                        border: Border.all(
                                                            width: 0.2,
                                                            color: Colors.grey),
                                                      ),
                                                      //color: Colors.white,
                                                      child: Text(
                                                        "${messages[index]}",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: 5),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: <Widget>[
                                                          Text(
                                                            "24/07/19",
                                                            style: TextStyle(
                                                                fontSize: 11,
                                                                color: Colors
                                                                    .grey),
                                                          ),
                                                          Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      left: 3),
                                                              child: messages
                                                                          .length ==
                                                                      index + 1
                                                                  ? Icon(
                                                                      Icons
                                                                          .done,
                                                                      size: 15,
                                                                      color: Colors
                                                                          .grey,
                                                                    )
                                                                  : Icon(
                                                                      Icons
                                                                          .done_all,
                                                                      size: 15,
                                                                      color: Colors
                                                                          .blueAccent,
                                                                    ))
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
                                    ),
                                  )
                                : Container(
                                    child: ListTile(
                                      title: Container(
                                        margin: EdgeInsets.only(
                                            left: 0, right: 0, top: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Expanded(
                                              child: Container(
                                                //margin: EdgeInsets.only(top: 5),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(10),
                                                      margin: EdgeInsets.only(
                                                          top: 4, right: 70),
                                                      decoration:
                                                          new BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    5)),
                                                        border: Border.all(
                                                            width: 0.2,
                                                            color: Colors.grey),
                                                      ),
                                                      //color: Colors.white,
                                                      child: Text(
                                                        "${messages[index]}",
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            color:
                                                                Colors.black),
                                                      ),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: 5),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          Text(
                                                            "24/07/19",
                                                            style: TextStyle(
                                                                fontSize: 11,
                                                                color: Colors
                                                                    .grey),
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
                                    ),
                                  )),
                  ),
                ),
                // Container(
                //   height: 2,
                //   child: Divider(
                //     color: Colors.grey,
                //   ),
                // ),
                Container(
                  //color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        // child: Container(
                        //   padding: EdgeInsets.all(5),
                        //   margin: EdgeInsets.all(15),
                        //   decoration: BoxDecoration(
                        //       borderRadius:
                        //           BorderRadius.all(Radius.circular(0.0)),
                        //       color: Colors.grey[100],
                        //       border: Border.all(width: 0.2, color: Colors.grey)),
                        //   child: TextFormField(
                        //     autofocus: false,
                        //     decoration: InputDecoration(
                        //       hintText: 'Type message...',
                        //       //labelText: 'Enter E-mail',
                        //       contentPadding:
                        //           EdgeInsets.fromLTRB(0.0, 5.0, 20.0, 5.0),
                        //       border: InputBorder.none,
                        //     ),
                        //     validator: (val) =>
                        //         val.isEmpty ? 'Field is empty' : null,
                        //     onSaved: (val) => result = val,
                        //     //validator: _validateEmail,
                        //   ),
                        // ),
                        child: Container(
                          //height: 100,
                          padding: EdgeInsets.all(0),
                          margin: EdgeInsets.only(
                              top: 5, left: 10, bottom: 5, right: 10),
                          decoration: BoxDecoration(
                              // borderRadius:
                              //     BorderRadius.all(Radius.circular(100.0)),
                              borderRadius: new BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                  bottomLeft: Radius.circular(20.0),
                                  bottomRight: Radius.circular(20.0)),
                              color: Colors.white,
                              border:
                                  Border.all(width: 0.5, color: Colors.grey)),
                          child: Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Icon(
                                  Icons.attach_file,
                                  color: Colors.black38,
                                ),
                              ),
                              Flexible(
                                child: new ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxHeight: 120.0,
                                  ),
                                  child: new SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    reverse: true,
                                    child: new TextField(
                                      maxLines: null,
                                      autofocus: false,
                                      controller: msgController,
                                      decoration: InputDecoration(
                                        hintText: "Type a message here...",
                                        contentPadding: EdgeInsets.fromLTRB(
                                            10.0, 10.0, 20.0, 10.0),
                                        border: InputBorder.none,
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          msg = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (msg != '') {
                            int dex = messages.length;
                            double idex = dex.toDouble();
                            print(idex);
                            setState(() {
                              //messages.insert(0, msg);
                              messages.add(msg);
                              //print("success");
                              msgController.text = '';
                              // _scrollController.animateTo(
                              //   idex,
                              //   curve: Curves.easeOut,
                              //   duration: const Duration(milliseconds: 300),
                              // );
                            });
                          } else {}
                        },
                        child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100.0)),
                                color: header,
                                border:
                                    Border.all(width: 0.5, color: Colors.grey)),
                            margin: EdgeInsets.only(right: 15),
                            child: Icon(
                              Icons.send,
                              color: Colors.white,
                              size: 18,
                            )),
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   child: Row(
      //     children: <Widget>[
      //       Flexible(
      //         child: Container(
      //           padding: EdgeInsets.all(5),
      //           margin: EdgeInsets.all(15),
      //           decoration: BoxDecoration(
      //               borderRadius: BorderRadius.all(Radius.circular(0.0)),
      //               color: Colors.grey[100],
      //               border: Border.all(width: 0.2, color: Colors.grey)),
      //           child: TextFormField(
      //             autofocus: false,
      //             decoration: InputDecoration(
      //               hintText: 'Type message...',
      //               //labelText: 'Enter E-mail',
      //               contentPadding: EdgeInsets.fromLTRB(0.0, 5.0, 20.0, 5.0),
      //               border: InputBorder.none,
      //             ),
      //             validator: (val) => val.isEmpty ? 'Field is empty' : null,
      //             onSaved: (val) => result = val,
      //             //validator: _validateEmail,
      //           ),
      //         ),
      //       ),
      //       Container(
      //           margin: EdgeInsets.only(right: 15),
      //           child: Icon(
      //             Icons.send,
      //             color: header,
      //           ))
      //     ],
      //   ),
      // ),
    );
  }
}
