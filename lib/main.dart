import 'package:flutter/material.dart';

import 'MainScreen/Homepage/homepage.dart';

void main() => runApp(MyApp());

Color header = Color(0xFF075E54);
Color subheader = Color(0xFF20C65A);
Color sub_white = Color(0xFFf4f4f4);
Color golden = Color(0xFFCFB53B);
Color chat_back = Color(0xFFEAE7E2);
Color my_chat = Color(0xFFDAF5C2);

String pageDirect = "";
int selectedPage = 0;

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bikroy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //primarySwatch: header
      ),
      home: MyHomePage(),
    );
  }
}
