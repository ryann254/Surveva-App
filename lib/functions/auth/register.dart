import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:surveva_app/config/globals.dart' as globals;
import 'package:surveva_app/models/userWIthToken.model.dart';
import 'package:surveva_app/utils/handleError.dart';

/// Register a new user
///
/// Parameters:
/// - [name]
/// - [dob]
/// - [email]
/// - [password]
///
/// Returns:
/// A [UserWithToken] object containing the authenticated user and their token
Future<UserWithToken> register({required String name, required String dob, required String email, required String password, required String country, required String continent, required String language, required String gender, required String platform, required List<String> categories}) async {
  Map<String, String> headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
  };
  final Uri uri = Uri.http(globals.baseUrl, '/api/v1/auth/register');
  Map<String, dynamic> body = {
    'username': name,
    'password': password,
    'email': email,
    'role': 'user',
    'profilePic': '',
    'dob': dob,
    'location': {
      'country': country,
      'continent': continent,
    },
    'language': language,
    'gender': gender,
    'platform': platform,
    'categories': categories,
  };

  final response = await http.post(uri, body: jsonEncode(body), headers: headers);
  if (response.statusCode == 201) {
    final userWithToken = UserWithToken.fromJson(jsonDecode(response.body));
    return userWithToken;
  } else {
    throw handleError(response.body);
  }

}