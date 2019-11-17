import 'package:bikroy_app/MainScreen/ChatPage/chat_page.dart';
import 'package:flutter/material.dart';

class FriendChatCard extends StatefulWidget {
  final index;
  FriendChatCard(this.index);
  @override
  _FriendChatCardState createState() => _FriendChatCardState();
}

class _FriendChatCardState extends State<FriendChatCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        child: ListTile(
          title: Container(
            margin: EdgeInsets.only(left: 0, right: 0, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ////// <<<<< Message >>>>> //////
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(top: 4, right: 70),
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(width: 0.2, color: Colors.grey),
                          ),
                          child: Text(
                            "${messages[widget.index]}",
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ),

                        ////// <<<<< Time & Date >>>>> //////
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "24/07/19",
                                style:
                                    TextStyle(fontSize: 11, color: Colors.grey),
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
      ),
    );
  }
}
