import 'package:flutter/material.dart';
import 'package:new_project1/constants/colors.dart';

class UserMainPageButton extends StatelessWidget {
  UserMainPageButton(
      {Key? key,
      required this.title,
      required this.width,
      required this.height,
      required this.onPressed})
      : super(key: key);
  final String title;
  final double width;
  final double height;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Text(title,
            style: const TextStyle(color: Colors.white, fontSize: 24)),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            primary: userMainPageButtonColor,
            minimumSize: Size(width, height),
            maximumSize: Size(width + 1, height + 1)));
  }
}
