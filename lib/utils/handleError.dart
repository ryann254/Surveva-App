import 'dart:convert';
import 'dart:developer';

import 'package:surveva_app/models/error.model.dart';

Error handleError(err) {
  final Error error = Error.fromJson(jsonDecode(err));
  log(error.message.toString());
  return error;
}