import 'dart:ui';

import 'package:flutter/material.dart';
import '../auth/Authentication.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class SignsReport extends StatefulWidget {
  SignsReport({
    this.auth,
    this.onSignedIn,
  });
  final AuthImplementation auth;
  final VoidCallback onSignedIn;
  State<StatefulWidget> createState() {
    return _SignsReportState();
  }
}

class _SignsReportState extends State<SignsReport> {
  PDFDocument doc;

   @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Driving signs"),
      ),
        body: Container(),
    ),
  } 
}
