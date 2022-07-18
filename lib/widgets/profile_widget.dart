import 'package:flutter/material.dart';

import 'colors.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key, required this.userProfilePic, required this.size, required this.padding});

  final String userProfilePic;
  final double size;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Container(
        height: size,
        width: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(colors: [
            MyColor.purple,
            MyColor.pink,
            MyColor.yellow,
            MyColor.red
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: Container(
          height: size-5,
          width: size-5,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: MyColor.white,
          ),
          child: Container(
            height: size-10,
            width: size-10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: MyColor.black, width: 0.5, style: BorderStyle.solid),
              image: DecorationImage(
                  image: AssetImage(
                    userProfilePic,
                  ),
                  fit: BoxFit.cover
              ),
            ),
          ),
        ),
      ),
    );
  }
}