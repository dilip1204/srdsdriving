import 'dart:ui';

import 'package:flutter/material.dart';
//import 'package:srds/auth/Authentication.dart';

class Signs extends StatefulWidget {
  Signs({
    this.auth,
    this.onSignedIn,
  });
  // final AuthImplementation auth;
  final VoidCallback onSignedIn;
  State<StatefulWidget> createState() {
    return _SignsState();
  }
}

enum FormType { signs }

class _SignsState extends State<Signs> {
  final formKey = GlobalKey<FormState>();
  FormType _formType = FormType.signs;

  //Design
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Signs Page"),
      ),
      body: Container(
        margin: EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[],
            //+                createInputs() +
            // createButtons(),
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            // children: createInputs() + createButtons(),
          ),
        ),
      ),
    );
  }
}
