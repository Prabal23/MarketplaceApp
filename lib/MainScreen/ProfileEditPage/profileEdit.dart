import 'dart:io';

import 'package:bikroy_app/Forms/ProfileEditForm/profileEditForm.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../main.dart';

import 'package:image_picker/image_picker.dart';

class ProfileEditDialog extends StatefulWidget {
  @override
  _ProfileEditDialogState createState() => new _ProfileEditDialogState();
}

class _ProfileEditDialogState extends State<ProfileEditDialog> {
  

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //backgroundColor: Colors.black,
      appBar: new AppBar(
        backgroundColor: header,
        title: const Text('Edit Profile'),
      ),
      //body: new Text("It's a Dialog!"),
      body: SafeArea(
        child: SingleChildScrollView(
          child: new Container(
              padding: EdgeInsets.all(0.0),
              //color: Colors.white,
              child: ProfileEditForm()),
        ),
      ),
    );
  }
}
