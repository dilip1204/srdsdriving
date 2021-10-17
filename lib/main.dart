import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:srds/common/Mapping.dart';

import 'auth/Authentication.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SrdsMain());
}

class SrdsMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'srds',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MappingPage(
        auth: Auth(),
      ),
    );
  }
}
