import 'package:get/get.dart';
import 'package:skill_swap/core/routing/routes.dart';

abstract class VerifyCodeController extends GetxController {
  checkCod();
  goToResetPassword();
}

class VerifyCodeControllerImpl extends VerifyCodeController {
  late String verifyCode;
  @override
  checkCod() {
    throw UnimplementedError();
  }

  @override
  goToResetPassword() {
    Get.offNamed(Routes.resetPasswordScreen);
  }
}
