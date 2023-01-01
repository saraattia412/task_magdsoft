import 'package:flutter/material.dart';

class AppColor{
  static const Color white = Color(0xFFFFFFFF);
}

Widget background() => Container(
  decoration: const BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.center,
      colors: [
        Colors.blue,
        Colors.white,
      ],
    ),
  ),
);


