import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchData() async {
  final response = await http
      .get(Uri.parse('https://darsoft.b-cdn.net/movies_categories.json'));

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return json.decode(response.body);
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load data');
  }
}
