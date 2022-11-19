import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/model.dart';

var base = 'https://dummyjson.com';

get() async {
  try {
    Uri url = Uri.parse("$base/products");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      //return Album.fromJson(jsonDecode(response.body));
      var data = modelFromJson(response.body);
      return data.products;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  } catch (e) {
    print(e.toString());
  }
}
