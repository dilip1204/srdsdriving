import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Now we need multiple widgets into a parent = "Container" widget
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(10.0), //Top, Right, Bottom, Left
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: new Text("Our Moto",
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0)),
                ),
                //Need to add space below this Text ?
                new Text(
                  "   Sri Ragavendra Driving School, Sulur offers a wide range of services as "
                  "outlined in the detailed sections below. It is ultimately the "
                  "goal of the company to offer a one-stop facility for all "
                  "driver needs, including registration, licensing, Insurance, RC Name Transfer, FC etc. "
                  "In this way the company could offer greater perceived value "
                  "for the customer that he or she could use for their entire "
                  "driving career",
                  style: new TextStyle(color: Colors.grey[850], fontSize: 16.0),
                ),
              ],
            ),
          ),
          // new Icon(Icons.favorite, color: Colors.red),
          // new Text(" 100", style: new TextStyle(fontSize: 16.0),),
        ],
      ),
    );

    final servicesSection = new Container(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Card(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            child: new Text("Services",
                style:
                    new TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0)),
          ),
          const ListTile(
            leading: Icon(Icons.ac_unit_rounded),
            title: Text('LLR'),
            subtitle: Text('Can apply LLRs for all two wheeler and LMV.'),
          ),
          const ListTile(
            leading: Icon(Icons.ac_unit_rounded),
            title: Text('Two wheeler/LMV/ Heavy Vehicle License'),
            subtitle: Text(
                'Training provided by professionals along with theory classes.'),
          ),
          const ListTile(
            leading: Icon(Icons.ac_unit_rounded),
            title: Text('RC Name Change/Renewal'),
            subtitle: Text('All kind of RC works undertaken.'),
          ),
          const ListTile(
            leading: Icon(Icons.ac_unit_rounded),
            title: Text('Insurance'),
            subtitle:
                Text('Insurance for All type of vehicles with in 2 minutes.'),
          ),
        ],
      ),
    ));

    //build function returns a "Widget"
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('About Us'),
        ),
        body: new ListView(
          children: <Widget>[
            //You can add more widget bellow
            titleSection,
            servicesSection,
          ],
        ));
  }
}
