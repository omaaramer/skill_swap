import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skill_swap/controller/Add%20Skills/get_user_controller.dart';
import 'package:skill_swap/controller/profile/pick_photo_controller.dart';
import 'package:skill_swap/core/theming/colores.dart';
import 'package:skill_swap/core/widgets/show_photo_bottom_sheet.dart';
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
                CustomCardImage(
                  height: 140.sp,
                  imageUrl:
                      "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80",
                ),
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
                              source: source,
                              userId: userController.user.value!.userId,
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
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    CircleAvatar(
                      radius: 60.sp,
                      backgroundImage: controller.selectedImage.value != null
                          ? FileImage(controller.selectedImage.value!)
                          : NetworkImage(
                              userController.user.value?.profileImageUrl ??
                                  'https://via.placeholder.com/150', // Fallback image
                            ) as ImageProvider,
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
                                source: source,
                                userId: userController.user.value!.userId,
                              );
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
