import 'package:flutter/foundation.dart';

class SignUpProvider extends ChangeNotifier {
  String _name = '';
  String _email = '';
  String _password = '';
  String _dob = '';
  String _gender = '';
  bool _privacyPolicyAndTerms = false;
  bool _promotionalEmails = false;

  // Getters
  String get name => _name;
  String get email => _email;
  String get password => _password;
  String get dob => _dob;
  String get gender => _gender;
  bool get privacyPolicyAndTerms => _privacyPolicyAndTerms;
  bool get promotionalEmails => _promotionalEmails;

  // Setters
  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  void setDob(String dob) {
    _dob = dob;
    notifyListeners();
  }

  void setGender(String gender) {
    _gender = gender;
    notifyListeners();
  }

  void setPrivacyPolicyAndTerms(bool value) {
    _privacyPolicyAndTerms = value;
    notifyListeners();
  }

  void setPromotionalEmails(bool value) {
    _promotionalEmails = value;
    notifyListeners();
  }

  // Method to reset all values
  void reset() {
    _name = '';
    _email = '';
    _password = '';
    _dob = '';
    _gender = '';
    _privacyPolicyAndTerms = false;
    _promotionalEmails = false;
    notifyListeners();
  }
}
