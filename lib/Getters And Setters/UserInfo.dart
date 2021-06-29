import 'package:freebookshare/Getters%20And%20Setters/ContactInfo.dart';

class UserProfile {
  String _firstName;
  String _lastName;
  String _nickName;
  String _age;
  String _gender;
  String _country;
  String _phoneNo;
  String _city;
  String _pinCode;
  String _profileImage;
  List<ContactInfo> contact;

  UserProfile(
      this._firstName,
      this._lastName,
      this._nickName,
      this._age,
      this._gender,
      this._country,
      this._phoneNo,
      this._city,
      this._pinCode,
      this._profileImage);

  String get gender => _gender;
  String get age => _age;
  String get nickName => _nickName;
  String get lastName => _lastName;
  String get firstName => _firstName;
  String get pinCode => _pinCode;
  String get city => _city;
  String get phoneNo => _phoneNo;
  String get country => _country;
  String get profileImage => _profileImage;
}
