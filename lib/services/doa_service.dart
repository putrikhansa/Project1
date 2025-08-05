// ignore_for_file: unused_import

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project1/models/doa_model.dart';

class DoaService {
  static const String doaUrl = 'https://doa-doa-api-ahmadramadhan.fly.dev/api';

  static Future<List<DoaModel>> fetchDoa() async {
    final response = await http.get(Uri.parse(doaUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((json) => DoaModel.fromJson(json)).toList();
    } else {
      throw Exception('Gagal mengambil data doa');
    }
  }
}
