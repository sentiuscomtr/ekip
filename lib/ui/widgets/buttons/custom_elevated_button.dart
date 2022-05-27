import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton(
      {Key? key,
      required this.child,
      required this.onPressed,
      this.buttonStyle})
      : super(key: key);

  Widget child;
  VoidCallback onPressed;
  ButtonStyle? buttonStyle;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: child, onPressed: onPressed, style: buttonStyle);
  }
}
