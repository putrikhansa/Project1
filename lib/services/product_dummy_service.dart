import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project1/models/product_dummy_model.dart';

class ProductService {
  static Future<List<ProductDummy>> getProducts() async {
    final url = Uri.parse("https://dummyjson.com/products");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonBody = json.decode(response.body);

      // Ambil list produk dari key 'products'
      final List<dynamic>? productsJson = jsonBody['products'];

      if (productsJson == null) {
        throw Exception("Data produk kosong/null");
      }

      // Parse list ke List<ProductDummy>
      return productsJson.map((json) => ProductDummy.fromJson(json)).toList();
    } else {
      throw Exception("Gagal load produk, status code: ${response.statusCode}");
    }
  }
}
