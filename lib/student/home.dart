import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eureka/services/auth.dart';
import 'package:eureka/services/database.dart';
import 'package:eureka/services/helper.dart';
import 'package:eureka/tabs/chatroom.dart';
import 'package:eureka/tabs/profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';

class StudentHome extends StatefulWidget {
  @override
  _MerchHomeState createState() => _MerchHomeState();
}

class _MerchHomeState extends State<StudentHome> {

  Auth _auth = Auth();

  int _currentIndex = 1;

  Stream<QuerySnapshot> cardDetails;
  DatabaseMethods databaseMethods = new DatabaseMethods();

  QuerySnapshot card;
  bool load;

  @override
  void initState() {
    // TODO: implement initState
    getUser();
    super.initState();
  }

  getUser() async
  {
    Constants.myName = await HelperFunc.getUsername();
    print(Constants.myName);
    //card = databaseMethods.getCardDetails(Constants.myName);
  }

  final List<StatefulWidget> tabs = [
    ChatRoom(type: 'student',),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) 
  {
    //if(card == null)
      //return PaymentScreen();
    //else {
      return Scaffold
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

        body:  tabs[_currentIndex],

        bottomNavigationBar: BottomNavigationBar
          (
          currentIndex: _currentIndex,
          //iconSize: 30.0,
          backgroundColor: Colors.blue[300],
          items: [
            BottomNavigationBarItem
            (
              icon: Icon
              (
                FontAwesomeIcons.bookOpen,
                color: Colors.white,
                size: _currentIndex == 0 ? 20 : 25,
              ),
              title: Text
              (
                'Chat',
                style: TextStyle(color: _currentIndex == 0 ? Colors.white : Colors.transparent),
              ),
              backgroundColor: Colors.blue[300],
            ),
            BottomNavigationBarItem
            (
              icon: Icon
              (
                FontAwesomeIcons.personBooth,
                color: Colors.white,
                size: _currentIndex == 1 ? 20 : 25,
              ),
              title: Text
              (
                'Settings',
                style: TextStyle(color: _currentIndex == 1 ? Colors.white : Colors.transparent),
              ),
              backgroundColor: Colors.blue[300],
            )
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      );
    //}
  }
}