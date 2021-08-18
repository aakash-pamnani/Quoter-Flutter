import "package:flutter/material.dart";

class Values {
  static final lightTheme =
      ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark);

  static final darkTheme =
      ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark);

  static String instruction = "Tap on Quote to copy it to clipboard";
  static String appName = "Quoter";

  static getWidth(context) {
    return MediaQuery.of(context).size.width;
  }

  static getHeight(context) {
    return MediaQuery.of(context).size.width;
  }
}
