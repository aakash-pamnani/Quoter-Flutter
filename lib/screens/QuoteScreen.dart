import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quoter_flutter/helper/GetQuot.dart';
import 'package:quoter_flutter/helper/values.dart';

class QuoteScreen extends StatefulWidget {
  @override
  _QuoteScreenState createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: GetQuote.getQuote(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            print(snapshot.data);
            return Scaffold(
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkResponse(
                      onTap: () {
                        Clipboard.setData(ClipboardData(
                            text: (snapshot.data as Map)["content"] +
                                "\n" +
                                "-" +
                                (snapshot.data as Map)["author"]));
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.grey,
                            content: Text("Quote copied to clipboard",style: TextStyle(color: Colors.white),)));
                      },
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            maxWidth: Values.getWidth(context) * 0.8),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  (snapshot.data as Map)["content"],
                                  overflow: TextOverflow.fade,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text("-" + (snapshot.data as Map)["author"])
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {});
                        },
                        child: Text("Get Quote"))
                  ],
                ),
              ),
            );
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
