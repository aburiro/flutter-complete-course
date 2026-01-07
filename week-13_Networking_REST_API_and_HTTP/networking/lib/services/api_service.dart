import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post.dart';

class ApiService {
  final String url = "https://jsonplaceholder.typicode.com/posts";

  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List jsonData = json.decode(response.body);
      return jsonData.map((e) => Post.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load posts");
    }
  }
}
