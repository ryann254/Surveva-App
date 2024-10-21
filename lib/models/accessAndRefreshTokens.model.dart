
import 'package:surveva_app/models/token.model.dart';

class Accessandrefreshtokens {
  final Token accessToken;
  final Token refreshToken;

  Accessandrefreshtokens({
    required this.accessToken,
    required this.refreshToken,
  });

  factory Accessandrefreshtokens.fromJson(Map<String, dynamic> json) {
    return Accessandrefreshtokens(
      accessToken: Token.fromJson(json['accessToken']),
      refreshToken: Token.fromJson(json['refreshToken']),
    );
  }
}