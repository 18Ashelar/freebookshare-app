class ProfileFormValidator {
  static String firstName(String value) {
    if (value == null || value.isEmpty) {
      return 'firstname cannot be empty';
    }
    return null;
  }

  static String lastName(String value) {
    if (value == null || value.isEmpty) {
      return 'lastname cannot be empty';
    }
    return null;
  }

  static String nickName(String value) {
    if (value == null || value.isEmpty) {
      return 'nickname cannot be empty';
    }
    return null;
  }

  static String age(String value) {
    if (value == null || value.isEmpty) {
      return 'age cannot be empty';
    }
    return null;
  }

  static String phoneNo(String value) {
    if (value == null || value.isEmpty) {
      return 'Phone number cannot be empty';
    }
    return null;
  }

  static String countryName(String value) {
    if (value == null || value.isEmpty) {
      return 'country cannot be empty';
    }
    return null;
  }

  static String cityName(String value) {
    if (value == null || value.isEmpty) {
      return 'city cannot be empty';
    }
    return null;
  }

  static String pinCode(String value) {
    if (value == null || value.isEmpty) {
      return 'pin code cannot be empty';
    }
    return null;
  }
}
