import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:surveva_app/models/category.model.dart';
import 'package:surveva_app/config/globals.dart' as globals;
import 'package:surveva_app/utils/handleError.dart';

Future<List<Category>> getCategories() async {
  Map<String, String> headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
  };
  final Uri uri = Uri.http(globals.baseUrl, '/api/v1/category');

  final response = await http.get(uri, headers: headers);
  if (response.statusCode == 200) {
    final categories = jsonDecode(response.body).map((category) => Category.fromJson(category)).toList();
    print(categories);
    return categories;
  } else {
    throw handleError(response.body);
  }
}