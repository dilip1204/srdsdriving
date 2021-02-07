import 'package:flutter/material.dart';
import 'package:srds/mocktest/MockTest.dart';
import 'package:srds/screens/AboutUs.dart';
import 'package:srds/screens/ContactUs.dart';
import 'package:srds/screens/PhotoGallery.dart';
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
  static const String _AccountName = 'Dilipkumar';
  static const String _AccountEmail = 'dilip.kumar1204@gmail.com';
  static const String _AccountAbbr = 'DK';

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
              accountName: const Text(_AccountName),
              accountEmail: const Text(_AccountEmail),
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
              child: Text("Signs"),
              onPressed: _moveToSignsPage,
              color: Colors.red,
              textColor: Colors.yellow,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              splashColor: Colors.grey,
            ),
            RaisedButton(
              child: Text("Mock Test"),
              onPressed: _moveToMockTestPage,
              color: Colors.green,
              textColor: Colors.yellow,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              splashColor: Colors.grey,
            ),
            RaisedButton(
              child: Text("Rules"),
              onPressed: _moveToSignsPage,
              color: Colors.orange,
              textColor: Colors.yellow,
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
