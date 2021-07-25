class BookFormValidator {
  static String title(String value) {
    if (value == null || value.isEmpty) {
      return 'title cannot be empty';
    }
    return null;
  }

  static String isbn(String value) {
    if (value == null || value.isEmpty) {
      return 'ISBN number cannot be empty';
    }
    return null;
  }
}
