import 'package:firebase_test/childinfo/childinfo.dart';
import 'package:firebase_test/main/profile/subpage/calling.dart';
import 'package:firebase_test/main/profile/subpage/map.dart';
import 'package:firebase_test/main/profile/subpage/update_childinfo.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../login/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _authentication = FirebaseAuth.instance;

  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pressed ? Colors.grey[850] : Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 35, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: pressed ? Colors.grey[700] : Colors.grey[100],
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/parent.png'),
                    radius: 60.0,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Matthew',
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.75,
                        color: pressed ? Colors.grey[200] : Colors.grey[900]),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'test@gmail',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 14.0,
                      letterSpacing: 0.75,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
              color: pressed ? Colors.grey[700] : Colors.grey[100],
              child: ListTile(
                leading: Icon(
                  Icons.border_color,
                  color: pressed ? Colors.grey[400] : Colors.grey[800],
                ),
                title: Text(
                  'Child Information',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 15.0,
                    letterSpacing: 0.5,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.navigate_next),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UpdateChildInfoScreen()));
                  },
                  color: Colors.grey[400],
                ),
              ),
            ),
            Divider(
              height: 0.20,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
              color: pressed ? Colors.grey[700] : Colors.grey[100],
              child: ListTile(
                leading: Icon(
                  Icons.call,
                  color: pressed ? Colors.grey[400] : Colors.grey[800],
                ),
                title: Text(
                  'Phone Call',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 15.0,
                    letterSpacing: 0.5,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.navigate_next),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CallingScreen()));
                  },
                  color: Colors.grey[400],
                ),
              ),
            ),
            Divider(
              height: 0.20,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
              color: pressed ? Colors.grey[700] : Colors.grey[100],
              child: ListTile(
                leading: Icon(
                  Icons.location_on,
                  color: pressed ? Colors.grey[400] : Colors.grey[800],
                ),
                title: Text(
                  'Child Location',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 15.0,
                    letterSpacing: 0.5,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.navigate_next),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MapScreen()));
                  },
                  color: Colors.grey[400],
                ),
              ),
            ),
            Divider(
              height: 0.20,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
              color: pressed ? Colors.grey[700] : Colors.grey[100],
              child: ListTile(
                  leading: Icon(
                    Icons.notifications_active,
                    color: pressed ? Colors.grey[400] : Colors.grey[800],
                  ),
                  title: Text(
                    'School Notification',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 15.0,
                      letterSpacing: 0.5,
                    ),
                  ),
                  trailing: GFToggle(
                    onChanged: (val) {},
                    value: true,
                    enabledThumbColor: Colors.white,
                    enabledTrackColor: HexColor('#0b4e25'),
                    type: GFToggleType.ios,
                  )),
            ),
            Divider(
              height: 0.20,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
              color: pressed ? Colors.grey[700] : Colors.grey[100],
              child: ListTile(
                  leading: Icon(
                    Icons.check,
                    color: pressed ? Colors.grey[400] : Colors.grey[800],
                  ),
                  title: Text(
                    'School Dismissal',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 15.0,
                      letterSpacing: 0.5,
                    ),
                  ),
                  trailing: GFToggle(
                    onChanged: (val) {},
                    value: true,
                    enabledThumbColor: Colors.white,
                    enabledTrackColor: HexColor('#0b4e25'),
                    type: GFToggleType.ios,
                  )),
            ),
            Divider(
              height: 0.20,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
              color: pressed ? Colors.grey[700] : Colors.grey[100],
              child: ListTile(
                leading: Icon(
                  Icons.settings,
                  color: pressed ? Colors.grey[400] : Colors.grey[800],
                ),
                title: Text(
                  'Setting',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 15.0,
                    letterSpacing: 0.5,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.navigate_next),
                  onPressed: () {},
                  color: Colors.grey[400],
                ),
              ),
            ),
            Divider(
              height: 0.20,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
              color: pressed ? Colors.grey[700] : Colors.grey[100],
              child: ListTile(
                leading: Icon(
                  Icons.logout_outlined,
                  color: Colors.red[900],
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 15.0,
                    letterSpacing: 0.5,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.navigate_next),
                  onPressed: () {
                    _authentication.signOut();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginSignupScreen()),
                        (route) => false);
                  },
                  color: Colors.grey[400],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
