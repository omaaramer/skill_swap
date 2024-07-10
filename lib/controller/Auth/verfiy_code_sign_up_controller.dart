import 'package:get/get.dart';
import 'package:skill_swap/core/routing/routes.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp(String verfiyCodeSignUp);
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  String? verfiyCodeSignUp;

  @override
  checkCode() {}

  @override
  goToSuccessSignUp(verfiyCodeSignUp) async {
    Get.toNamed(Routes.successSignUpScreen);
  }

  @override
  void onInit() {
    // verfiyCodeSignUp = Get.arguments['email'];
    super.onInit();
  }

  reSend() {}
}
