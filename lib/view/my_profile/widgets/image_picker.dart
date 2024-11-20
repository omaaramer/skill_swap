// import 'dart:developer';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:skill_swap/core/theming/colores.dart';
// import 'package:skill_swap/core/widgets/custom_buttom.dart';
// import 'package:skill_swap/core/widgets/pick_image_bottom_sheet.dart';
// import 'package:skill_swap/generated/l10n.dart';

// // ignore: must_be_immutable
// class SetPhotoScreen extends StatefulWidget {
//   const SetPhotoScreen({super.key});

//   @override
//   State<SetPhotoScreen> createState() => _SetPhotoScreenState();
// }

// class _SetPhotoScreenState extends State<SetPhotoScreen> {
//   File? _image;

//   Future _pickImage(ImageSource source) async {
//     try {
//       final image = await ImagePicker().pickImage(source: source);
//       if (image == null) return;
//       File? img = File(image.path);
//       img = await _cropImage(imageFile: img);
//       setState(() {
//         _image = img;
//         Navigator.of(context).pop();
//       });
//     } on PlatformException catch (e) {
//       log(e.toString());
//       Get.back();
//     }
//   }

//   Future<File?> _cropImage({required File imageFile}) async {
//     CroppedFile? croppedImage =
//         await ImageCropper().cropImage(sourcePath: imageFile.path);
//     if (croppedImage == null) return null;
//     return File(croppedImage.path);
//   }

//   void _showSelectPhotoOptions(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(25.0),
//         ),
//       ),
//       builder: (context) => DraggableScrollableSheet(
//           initialChildSize: 0.28,
//           maxChildSize: 0.4,
//           minChildSize: 0.28,
//           expand: false,
//           builder: (context, scrollController) {
//             return SingleChildScrollView(
//               controller: scrollController,
//               child: PickImageBottomSheet(
//                 onTap: _pickImage,
//               ),
//             );
//           }),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Padding(
//           padding:
//               const EdgeInsets.only(left: 20, right: 20, bottom: 30, top: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Column(
//                 children: [
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         height: 30,
//                       ),
//                       Text(
//                         S.of(context).chooseImage,
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 8,
//                       ),
//                       Text(
//                         S.of(context).profilePictureMessage,
//                         style: TextStyle(
//                           fontSize: 18,
//                           color: Colors.black87,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               const Spacer(flex: 1),
//               Padding(
//                 padding: const EdgeInsets.all(28.0),
//                 child: Center(
//                   child: GestureDetector(
//                     behavior: HitTestBehavior.translucent,
//                     onTap: () {
//                       _showSelectPhotoOptions(context);
//                     },
//                     child: Center(
//                       child: Container(
//                           height: 200.0,
//                           width: 200.0,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Colors.grey.shade200,
//                           ),
//                           child: Center(
//                             child: _image == null
//                                 ? Text(
//                                     S.of(context).noImage,
//                                     style: TextStyle(fontSize: 20),
//                                   )
//                                 : CircleAvatar(
//                                     backgroundImage: FileImage(_image!),
//                                     radius: 200.0,
//                                   ),
//                           )),
//                     ),
//                   ),
//                 ),
//               ),
//               const Spacer(flex: 2),
//               AppTextButton(
//                 borderRadius: 50,
//                 buttonText: S.of(context).save,
//                 textStyle: const TextStyle(color: AppColors.white),
//                 onPressed: () => _showSelectPhotoOptions(context),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
