// ignore_for_file: unused_import

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project1/models/post_model.dart';
import 'package:project1/posts/list_post_screen.dart';

class PostService {
  static const String postUrl = 'https://jsonplaceholder.typicode.com/posts';

  static Future<List<PostModel>> ListPost() async {
    final response = await http.get(Uri.parse(postUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((json) => PostModel.fromJson(json)).toList();
    } else {
      throw Exception('Gagal Mengambil data post');
    }
  }
}
