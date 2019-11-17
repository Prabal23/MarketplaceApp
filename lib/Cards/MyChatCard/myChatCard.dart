import 'package:bikroy_app/MainScreen/ChatPage/chat_page.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class MyChatCard extends StatefulWidget {
  final index;
  MyChatCard(this.index);
  @override
  _MyChatCardState createState() => _MyChatCardState();
}

class _MyChatCardState extends State<MyChatCard> {
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
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        ////// <<<<< Message >>>>> //////
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(top: 4, left: 70),
                          decoration: new BoxDecoration(
                            color: my_chat,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            border: Border.all(width: 0.2, color: Colors.grey),
                          ),
                          child: Text(
                            "${messages[widget.index]}",
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              ////// <<<<< Time & date >>>>> //////
                              Text(
                                "24/07/19",
                                style:
                                    TextStyle(fontSize: 11, color: Colors.grey),
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 3),
                                  child: messages.length == widget.index + 1
                                      ////// <<<<< Sent >>>>> //////
                                      ? Icon(
                                          Icons.done,
                                          size: 15,
                                          color: Colors.grey,
                                        )
                                      ////// <<<<< Seen >>>>> //////
                                      : Icon(
                                          Icons.done_all,
                                          size: 15,
                                          color: Colors.blueAccent,
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
      ),
    );
  }
}
