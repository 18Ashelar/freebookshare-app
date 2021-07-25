import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freebookshare/Components/CircularLoader.dart';
import 'package:freebookshare/Components/CustomSnackbar.dart';
import 'package:freebookshare/Constants.dart';
import 'package:freebookshare/FirebaseServices/UserFirebaseService.dart';
import 'package:freebookshare/Getters%20And%20Setters/UserInfo.dart';
import 'package:freebookshare/Login%20and%20Registration/Components/LoginInputFormField.dart';
import 'package:freebookshare/Screens/ImageTapZoom.dart';
import 'package:freebookshare/SizeConfig.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'Components/ProfileFileValidator.dart';
import 'Components/ProfileUpdateButton.dart';

class Profileupdate extends StatefulWidget {
  static String id = "Profile_Update";

  @override
  _ProfileupdateState createState() => _ProfileupdateState();
}

class _ProfileupdateState extends State<Profileupdate>
    with SingleTickerProviderStateMixin {
  bool _isProgress = false;
  TabController _tabControl;
  FirebaseServices service = FirebaseServices();
  final _profilePageFormKey = GlobalKey<FormState>();
  String _myActivity;
  String imgUrl;

  @override
  void initState() {
    _fetchUserData();
    _tabControl = new TabController(length: 2, vsync: this);
    super.initState();
  }

  //For personal Details
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();
  TextEditingController _nickName = TextEditingController();
  TextEditingController _age = TextEditingController();

  //for Contact Details
  TextEditingController _country = TextEditingController();
  TextEditingController _phoneNo = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _pinCode = TextEditingController();

  //This method fetch user data
  void _fetchUserData() async {
    try {
      setState(() {
        _isProgress = true;
      });
      service.userProfileData().then((ds) {
        if (ds.exists) {
          Map<String, dynamic> data = ds.data() as Map<String, dynamic>;
          Map<String, dynamic> contact =
              data["contact"] as Map<String, dynamic>;
          setState(() {
            _firstName.text = data["firstname"];
            _lastName.text = data["lastname"];
            _nickName.text = data["nickname"];
            _age.text = data["age"];
            _phoneNo.text = contact["phone_no"];
            _city.text = contact["city"];
            _country.text = contact["country"];
            _pinCode.text = contact["pin_code"];
            imgUrl = data["profile_image"];
            _myActivity = data["gender"];
            _isProgress = false;
          });
        } else {
          setState(() {
            _isProgress = false;
          });
        }
      });
    } catch (e) {
      setState(() {
        _isProgress = false;
      });
      print(e);
    }
  }

  //Image that get from profile Image
  File profileImage;
  final ImagePicker _picker = ImagePicker();

  getImage(ImageSource imageSource) async {
    setState(() {
      _isProgress = true;
    });
    try {
      PickedFile image = await _picker.getImage(
          source: imageSource, preferredCameraDevice: CameraDevice.front);

      File imageFile = File(image.path);
      if (imageFile != null) {
        File croppedImage = await ImageCropper.cropImage(
            sourcePath: imageFile.path,
            // aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
            compressFormat: ImageCompressFormat.jpg,
            compressQuality: 70,
            androidUiSettings: AndroidUiSettings(
              toolbarColor: kPrimaryColor,
              toolbarWidgetColor: Colors.white,
            ));

        setState(() {
          profileImage = croppedImage;
          _isProgress = false;
        });
      } else {
        setState(() {
          _isProgress = false;
        });
      }
    } catch (e) {
      setState(() {
        _isProgress = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SafeArea(
        child: Stack(children: [
          Container(
            margin: EdgeInsets.symmetric(
                vertical: getProportionateScreenHeight(30)),
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(30)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                profileUpdate(),
                Container(
                  margin:
                      EdgeInsets.only(top: getProportionateScreenHeight(50)),
                  child: TabBar(
                    labelColor: Color(0xFFf12b96),
                    indicatorColor: Color(0xFFf12b96),
                    unselectedLabelColor: Color(0xFFef97d0),
                    tabs: [
                      Tab(
                        child: Text(
                          "Personal Details",
                          style: TextStyle(
                            fontSize: getProportionateScreenHeight(18),
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Contact Details",
                          style: TextStyle(
                            fontSize: getProportionateScreenHeight(18),
                          ),
                        ),
                      )
                    ],
                    controller: _tabControl,
                    indicatorSize: TabBarIndicatorSize.tab,
                  ),
                ),
                Expanded(
                  child: Form(
                    key: _profilePageFormKey,
                    child: TabBarView(
                      children: [
                        SingleChildScrollView(
                          child: Container(
                            child: Column(
                              children: [
                                SizedBox(
                                    height: getProportionateScreenHeight(25)),
                                InputTextField(
                                  validator: ProfileFormValidator.firstName,
                                  controller: _firstName,
                                  obscureText: false,
                                  textAlign: TextAlign.start,
                                  textInputType: TextInputType.name,
                                  hintText: 'First Name',
                                ),
                                SizedBox(
                                    height: getProportionateScreenHeight(25)),
                                InputTextField(
                                  validator: ProfileFormValidator.lastName,
                                  controller: _lastName,
                                  obscureText: false,
                                  textAlign: TextAlign.start,
                                  textInputType: TextInputType.name,
                                  hintText: 'Last Name',
                                ),
                                SizedBox(
                                    height: getProportionateScreenHeight(25)),
                                InputTextField(
                                  validator: ProfileFormValidator.nickName,
                                  controller: _nickName,
                                  obscureText: false,
                                  textAlign: TextAlign.start,
                                  textInputType: TextInputType.name,
                                  hintText: 'Nick Name',
                                ),
                                SizedBox(
                                    height: getProportionateScreenHeight(25)),
                                InputTextField(
                                  validator: ProfileFormValidator.age,
                                  controller: _age,
                                  obscureText: false,
                                  textAlign: TextAlign.start,
                                  textInputType: TextInputType.name,
                                  hintText: 'Age',
                                ),
                                SizedBox(
                                    height: getProportionateScreenHeight(25)),
                                Container(
                                  child: DropdownSearch<String>(
                                    dropdownSearchDecoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical:
                                              getProportionateScreenHeight(5),
                                          horizontal:
                                              getProportionateScreenWidth(20)),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(32.0)),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: kPrimaryColor, width: 1.0),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(32.0)),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: kPrimaryColor, width: 2.0),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(32.0)),
                                      ),
                                    ),
                                    items: ["Male", "Female", "Transgender"],
                                    maxHeight:
                                        getProportionateScreenHeight(200),
                                    hint: "Gender",
                                    selectedItem: _myActivity,
                                    onChanged: (value) {
                                      setState(() {
                                        _myActivity = value;
                                      });
                                    },
                                    showSearchBox: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          child: Container(
                            child: Column(
                              children: [
                                SizedBox(
                                    height: getProportionateScreenHeight(25)),
                                InputTextField(
                                  validator: ProfileFormValidator.phoneNo,
                                  controller: _phoneNo,
                                  textAlign: TextAlign.start,
                                  obscureText: false,
                                  textInputType: TextInputType.number,
                                  hintText: 'Phone No',
                                ),
                                SizedBox(
                                    height: getProportionateScreenHeight(25)),
                                InputTextField(
                                  validator: ProfileFormValidator.countryName,
                                  controller: _country,
                                  obscureText: false,
                                  textAlign: TextAlign.start,
                                  textInputType: TextInputType.name,
                                  hintText: 'Country',
                                ),
                                SizedBox(
                                    height: getProportionateScreenHeight(25)),
                                InputTextField(
                                  validator: ProfileFormValidator.cityName,
                                  controller: _city,
                                  obscureText: false,
                                  textAlign: TextAlign.start,
                                  textInputType: TextInputType.name,
                                  hintText: 'City',
                                ),
                                SizedBox(
                                    height: getProportionateScreenHeight(25)),
                                InputTextField(
                                  validator: ProfileFormValidator.pinCode,
                                  controller: _pinCode,
                                  textAlign: TextAlign.start,
                                  obscureText: false,
                                  textInputType: TextInputType.number,
                                  hintText: 'Pin Code',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                      controller: _tabControl,
                    ),
                  ),
                ),
              ],
            ),
          ),
          (_isProgress) ? CircularLoading() : Center()
        ]),
      ),
    );
  }

  Widget profileUpdate() {
    if (profileImage != null) {
      return SizedBox(
        height: getProportionateScreenHeight(160),
        width: getProportionateScreenWidth(160),
        child: Stack(clipBehavior: Clip.none, fit: StackFit.expand, children: [
          CircleAvatar(
            backgroundImage: FileImage(profileImage),
          ),
          Positioned(
            right: 5,
            bottom: 2,
            child: ProfileUpdateButton(
              getImage: getImage,
            ),
          )
        ]),
      );
    } else {
      if (imgUrl != null) {
        return SizedBox(
          height: getProportionateScreenHeight(150),
          width: getProportionateScreenWidth(150),
          child:
              Stack(clipBehavior: Clip.none, fit: StackFit.expand, children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return ImageZoomTap(
                    imgUrl: imgUrl,
                  );
                }));
              },
              child: Hero(
                tag: 'imageHero',
                child: CachedNetworkImage(
                  imageUrl: imgUrl,
                  imageBuilder: (context, imageProvider) => CircleAvatar(
                    backgroundImage: imageProvider,
                  ),
                  placeholder: (context, url) => Container(
                    color: kBackgroundColor,
                    height: getProportionateScreenHeight(150),
                    width: getProportionateScreenWidth(150),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: kPrimaryColor,
                        strokeWidth: 5,
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) {
                    return SizedBox(
                      height: getProportionateScreenHeight(150),
                      width: getProportionateScreenWidth(150),
                      child: CircleAvatar(
                        backgroundColor: Color(0xFFE0E0E0),
                        child: Icon(
                          Icons.warning_outlined,
                          size: getProportionateScreenHeight(50),
                          color: Colors.black,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Positioned(
              right: 5,
              bottom: 2,
              child: ProfileUpdateButton(
                getImage: getImage,
              ),
            )
          ]),
        );
      }
      return SizedBox(
        height: getProportionateScreenHeight(150),
        width: getProportionateScreenWidth(150),
        child: Stack(clipBehavior: Clip.none, fit: StackFit.expand, children: [
          CircleAvatar(
            backgroundImage: AssetImage("assets/Avtar.png"),
          ),
          Positioned(
            right: 5,
            bottom: 2,
            child: ProfileUpdateButton(
              getImage: getImage,
            ),
          )
        ]),
      );
    }
  }

  bool validate() {
    final form = _profilePageFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    } else {
      return false;
    }
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back,
            color: Color(0xFFf12b96), size: getProportionateScreenHeight(25)),
        onPressed: () => Navigator.of(context).pop(),
      ),
      elevation: 0,
      actions: [
        TextButton(
          onPressed: () async {
            if (validate()) {
              if (profileImage != null || imgUrl != null) {
                //When user don't want to update profile photo
                if (imgUrl != null && profileImage == null) {
                  setState(() {
                    _isProgress = true;
                  });
                  UserProfile ob = new UserProfile(
                      _firstName.text,
                      _lastName.text,
                      _nickName.text,
                      _age.text,
                      _myActivity,
                      _country.text,
                      _phoneNo.text,
                      _city.text,
                      _pinCode.text,
                      imgUrl);
                  service.addUserProfileData(ob).then((value) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(CustomSnackbar.snackBar);

                    setState(() {
                      _isProgress = false;
                      print("User Profile Updated");
                    });
                  }).catchError((e) {
                    setState(() {
                      _isProgress = false;
                    });
                    ScaffoldMessenger.of(context)
                        .showSnackBar(CustomSnackbar.errorSnackBar);
                  });
                } else {
                  setState(() {
                    _isProgress = true;
                  });
                  var url = await service.addUserProfilePhoto(profileImage);
                  UserProfile ob = new UserProfile(
                      _firstName.text,
                      _lastName.text,
                      _nickName.text,
                      _age.text,
                      _myActivity,
                      _country.text,
                      _phoneNo.text,
                      _city.text,
                      _pinCode.text,
                      url);
                  service.addUserProfileData(ob).then((value) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(CustomSnackbar.snackBar);

                    setState(() {
                      _isProgress = false;
                      print("User Profile Updated");
                    });
                  }).catchError((e) {
                    setState(() {
                      _isProgress = false;
                    });
                    ScaffoldMessenger.of(context)
                        .showSnackBar(CustomSnackbar.errorSnackBar);
                  });
                }
              } else {
                ScaffoldMessenger.of(context)
                    .showSnackBar(CustomSnackbar.profilePhotoValidateSnackbar);
              }
            }
          },
          child: Text("SAVE"),
          style: TextButton.styleFrom(
            textStyle: TextStyle(
              fontSize: getProportionateScreenHeight(20),
            ),
            primary: Color(0xFFf12b96),
          ),
        )
      ],
      title: Text(
        "Update Your Profile",
        style: TextStyle(
          fontSize: getProportionateScreenHeight(20),
          color: Color(0xFFf12b96),
        ),
      ),
      backgroundColor: kBackgroundColor,
    );
  }
}
