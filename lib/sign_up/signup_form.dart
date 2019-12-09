import 'package:flutter/material.dart';
import 'package:mobile_ticket_pay/log_in/log_in_page.dart';
import '../shared_widget/custom_sized_box.dart';

// will be used to toggle the text forms based on the user's choice
//enum EmailFormType { signUp, signIn }

class SignupForm extends StatefulWidget {
  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  // will help to get the entered values for email and password
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  // default form
 // EmailFormType _formType = EmailFormType.signUp;

  void _submitForm() {
    print(
        'email: ${_emailTextController.text}, \npassword: ${_passwordTextController.text}');
  }

  // toggles the text form based on the user's choice
  void _toggleFormType(BuildContext context) {
//    setState(() {
//      _formType = _formType == EmailFormType.signUp
//          ? EmailFormType.signIn
//          : EmailFormType.signUp;
//    });

    Navigator.push(context, MaterialPageRoute(builder: (context)=> LogInPage()));
    // clear rhe text fields when the user toggles between the forms
    _emailTextController.clear();
    _passwordTextController.clear();
  }

  List<Widget> _buildChildren( BuildContext context) {
    // depending on the user's choice, show the text form
//    final primaryText =
//        _formType == EmailFormType.signUp ? 'Sign up' : 'Log in';
//
//    final secondaryText = _formType == EmailFormType.signUp
//        ? 'Already have an account? Log in here.'
//        : 'Don\'t have an account? Sign up';
//    final logInWithGoogle = _formType == EmailFormType.signIn ?
//        'Log in with Google' : '';
    return [
      TextField(
        controller: _emailTextController,
        decoration: InputDecoration(
            labelText: 'Email', hintText: 'Enter your email here'),
      ),
      SizedBox(height: 8.0),
      TextField(
        controller: _passwordTextController,
        decoration: InputDecoration(
          labelText: 'Password',
        ),
        obscureText: true,
      ),
      SizedBox(height: 10.0),
      CustomSizedBox(text: 'Sign Up', onPressed: _submitForm),
      SizedBox(height: 10.0),
      FlatButton(
        child: Text('Already have an account? Log in here.'),
        onPressed: () => _toggleFormType(context),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _buildChildren(context),
      ),
    );
  }
}
