import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:surveva_app/config/globals.dart';
import 'package:surveva_app/models/userWIthToken.model.dart';
import 'package:surveva_app/utils/handleError.dart';

/// Login with email and password
///
/// Parameters:
/// - [email]
/// - [password]
///
/// Returns:
/// A [UserWithToken] object containing the authenticated user and their token
Future<UserWithToken> login({required String email, required String password}) async {
  String body;
  Map<String, String> headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
  };
  final Uri uri = Uri.http(baseUrl, '/api/v1/auth/login');

  body = jsonEncode({'email': email, 'password': password});
  final response = await http.post(uri, body: body, headers: headers);

  if (response.statusCode == 200) {
    final userWithToken = UserWithToken.fromJson(jsonDecode(response.body));
    return userWithToken;
  } else {
    throw handleError(response.body);
  }
}
