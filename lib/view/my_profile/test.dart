// import 'package:flutter/material.dart';
// import 'package:skill_swap/core/theming/app_style.dart';

// class EditableTextWidget extends StatefulWidget {
//   @override
//   _EditableTextWidgetState createState() => _EditableTextWidgetState();
// }

// class _EditableTextWidgetState extends State<EditableTextWidget> {
//   bool isEditingSkills = false;
//   bool isEditingExperience = false;
//   bool isEditingRating = false;

//   TextEditingController skillsController = TextEditingController(text: '10');
//   TextEditingController experienceController = TextEditingController(text: '5');
//   TextEditingController ratingController = TextEditingController(text: '4.5');

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Editable Text'),
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(Icons.arrow_back),
//         ),
//       ),
//       body: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Column(
//             children: [
//               Text('Skills', style: AppStyle.styleRegular16Grey(context)),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     isEditingSkills = true;
//                   });
//                 },
//                 child: isEditingSkills
//                     ? SizedBox(
//                         width: 50,
//                         child: TextField(
//                           controller: skillsController,
//                           autofocus: true,
//                           onSubmitted: (value) {
//                             setState(() {
//                               isEditingSkills = false;
//                             });
//                           },
//                           style: AppStyle.blackTitle(context),
//                         ),
//                       )
//                     : Text(skillsController.text,
//                         style: AppStyle.blackTitle(context)),
//               ),
//             ],
//           ),
//           Column(
//             children: [
//               Text('Experience', style: AppStyle.styleRegular16Grey(context)),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     isEditingExperience = true;
//                   });
//                 },
//                 child: isEditingExperience
//                     ? SizedBox(
//                         width: 50,
//                         child: TextField(
//                           controller: experienceController,
//                           autofocus: true,
//                           onSubmitted: (value) {
//                             setState(() {
//                               isEditingExperience = false;
//                             });
//                           },
//                           style: AppStyle.blackTitle(context),
//                         ),
//                       )
//                     : Text(experienceController.text,
//                         style: AppStyle.blackTitle(context)),
//               ),
//             ],
//           ),
//           Column(
//             children: [
//               Text('Rating', style: AppStyle.styleRegular16Grey(context)),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     isEditingRating = true;
//                   });
//                 },
//                 child: isEditingRating
//                     ? SizedBox(
//                         width: 50,
//                         child: TextField(
//                           controller: ratingController,
//                           autofocus: true,
//                           onSubmitted: (value) {
//                             setState(() {
//                               isEditingRating = false;
//                             });
//                           },
//                           style: AppStyle.blackTitle(context),
//                         ),
//                       )
//                     : Text(ratingController.text,
//                         style: AppStyle.blackTitle(context)),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
