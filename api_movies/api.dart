import 'dart:convert';

import 'package:http/http.dart' as http;

getMovies() async {
  var url = Uri.parse('https://www.omdbapi.com/?s=spiderman&apikey=e6c43dc6');
  var response = await http.get(url);
  var data = await jsonDecode(response.body);

  return data;
}

getMovie(id) async {
  var url = Uri.parse('https://www.omdbapi.com/?i=$id&apikey=e6c43dc6');
  var response = await http.get(url);
  var data = await jsonDecode(response.body);

  return data;
}
