import 'package:get/get.dart';
import 'package:skill_swap/core/routing/routes.dart';

abstract class SuccessSignUpController extends GetxController {
  goToPageLogin();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  @override
  goToPageLogin() {
    Get.offAllNamed(Routes.signInScreen);
  }
}
