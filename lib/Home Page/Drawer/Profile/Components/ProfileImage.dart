// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:freebookshare/SizeConfig.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
//
// import '../../../../Constants.dart';
// import 'ProfileUpdateButton.dart';
//
// class ProfileImage extends StatefulWidget {
//   ProfileImage(this.profileImage);
//   File profileImage;
//
//   @override
//   _ProfileImageState createState() => _ProfileImageState();
// }
//
// class _ProfileImageState extends State<ProfileImage> {
//   final ImagePicker _picker = ImagePicker();
//
//   getImage(ImageSource imageSource) async {
//     PickedFile image = await _picker.getImage(
//         source: imageSource, preferredCameraDevice: CameraDevice.front);
//
//     File imageFile = File(image.path);
//     if (imageFile != null) {
//       File croppedImage = await ImageCropper.cropImage(
//           sourcePath: imageFile.path,
//           // aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
//           compressFormat: ImageCompressFormat.jpg,
//           compressQuality: 70,
//           maxWidth: 200,
//           androidUiSettings: AndroidUiSettings(
//             toolbarColor: kPrimaryColor,
//             toolbarWidgetColor: Colors.white,
//           ));
//
//       setState(() {
//         widget.profileImage = croppedImage;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (widget.profileImage != null) {
//       return SizedBox(
//         height: getProportionateScreenHeight(150),
//         width: getProportionateScreenWidth(150),
//         child: Stack(clipBehavior: Clip.none, fit: StackFit.expand, children: [
//           CircleAvatar(
//             backgroundImage: FileImage(widget.profileImage),
//           ),
//           Positioned(
//             right: 5,
//             bottom: 2,
//             child: ProfileUpdateButton(
//               getImage: getImage,
//             ),
//           )
//         ]),
//       );
//     } else {
//       return SizedBox(
//         height: getProportionateScreenHeight(150),
//         width: getProportionateScreenWidth(150),
//         child: Stack(clipBehavior: Clip.none, fit: StackFit.expand, children: [
//           CircleAvatar(
//             backgroundImage: AssetImage("assets/Avtar.png"),
//           ),
//           Positioned(
//             right: 5,
//             bottom: 2,
//             child: ProfileUpdateButton(
//               getImage: getImage,
//             ),
//           )
//         ]),
//       );
//     }
//   }
// }
