import 'package:flutter/material.dart';
import 'package:srds/mocktest/MockTest.dart';
import 'package:srds/screens/AboutUs.dart';
import 'package:srds/screens/ContactUs.dart';
import 'package:srds/screens/PhotoGallery.dart';
import 'package:srds/screens/Rules.dart';
import 'package:srds/signs/Signs.dart';

import '../auth/Authentication.dart';

class HomePage extends StatefulWidget {
  HomePage({
    this.auth,
    this.onSignedOut,
  });

  final AuthImplementation auth;
  final VoidCallback onSignedOut;

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

enum FormType { home, signs }

class _HomePageState extends State<HomePage> {
  static const String _AccountName = 'Welcome';
  static const String _AccountEmail =
      'Sri Ragavendra Driving Heavy Driving School';
  static const String _AccountAbbr = 'SRDS';

  void _logOutUser() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e.toString());
    }
  }

  void _moveToSignsPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Signs()),
    );
  }

  void _moveToMockTestPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MockTest()),
    );
  }

  void _moveToTrafficRulesPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Rules()),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text(_AccountName),
              accountEmail: new Text(_AccountEmail),
              currentAccountPicture: new CircleAvatar(
                  backgroundColor: Colors.brown, child: new Text(_AccountAbbr)),
            ),
            ListTile(
              title: Text('About us'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pop(context);

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => AboutUs()));
              },
            ),
            ListTile(
              title: Text('Photos Gallery'),
              onTap: () {
                // Update the state of the app.
                // ...r
                Navigator.pop(context);
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => PhotoGallery()));
              },
            ),
            ListTile(
              title: Text('Contact us'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pop(context);

                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => ContactUs()));
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.black)),
              child: Text("Sign Boards",
                  style: TextStyle(
                    fontSize: 20.0,
                  )),
              onPressed: _moveToSignsPage,
              color: Colors.red,
              textColor: Colors.white,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              splashColor: Colors.grey,
            ),
            SizedBox(height: 10),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.yellow)),
              child: Text("Mock Test",
                  style: TextStyle(
                    fontSize: 20.0,
                  )),
              onPressed: _moveToMockTestPage,
              color: Colors.green,
              textColor: Colors.white,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              splashColor: Colors.grey,
            ),
            SizedBox(height: 10),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red)),
              child: Text("Traffic Rules",
                  style: TextStyle(
                    fontSize: 20.0,
                  )),
              onPressed: _moveToTrafficRulesPage,
              color: Colors.orange,
              textColor: Colors.white,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              splashColor: Colors.grey,
            )
          ],
        )),
      ),
      // body: Container(),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.exit_to_app),
                iconSize: 50.0,
                tooltip: 'Click here to Logout',
                color: Colors.white,
                onPressed: _logOutUser,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
