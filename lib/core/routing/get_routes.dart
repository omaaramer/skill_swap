import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:skill_swap/core/middleware/middle_ware.dart';
import 'package:skill_swap/core/routing/routes.dart';
import 'package:skill_swap/view/home_page/add_skill_screen.dart';
import 'package:skill_swap/view/home_page/custom_skill_card.dart';
import 'package:skill_swap/view/user_info/personal_info_page_view.dart';
import 'package:skill_swap/view/user_info/components/slider.dart';
import 'package:skill_swap/view/user_info/personal_datails_1.dart';
import 'package:skill_swap/view/auth/forget_password_screen.dart';
import 'package:skill_swap/view/auth/reset_password.dart';
import 'package:skill_swap/view/auth/sign_in_screen.dart';
import 'package:skill_swap/view/auth/sign_up_screen.dart';
import 'package:skill_swap/view/auth/success_reset_password.dart';
import 'package:skill_swap/view/auth/success_sign_up.dart';
import 'package:skill_swap/view/auth/verfiy_code_sign_up.dart';
import 'package:skill_swap/view/auth/verify_screen.dart';
import 'package:skill_swap/view/home_page/home_page.dart';
import 'package:skill_swap/view/onBoarding/onboarding_pageView.dart';
import 'package:skill_swap/view/welcome_screen/welcome_screen.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(
    name: "/",
    page: () => FirebaseAuth.instance.currentUser != null &&
            FirebaseAuth.instance.currentUser!.emailVerified
        ? const EditProfile()
        : const OnBoardingPageView(),
    middlewares: [MyMiddleWare()],
  ),
  GetPage(
    name: Routes.welcomeScreen,
    page: () => const WelcomeScreen(),
  ),
  GetPage(
    name: Routes.signInScreen,
    page: () => const SignInScreen(),
  ),
  GetPage(
    name: Routes.signUpScreen,
    page: () => const SignUpScreen(),
  ),
  GetPage(
    name: Routes.verifyScreen,
    page: () => const VerifyCodeScreen(),
  ),
  GetPage(
      name: Routes.forgetPasswordScreen,
      page: () => const ForgetPasswordScreen()),
  GetPage(
      name: Routes.resetPasswordScreen,
      page: () => const ResetPasswordScreen()),
  GetPage(
      name: Routes.successSignUpScreen,
      page: () => const SuccessSignUpScreen()),
  GetPage(
      name: Routes.successResetPasswordScreen,
      page: () => const SuccessResetPasswordScreen()),
  GetPage(
      name: Routes.verifyCodeSignUpScreen,
      page: () => const VerifyCodeSignUpScreen()),
  GetPage(name: Routes.homePage, page: () => HomePage()),
  GetPage(name: Routes.userinfo, page: () => const PersonalDatailsOne()),
  GetPage(
      name: Routes.editProfilePageview,
      page: () => const EditProfilePageview()),
  GetPage(name: Routes.editProfile, page: () => const EditProfile()),
  GetPage(name: Routes.addSkillScreen, page: () => const AddSkillScreen()),
  // GetPage(
  //     name: Routes.detailedPostCard,
  //     page: () => const DetailedPostCard()),
];











// Map<String, Widget Function(BuildContext)> routes = {
//   Routes.onBoardingScrreen: (context) => const OnBoardingPageView(),
//   Routes.welcomeScreen: (context) => const WelcomeScreen(),
//   Routes.signInScreen: (context) => const SignInScreen(),
//   Routes.signUpScreen: (context) => const SignUpScreen(),
//   Routes.verifyScreen: (context) => const VerifyCodeScreen(),
//   Routes.forgetPasswordScreen: (context) => const ForgetPasswordScreen(),
//   Routes.resetPasswordScreen: (context) => const ResetPasswordScreen(),
//   Routes.successSignUpScreen: (context) => const SuccessSignUpScreen(),
//   Routes.successResetPasswordScreen: (context) =>
//       const SuccessResetPasswordScreen(),
//   Routes.verifyCodeSignUpScreen: (context) => const VerifyCodeSignUpScreen(),
// };
 