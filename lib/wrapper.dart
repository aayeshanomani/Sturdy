import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eureka/models/user.dart';
import 'package:eureka/services/helper.dart';
import 'package:eureka/services/location.dart';
import 'package:eureka/student/home.dart';
import 'package:eureka/tutor/home.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'choice.dart';
import 'models/location.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool userLog;

  FirebaseMessaging _messaging = FirebaseMessaging();

  @override
  void initState() {
    // TODO: implement initState
    getLoggedInInfo();
    super.initState();
  }

  getLoggedInInfo() async {
    await HelperFunc.getUserloggedIn().then((value) {
      setState(() {
        userLog = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    String type = "";

    /*if(userLog == null)
      {
        return Choice();
      }*/
    //return either home or authenticate
    if (user == null) {
      return StreamProvider<UserLocation>(
        //builder: (context) => LocationService().locationStream,
        create: (BuildContext context) => LocationService().locationStream,
        child: Choice(),
      );
    } else {
      var uid = user.uid;
      final CollectionReference type =
          Firestore.instance.collection('locations');
      return StreamBuilder(
          stream: Firestore.instance.collection('locations').snapshots(),
          builder: (context, snapshot) {
            for (int i = 0; i < snapshot.data.documents.length; i++) {
              if (snapshot.data.documents[i]['type'] == 'tutor' &&
                  snapshot.data.documents[i]['id'] == user.uid) {
                return StreamProvider<UserLocation>(
                  //builder: (context) => LocationService().locationStream,
                  create: (BuildContext context) =>
                      LocationService().locationStream,
                  child: TutorHome(),
                );
              } else if (snapshot.data.documents[i]['type'] == 'student' &&
                  snapshot.data.documents[i]['id'] == user.uid) {
                    
                      return StreamProvider<UserLocation>(
                        //builder: (context) => LocationService().locationStream,
                        create: (BuildContext context) =>
                            LocationService().locationStream,
                        child: StudentHome(),
                      );
              }
            }
            return null;
          });
    }
  }
}
