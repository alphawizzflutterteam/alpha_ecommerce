String? validateMobile(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a valid mobile number';
  } else if (value.length != 10) {
    return 'Invalid mobile number format.';
  }
  return null; // Validation passed
}

String? validateEmail(String? value) {
  final bool emailValid =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
              .hasMatch(value!) &&
          !value.startsWith('.');

  if (!emailValid) {
    return 'Invalid email format.';
  }
  return null; // Validation passed
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a password.';
  }
  if (value.length < 8) {
    return 'Password must be at least 8 characters.';
  }
  if (!value.contains(RegExp(r'[a-z]'))) {
    return 'Password must contain at least one lowercase letter.';
  }
  if (!value.contains(RegExp(r'[A-Z]'))) {
    return 'Password must contain at least one uppercase letter.';
  }
  if (!value.contains(RegExp(r'[0-9]'))) {
    return 'Password must contain at least one number.';
  }
  if (!value.contains(RegExp(r'[!@#\$%^&*()_+{}|:<>?~]'))) {
    return 'Password must contain at least one special character.';
  }
  return null;
}

String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter valid name';
  }
  return null;
}
