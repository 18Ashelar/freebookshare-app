class userData {
  String _Password;
  String _EmailId;
  String _CityName;
  int _pinCode;

  String get Password => _Password;

  set Password(String value) {
    _Password = value;
  }

  String get EmailId => _EmailId;

  int get pinCode => _pinCode;

  set pinCode(int value) {
    _pinCode = value;
  }

  String get CityName => _CityName;

  set CityName(String value) {
    _CityName = value;
  }

  set EmailId(String value) {
    _EmailId = value;
  }
}
