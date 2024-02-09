import 'dart:convert';

import 'package:posts_app/feature/posts/model/post_model.dart';

import '../../../core/constans.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<List<PostModel>?> getposts() async {
    try {
      var url = Uri.parse(AppConstans.baseUrl + AppConstans.postsEndpoint);
      var result = await http.get(url);
      if (result.statusCode == 200) {
        List data = json.decode(result.body);
        List<PostModel> posts = data.map((e) => PostModel.fromJson(e)).toList();
        return posts;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
