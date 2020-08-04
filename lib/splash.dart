import 'dart:async';

import 'package:eureka/onboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), ()
    {
      Navigator.pushReplacement(context, MaterialPageRoute
          (
            builder: (context) => OnboardingScreen()
        ));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      body: Stack
      (
        fit: StackFit.expand,
        children: <Widget>
        [
          Container
          (
            decoration: BoxDecoration
            (
              gradient: new LinearGradient(
              colors: [
                Color(0xFFFFFFFF),
                Color(0xFFFFFFFF),
                Colors.blue
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 1.0),
              stops: [0.0, 0.5 ,1.0],
              tileMode: TileMode.clamp),
            ),
          ),
          Column
          (
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>
            [
              Expanded
              (
                flex: 2,
                child: Container
                (
                  child: Column
                  (
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>
                    [
                      SizedBox(height: 225),
                      CircleAvatar
                      (
                        backgroundColor: Colors.white,
                        radius: 73,
                        child: new Image(
                              width: 250.0,
                              height: 251.0,
                              fit: BoxFit.fill,
                              image: new AssetImage('assets/logo_wot.jpg')),
                      ),
                      Image(
                        width: 250.0,
                        height: 111.0,
                        fit: BoxFit.fill,
                        image: new AssetImage('assets/name.png')
                      ),    
                      /*Row
                      (
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>
                        [
                          SpinKitSpinningCircle
                          (
                            color: Colors.red,
                            size: 34,
                          ),
                          SpinKitWave
                          (
                            color: Colors.red[200],
                            size: 34,
                          ),
                          SpinKitSpinningCircle
                          (
                            color: Colors.red,
                            size: 34,
                          ),
                        ],
                      ),
                      Image(
                        width: 250.0,
                        height: 121.0,
                        fit: BoxFit.fill,
                        image: new AssetImage('assets/name.png')
                      ),*/
                    ],
                  ),
                ),
              ),
              Expanded
              (
                flex: 1,
                child: Column
                (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>
                  [
                    Row
                    (
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>
                      [
                        SpinKitFoldingCube
                        (
                          color: Colors.blue,
                          size: 24,
                        ),
                        SizedBox(width: 5,),
                        SpinKitFoldingCube
                        (
                          color: Colors.blue[100],
                          size: 24,
                        ),
                        SizedBox(width: 5,),
                        SpinKitFoldingCube
                        (
                          color: Colors.blue,
                          size: 24,
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top:10)),
                    Text
                    (
                      'Powered By Schaffen Softwares',
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 10.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top:20)),
                    Text
                    (
                      'A Holistic School',
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      )
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}