import 'package:flutter/material.dart';

class CustomSnackBar {
  static void mySnackBar(context, String content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
      ),
    );
  }
}
