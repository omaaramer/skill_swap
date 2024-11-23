import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skill_swap/controller/Add%20Skills/get_user_controller.dart';
import 'package:skill_swap/controller/profile/pick_photo_controller.dart';
import 'package:skill_swap/core/theming/assets.dart';
import 'package:skill_swap/core/theming/colores.dart';
import 'package:skill_swap/core/widgets/show_photo_bottom_sheet.dart';
import 'package:skill_swap/data/models/image_pick_prams.dart';
import 'package:skill_swap/view/home_page/widgets/card_image.dart';

class EditeProfileHeader extends StatelessWidget {
  const EditeProfileHeader({
    super.key,
    required this.userController,
  });

  final GetUserControllerImpl userController;

  @override
  Widget build(BuildContext context) {
    // Ensure ImageControllerImpl is initialized globally
    final ImageControllerImpl imageController = Get.put(ImageControllerImpl());

    return SizedBox(
      height: 170.sp,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          // Top Background Image
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                GetX<ImageControllerImpl>(builder: (controller) {
                  return

                      //  Container(
                      //   height: 140.sp,
                      //   width: double.infinity,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(8),
                      //     image: DecorationImage(
                      //       image: NetworkImage(
                      //         controller.selectedCoverImage.value != null
                      //             ? controller.selectedCoverImage.value!.path
                      //             : userController.user.value?.profileCoverImage ??
                      //                 'https://via.placeholder.com/150',
                      //       ),
                      //       fit: BoxFit.cover,
                      //     ),
                      //   ),
                      // );

                      CustomCardImage(
                    height: 140.sp,
                    imageUrl: controller.selectedCoverImage.value != null
                        ? controller.selectedCoverImage.value!.path
                        : userController.user.value?.profileCoverImage ??
                            'https://via.placeholder.com/150',
                  );
                }),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 16.sp,
                    backgroundColor: AppColors.background,
                    child: IconButton(
                      onPressed: () {
                        // Handle background image change
                        showPhotoBottomSheet(
                          context: context,
                          onTap: (ImageSource source) {
                            imageController.pickImage(
                              params: ImagePickParams(
                                isProfileImage: false,
                                source: source,
                                userId: userController.user.value!.userId,
                              ),
                            );
                          },
                        );
                      },
                      icon: Icon(IconBroken.Camera, size: 20.sp),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Profile Image
          GetX<ImageControllerImpl>(
            builder: (controller) {
              return CircleAvatar(
                radius: 62.sp,
                backgroundColor: AppColors.background,
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    CircleAvatar(
                      radius: 60.sp,
                      backgroundImage: controller.selectedProfileImage.value !=
                              null
                          ? FileImage(controller.selectedProfileImage.value!)
                          : NetworkImage(
                              userController.user.value?.profileImageUrl ??
                                  Assets.imagesPlaceholder, // Fallback image
                            ),
                    ),
                    CircleAvatar(
                      radius: 16.sp,
                      backgroundColor: AppColors.background,
                      child: IconButton(
                        onPressed: () {
                          showPhotoBottomSheet(
                            context: context,
                            onTap: (ImageSource source) {
                              imageController.pickImage(
                                  params: ImagePickParams(
                                isProfileImage: true,
                                source: source,
                                userId: userController.user.value!.userId,
                              ));
                            },
                          );
                        },
                        icon: Icon(IconBroken.Camera, size: 20.sp),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
