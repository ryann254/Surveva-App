bool isEmailValid(String email) {
  if (email.isEmpty) return false;
  return RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
      .hasMatch(email);
}

bool isPasswordValid(String password) {
  return RegExp(
          r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>])[A-Za-z\d!@#$%^&*(),.?":{}|<>]{8,}$')
      .hasMatch(password);
}

bool isNameValid(String name) {
  if (name.isEmpty || name.length < 3) return false;
  return true;
}

bool isDobValid(String dob) {
  if (dob.isEmpty || dob.length < 10) return false;
  return true;
} 

bool isConfirmPasswordValid(String confirmPassword, String password) {
  if (confirmPassword.isEmpty) return false;
  return confirmPassword == password;
}

String getEmailErrorMessage(String email) {
  if (email.isEmpty) return '';
  if (!isEmailValid(email)) return 'Invalid email';
  return '';
}

String getPasswordErrorMessage(String password) {
  if (password.isEmpty) return '';
  List<String> missingCriteria = [];
  if (!password.contains(RegExp(r'[A-Z]')))
    missingCriteria.add('an uppercase letter');
  if (!password.contains(RegExp(r'[a-z]')))
    missingCriteria.add('a lowercase letter');
  if (!password.contains(RegExp(r'\d'))) missingCriteria.add('a number');
  if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')))
    missingCriteria.add('a special character');
  if (password.length < 8) missingCriteria.add('at least 8 characters');

  if (missingCriteria.isEmpty) return '';
  return 'Password must contain: ${missingCriteria.join(', ')}';
}
