import 'package:flutter/material.dart';
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
  final formKey = GlobalKey<FormState>();
  FormType _formType = FormType.home;

  void _logOutUser() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e.toString());
    }
  }

  void _moveToSignsPage() {
    //formKey.currentState.reset();
    setState(() {
      _formType = FormType.signs;
    });
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
            DrawerHeader(
              child: Text('SRDS Drving school'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('About us'),
              onTap: () {
                // Update the state of the app.
                // ...
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Photos Gallery'),
              onTap: () {
                // Update the state of the app.
                // ...r
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Contact us'),
              onTap: () {
                // Update the state of the app.
                // ...
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
              onPressed: _moveToSignsPage,
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
        color: Colors.blue,
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
