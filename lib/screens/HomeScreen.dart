import 'package:flutter/material.dart';
import 'package:quoter_flutter/screens/QuoteScreen.dart';
import '/helper/values.dart';

import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final String key = "FIRST_TIME";
  bool? isFirstTime = true;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getFirstTime(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (isFirstTime!) {
              Future.delayed(Duration.zero, () => showAlertDialog());
              setFirstTime();
            }
            return QuoteScreen();
          } else {
            return Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          }
        });
  }

  Future<void> getFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isFirstTime = prefs.getBool(key) ?? true;
  }

  Future<void> setFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, false);
  }

  void showAlertDialog() {
    Widget okButton = ElevatedButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text("Instructions"),
      content: Text(Values.instruction),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (context) {
        return alert;
      },
    );
  }
}
