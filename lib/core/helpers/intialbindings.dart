import 'package:get/get.dart';
import 'package:skill_swap/controller/Auth/sign_up_controller.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    // Start
    Get.lazyPut(() => SignUpControllerImpl(), fenix: true);
  }
}
