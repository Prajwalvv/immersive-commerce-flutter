import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';
import 'token_service.dart';

class ApiService {
  static const String baseUrl = 'https://fakestoreapi.com';
  final TokenService _tokenService = TokenService();

  Future<List<Product>> getProducts() async {
    final token = await _tokenService.getToken();
    final response = await http.get(
      Uri.parse('$baseUrl/products'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  Future<Product> getProductDetails(int productId) async {
    final token = await _tokenService.getToken();
    final response = await http.get(
      Uri.parse('$baseUrl/products/$productId'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load product details');
    }
  }
}
