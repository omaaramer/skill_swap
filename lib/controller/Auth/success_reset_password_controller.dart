import 'package:get/get.dart';
import 'package:skill_swap/core/routing/routes.dart';

abstract class SuccessResetPasswordController extends GetxController {
  goToPageLogin();
}

class SuccessResetPasswordControllerImp extends SuccessResetPasswordController {
  @override
  goToPageLogin() {
    Get.offAllNamed(Routes.signInScreen);
  }
}
