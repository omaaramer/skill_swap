import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:skill_swap/core/theming/colores.dart';

class CustomDottedBorder extends StatelessWidget {
  const CustomDottedBorder({
    super.key,
    required this.imageUrl,
    required this.onPressed,
    required this.onTap,
  });

  final void Function() onPressed;
  final String? imageUrl;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      radius: const Radius.circular(20),
      dashPattern: const [7, 7],
      color: AppColors.lightBlack,
      strokeWidth: 2,
      padding: const EdgeInsets.all(20),
      child: Container(
        height: 100,
        width: 100,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.primary,
          boxShadow: [
            BoxShadow(
              blurRadius: 8,
              spreadRadius: 2,
              color: AppColors.background,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: imageUrl == null
            ? IconButton(
                icon: const Icon(
                  Icons.upload_rounded,
                  color: AppColors.white,
                  size: 40,
                ),
                onPressed: onPressed,
              )
            : InkWell(
                onTap: onTap,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl!,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Padding(
                      padding: EdgeInsets.all(12),
                      child: CircularProgressIndicator(
                        color: AppColors.white,
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      color: AppColors.red,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}








// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:skill_swap/core/theming/colores.dart';

// class CustomDottedBorder extends StatelessWidget {
//   const CustomDottedBorder({
//     super.key,
//     required this.imageUrl,
//     required this.onPressed,
//     required this.onTap,
//   });
//   final void Function() onPressed;
//   final String? imageUrl;
//   final void Function() onTap;

//   @override
//   Widget build(BuildContext context) {
//     return DottedBorder(
//       borderType: BorderType.RRect,
//       radius: const Radius.circular(20),
//       dashPattern: const [7, 7],
//       color: Colors.black38,
//       strokeWidth: 2,
//       padding: const EdgeInsets.fromLTRB(75, 25, 75, 25),
//       child: Container(
//         height: 70,
//         width: 70,
//         decoration: const BoxDecoration(
//             shape: BoxShape.circle,
//             color: AppColors.primary,
//             boxShadow: [
//               BoxShadow(spreadRadius: 6, color: Colors.black38),
//             ]),
//         child: imageUrl == null
//             ? IconButton(
//                 icon: const Icon(
//                   Icons.upload_rounded,
//                   color: Colors.white,
//                   size: 30,
//                 ),
//                 onPressed: onPressed,
//               )
//             : InkWell(
//                 onTap: onTap,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(35),
//                   child: CachedNetworkImage(
//                     imageUrl: imageUrl!,
//                     fit: BoxFit.cover,
//                     placeholder: (context, url) => const Padding(
//                       padding: EdgeInsets.all(12),
//                       child: CircularProgressIndicator(
//                         color: Colors.white,
//                       ),
//                     ),
//                     errorWidget: (context, url, error) =>
//                         const Icon(Icons.error),
//                   ),
//                 ),
//               ),
//       ),
//     );
//   }
// }
