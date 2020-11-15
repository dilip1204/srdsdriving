

import 'package:flutter/material.dart';

import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

class SignsReport extends StatefulWidget {
  String name;
  SignsReport(this.name);

  @override
  _SignsReportState createState() => _SignsReportState(name);
}

class _SignsReportState extends State<SignsReport> {
  bool _isLoading = true;
  PDFDocument doc;
  String name;
  _SignsReportState(this.name);

  @override
  void initState() {
    super.initState();
    _asyncMethod(name);
  }

  void _asyncMethod(name) async {
    setState(() {
      _isLoading = true;
    });
    print(name);
    doc = await PDFDocument.fromAsset(name);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signs"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 8,
              child: _isLoading
                  ? CircularProgressIndicator()
                  : PDFViewer(
                      document: doc,
                    ),
            ),
            /*Flexible(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
