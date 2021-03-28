import 'package:flutter/material.dart';

class Rules extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Traffic Rules';

    return Scaffold(
      appBar: AppBar(title: Text(title, style: TextStyle(fontSize: 20.0))),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.arrow_right),
            // title: Text('Three-line ListTile'),
            subtitle: Text(
              '  On a two-way road, the driver must drive on the left side of the road so that the oncoming traffic from the other direction can pass through smoothly.',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.blueAccent,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.arrow_right),
            subtitle: Text(
              'For one-way roads, the driver should allow any vehicle overtaking his or her vehicle through the right.',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.blueAccent,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.arrow_right),
            subtitle: Text(
              'Every vehicle is equipped with direction indicators which should be used instead of hand signals. In case of emergency, the hazard indicator should be used which will switch on both indicators.',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.blueAccent,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.arrow_right),
            subtitle: Text(
              'It is mandatory for the driver and the pillion rider on a two-wheeler vehicle to wear a helmet. It is necessary for the helmet to have the ISI mark otherwise a fine will be levied on the rider.',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.blueAccent,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.arrow_right),
            subtitle: Text(
              'The driver is advised to not park his or her vehicle near a road crossing, on top of a hill, footpath, near traffic lights, on the pedestrian road, on the entrance of a building or a near a fire hydrant.',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.blueAccent,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.arrow_right),
            subtitle: Text(
              'The registration number of the vehicle is to be visible at all times.',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.blueAccent,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.arrow_right),
            subtitle: Text(
              'The vehicle should not be loaded in such a way that the any of the lights are obstructed. This is done to maintain road safety and avoid any mishaps on the road.',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.blueAccent,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.arrow_right),
            subtitle: Text(
              'The driver should not drive in the reverse direction on a one-way road.',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.blueAccent,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.arrow_right),
            subtitle: Text(
              'The driver should not cross the yellow line marked on the road even while overtaking another vehicle.',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.blueAccent,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.arrow_right),
            subtitle: Text(
              'If the driver is driving the vehicle on a road with defined lanes, the indicator should be used before switching lanes.',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.blueAccent,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
