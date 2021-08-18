import 'dart:convert';

import 'package:http/http.dart' as http;

class GetQuote {
  static const URL = "http://api.quotable.io/random";

  static Future<Map?> getQuote() async {
    var response = await http.get(Uri.parse(URL));
    return jsonDecode(response.body);
  }
}
