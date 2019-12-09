import 'package:flutter/material.dart';

class CustomSizedBox extends StatelessWidget {
  final double customWidth;
  final double customHeight;
  final String text;
  final VoidCallback onPressed;

  const CustomSizedBox({
    this.customWidth, this.customHeight, this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    // returns a custom rounded button
    return SizedBox(
      width: customWidth,
      height: customHeight,
      child: OutlineButton(
        shape: new RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0)),
        color: Colors.black,
        onPressed: onPressed,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
