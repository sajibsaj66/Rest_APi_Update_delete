import 'dart:convert';

import "package:http/http.dart" as http;

class ApiService {
  final baseURL = "jsonplaceholder.typicode.com";

  Future getAlbam() async {
    var response = await http.get(Uri.https("$baseURL", "albums"));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed To Load Date");
    }
  }

  Future sendAlbam(String title) async {
    var response = await http.post(Uri.https("$baseURL", "albums"),
        body: jsonEncode(<String, String>{"title": title}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    print("response.statusCode: ${response.statusCode}");
    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed To Load Date");
    }
  }

  Future updateAlbam(String title, id) async {
    var response = await http.put(Uri.https("$baseURL", "albums/$id"),
        body: jsonEncode(<String, String>{"title": title}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    print("response.statusCode: ${response.statusCode}");
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed To Load Date");
    }
  }

  Future deleteAlbam(id) async {
    var response = await http.delete(Uri.https("$baseURL", "albums/$id"),
        // body: jsonEncode(<String, String>{"title": title}),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    print("response.statusCode: ${response.statusCode}");
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
