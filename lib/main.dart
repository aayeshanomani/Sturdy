import 'package:eureka/services/auth.dart';
import 'package:eureka/splash.dart';
import 'package:eureka/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: Auth().user,
      child: MaterialApp
      (
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}