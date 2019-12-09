import 'package:flutter/material.dart';

import '../first_landing_screen.dart';
import 'log_in_form.dart';

class LogInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log in"),
        centerTitle: true,
        // removes the default back button
        automaticallyImplyLeading: false,
        // added custom back button to navigate to the very first landing screen
        // resolves issue of going back to Sign up screen if the user has come to
        // the log in screen from 'Already have an account?' button inside sign up screen
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => LandingPage())),
        ),
      ),
      body: SingleChildScrollView(
        // fixed overflow when the keyboard is up
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            child: LogInForm(),
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
