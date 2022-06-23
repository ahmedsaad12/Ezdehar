import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import '../model/newsmodel.dart' as newsmodel;
import '../model/newsmodel.dart';
class Services{

  Future<newsmodel.NewsModel> getData() async {
   // print("skkskskks");
    final response = await http
        .get(Uri.parse('http://woundfairy.com/api/home/blogs?lang=ar'));

   // log('datassss: ${response.statusCode}');
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
     // log("lfkfkkf:${response.body}");
      final json = jsonDecode(response.body);
      //log("lfkfkkf:$json");
     NewsModel newsModel= NewsModel.fromJson(json);
      //log("kidded:${newsModel.data.length}");
      return newsModel;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

}