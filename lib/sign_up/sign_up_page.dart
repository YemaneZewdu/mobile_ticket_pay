import 'package:flutter/material.dart';
import 'package:mobile_ticket_pay/sign_up/signup_form.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign up"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // fixed overflow when the keyboard is up
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            child: SignupForm(),
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}

