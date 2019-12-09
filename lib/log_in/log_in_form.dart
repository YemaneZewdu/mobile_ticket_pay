import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../shared_widget/custom_sized_box.dart';

class LogInForm extends StatefulWidget {
  @override
  _LogInFormState createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {

  // will help to get the entered values for email and password
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  void _submitForm() {
    print(
        'email: ${_emailTextController.text}, \npassword: ${_passwordTextController.text}');
  }

  List<Widget> _buildChildren() {
    return [
      TextField(
        controller: _emailTextController,
        decoration: InputDecoration(
            labelText: 'Email', hintText: 'Enter your email here'),
      ),
     // SizedBox(height: 5.0),
      TextField(
        controller: _passwordTextController,
        decoration: InputDecoration(
          labelText: 'Password',
        ),
        obscureText: true,
      ),
      //SizedBox(height: 3.0),
      Align(
        alignment: Alignment.bottomRight,
        child: FlatButton(
          child: Text('Forgot Password?', textAlign: TextAlign.start,),
          onPressed: () {},
        ),
      ),
      //SizedBox(height: 3.0),
      CustomSizedBox(text: "Log In", onPressed: _submitForm),
      SizedBox(height: 7.0),
      // wanted to have a nice looking flat button with Google's logo so added opacity
      FlatButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('images/google-logo.png'),
            Text('Sign in with Google'),
            Opacity(
              opacity: 0.0,
              child: Image.asset('images/google-logo.png'),
            ),
          ],
        ),
        onPressed: () {},
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
        children: _buildChildren(),
      ),
    );
  }
}
