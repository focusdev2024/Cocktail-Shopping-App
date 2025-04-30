import 'dart:convert';
import 'package:cocktail_cosmo_design/data/models/cocktail_model.dart';
import 'package:http/http.dart' as http;

class WPApiService {
  final String baseUrl = 'https://cocktail.idowebsites.ru/wp-json/wp/v2';

  Future<List<dynamic>> fetchPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/posts'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load posts');
    }
  }
}

Future<List<MediaItem>> fetchMediaItems() async {
  final response = await http.get(
    Uri.parse('https://cocktail.idowebsites.ru/wp-json/wp/v2/media'),
  );

  if (response.statusCode == 200) {
    List jsonData = json.decode(response.body);
    return jsonData.map((item) => MediaItem.fromJson(item)).toList();
  } else {
    throw Exception('Failed to load media items');
  }
}
