import 'package:flutter/material.dart';
import 'package:srds/common/Mapping.dart';

import 'auth/Authentication.dart';

void main() {
  runApp(SrdsMain());
}

class SrdsMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'srds',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MappingPage(
        auth: Auth(),
      ),
    );
  }
}
