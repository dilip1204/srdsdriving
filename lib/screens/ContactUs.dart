import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.fallback().copyWith(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.grey,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          title: Text('Contact Us'),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                child: FlutterLogo(),
                radius: 50.0,
                backgroundColor: Colors.transparent,
                //backgroundImage: AssetImage('images/gtr.png'),
              ),
              SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 15.0,
                width: 200.0,
                child: Divider(
                  color: Colors.pink,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Card(
                margin: EdgeInsets.all(10.0),
                child: ListTile(
                  leading: Icon(
                    Icons.account_box_outlined,
                    color: Colors.pink,
                  ),
                  title: Text('R.Gokulakrishnan'),
                ),
              ),
              Card(
                margin: EdgeInsets.all(10.0),
                child: ListTile(
                  leading: Icon(
                    Icons.add_location,
                    color: Colors.pink,
                  ),
                  title: Text(
                      '3/7, Amarjothi vimana nagar, Sulur, Coimbatore - 641401'),
                ),
              ),
              Card(
                margin: EdgeInsets.all(10.0),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.pink,
                  ),
                  title: Text('+91 99528 41347'),
                ),
              ),
              Card(
                margin: EdgeInsets.all(10.0),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.pink,
                  ),
                  title: Text('srds2020@gmail.com'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
