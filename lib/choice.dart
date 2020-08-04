import 'package:eureka/student/signin.dart';
import 'package:eureka/tutor/signin.dart';
import 'package:eureka/utils/colors.dart';
import 'package:eureka/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Choice extends StatefulWidget {
  @override
  _ChoiceState createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {

  String type = "";
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.blue[900]),
    );

    final logo = Container(
      height: 200.0,
      width: 200.0,
      decoration: BoxDecoration(
        /*image: DecorationImage(
          image: AvailableImages.appLogo,
          fit: BoxFit.cover,
        ),*/
      ),
    );

    final appName = Column(
      children: <Widget>[
        Text(
          AppConfig.appName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue[700],
            fontSize: 60.0,
            fontFamily: 'Girassol'
          ),
        ),
        Text(
          AppConfig.appTagline,
          style: TextStyle(
              color: Colors.blue,
              fontSize: 18.0,
              fontWeight: FontWeight.w500
          ),
        )
      ],
    );

    final loginBtn = InkWell(
      onTap: ()
      {
        setState(() {
          type = "tutor";
        });
      },
      child: Container(
        height: 60.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          border: Border.all(color: Colors.blue[600]),
          color: Colors.transparent,
        ),
        child: Center(
          child: Text(
            'LOGIN AS TUTOR',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20.0,
              color: Colors.blue[700],
            ),
          ),
        ),
      ),
    );

    final registerBtn = Container(
      height: 60.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
        border: Border.all(color: Colors.white),
        color: Colors.blue[800],
      ),
      child: RaisedButton(
        elevation: 5.0,
        onPressed: ()
        {
          setState(() {
            type = "student";
          });
        },
        color: Colors.blue[900],
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(7.0),
        ),
        child: Text(
          'LOGIN AS STUDENT',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20.0,
            color: Colors.white
          ),
        ),
      ),
    );

    final buttons = Padding(
      padding: EdgeInsets.only(
        top: 80.0,
        bottom: 30.0,
        left: 30.0,
        right: 30.0,
      ),
      child: Column(
        children: <Widget>[loginBtn, SizedBox(height: 20.0), registerBtn],
      ),
    );

    if(type == "tutor")
    {
      return TutorSignIn();
    }
    if(type == "student")
    {
      return StudentSignIn();
    }

    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 70.0),
              decoration: BoxDecoration(gradient: primaryGradient),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[logo, appName, buttons],
              ),
            ),
          ],
        ),
      ),
    );
  }
}