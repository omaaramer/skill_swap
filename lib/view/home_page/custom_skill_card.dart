// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:skill_swap/controller/Add%20Skills/get_skill_post_data_controller.dart';
// import 'package:skill_swap/controller/Add%20Skills/get_user_controller.dart';
// import 'package:skill_swap/view/home_page/widgets/bottom_icon_bar.dart';
// import 'package:skill_swap/view/home_page/widgets/custom_divider.dart';
// import 'widgets/card_image.dart';
// import 'widgets/card_user_info_listile.dart';
// import 'widgets/skill_listile.dart';

// class DetailedPostCard extends StatelessWidget {
//   const DetailedPostCard({super.key});
 
//   @override
//   Widget build(BuildContext context) {
//     final userController = Get.find<GetUserControllerImpl>();
//     final postController = Get.find<GetSkillPostDataControllerImpl>();
//     return Padding(
//       padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
//       child: GestureDetector(
//         onTap: () {},
//         child: Container(
//           height: 510,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//             color: Colors.grey.shade300,
//           ),
//           child: Column(
//             children: [
//               CustomUserLisTile(
//                 name: userName,
//                 address: address,
//                 imageUrl: userImageUrl,
//               ),
//               const CustomCardDivider(),
//               const SizedBox(height: 10),
//               CustomCardImage(
//                 imageUrl: skillImageUrl,
//               ),
//               CustomSkillLisTile(
//                 title: 'WILL OFFER YOU',
//                 skill: mySkill,
//                 isOnline: isOnline,
//               ),
//               const CustomCardDivider(
//                 endIndent: 20,
//                 indent: 16,
//               ),
//               CustomSkillLisTile(
//                 title: 'IN EXPECTATION FOR',
//                 skill: skillNedded,
//                 isOnline: isOnline,
//               ),
//               const CustomCardDivider(),
//               const CardBottomIconBar()
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
