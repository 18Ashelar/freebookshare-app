class Validator {
  static String _password;

  static String emailValidation(String value) {
    if (value == null || value.isEmpty) {
      return 'Email cannot be empty';
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return 'Please enter valid Email';
    }
    return null;
  }

  static String passwordValidation(String value) {
    _password = value;
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    } else if (value.length < 6) {
      return 'Password Length should be greater than 6';
    }
    return null;
  }

  static String confirmPasswordValidation(String value) {
    if (value == null || value.isEmpty) {
      return 'Password cannot be empty';
    } else if (value != _password) {
      return 'Password does not matched';
    }
    return null;
  }
}
