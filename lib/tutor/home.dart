import 'package:eureka/constants.dart';
import 'package:eureka/loading.dart';
import 'package:eureka/models/location.dart';
import 'package:eureka/services/auth.dart';
import 'package:eureka/services/helper.dart';
import 'package:eureka/tabs/chatroom.dart';
import 'package:eureka/tabs/map.dart';
import 'package:eureka/tabs/profile.dart';
import 'package:eureka/tabs/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class TutorHome extends StatefulWidget {
  @override
  TutorHomeState createState() => TutorHomeState();
}

class TutorHomeState extends State<TutorHome> {

  int currentIndex = 0;
  Auth _auth = Auth();

  final List<StatefulWidget> tabs = [
      MapView(),
      SearchView(),
      ChatRoom(type: 'tutor',),
      Profile(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    getUserInfo();
    super.initState();
  }

  getUserInfo() async
  {
    Constants.myName = await HelperFunc.getUsername();
    print(Constants.myName);
  }

  @override
  Widget build(BuildContext context) {
    
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.blue[900]),
    );
    
    var userLocation = Provider.of<UserLocation>(context);
    return userLocation == null ? Loading() : Scaffold
    (
      backgroundColor: Colors.black,
      /*appBar: AppBar
      (
        title: Text('Home',
        style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.lightBlue[50],
        elevation: 0.0,
        actions: <Widget>
        [
          FlatButton.icon
          (
            icon: Icon(Icons.person),
            label: Text('Logout'),
            onPressed: () async
            {
              await _auth.signOut();
            },
          )
        ],
      ),*/

      body: tabs[currentIndex],

      bottomNavigationBar: BottomNavigationBar
      (
        currentIndex: currentIndex,
        //iconSize: 30.0,
        elevation: 2.0,

        items: [
          BottomNavigationBarItem
          (
            icon: Icon
            (
              FontAwesomeIcons.mapMarkedAlt,
              color: Colors.white,
            ),
            title: Text
            (
              'Near You',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.blueAccent[400],
          ),
          BottomNavigationBarItem
          (
            icon: Icon
            (
              FontAwesomeIcons.searchLocation,
              color: Colors.white,
            ),
            title: Text
            (
              'Search',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.blueAccent[400],
          ),
          BottomNavigationBarItem
          (
            icon: Icon
            (
              FontAwesomeIcons.bookOpen,
              color: Colors.white,
            ),
            title: Text
            (
              'Chat',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.blueAccent[400],
          ),
          BottomNavigationBarItem
          (
            icon: Icon
            (
              FontAwesomeIcons.personBooth,
              color: Colors.white,
            ),
            title: Text
            (
              'Settings',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.blueAccent[400],
          )
        ],
        onTap: (index)
        {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}

