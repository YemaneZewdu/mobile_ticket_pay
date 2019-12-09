import 'package:flutter/material.dart';
import 'package:mobile_ticket_pay/log_in/log_in_page.dart';
import 'package:mobile_ticket_pay/sign_up/sign_up_page.dart';

import 'shared_widget/custom_sized_box.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildContent(context),
      backgroundColor: Colors.grey[200],
    );
  }

 void gotoLogin(BuildContext context) {
   Navigator.push(
       context, MaterialPageRoute<void>(builder: (context) => LogInPage()));
  }

  // method for navigating to sign up screen
  void gotoSignup(BuildContext context){
      Navigator.push(
          context, MaterialPageRoute<void>(builder: (context) => SignUpPage()));
  }
   // widget building app logo, sign up and log in buttons
  Widget _buildContent(context) {
    // getting the screen width
    var _fullWidth = MediaQuery
        .of(context)
        .size
        .width;
    // getting the screen height
    var _fullHeight = MediaQuery
        .of(context)
        .size
        .height;
    // custom width
    var _width = MediaQuery
        .of(context)
        .size
        .width / 100;
    // custom height
    var _height = MediaQuery
        .of(context)
        .size
        .height / 100;

    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            "Mobile Ticket Pay",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black,
                fontSize: 30.0,
                fontWeight: FontWeight.bold),
          ),
          // add spacing
          SizedBox(height: 48.0),
//          SizedBox(
//            width: _width * 2,
//            height: _height * 7,
//            child: OutlineButton(
//              shape: new RoundedRectangleBorder(
//                  borderRadius: BorderRadius.circular(50.0)),
//              color: Colors.black,
//              onPressed: () {
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(builder: (context) => SignupScreen()),
//                );
//              },
//              child: Text(
//                "Sign up",
//                textAlign: TextAlign.center,
//                style: TextStyle(
//                    fontSize: 25,
//                    color: Colors.black,
//                    fontWeight: FontWeight.bold),
//              ),
//            ),
//          ),
        // calling custom sized box class for creating sign up button
          CustomSizedBox(
              onPressed: () => gotoSignup(context),
              text: 'Sign up',
              customWidth: _width * 2,
              customHeight: _height * 7),
          SizedBox(height: 20.0),
//          SizedBox(
//            width: _width * 2,
//            height: _height * 7,
//            child: OutlineButton(
//              shape: new RoundedRectangleBorder(
//                  borderRadius: BorderRadius.circular(50.0)),
//              color: Colors.black,
//              onPressed: gotoLogin,
//              child: Text(
//                "Log in",
//                textAlign: TextAlign.center,
//                style: TextStyle(
//                    fontSize: 25,
//                    color: Colors.black,
//                    fontWeight: FontWeight.bold),
//              ),
//            ),
//          ),
          // calling custom sized box class for creating log in button
          CustomSizedBox(
              onPressed: () => gotoLogin(context),
              text: 'Log In',
              customWidth: _width * 2,
              customHeight: _height * 7),
        ],
      ),
    );
  }
}

