import 'package:get/get.dart';
import 'package:skill_swap/core/middleware/middle_ware.dart';
import 'package:skill_swap/core/routing/routes.dart';
import 'package:skill_swap/view/edit_profile/edit_profile.dart';
import 'package:skill_swap/view/edit_profile/edit_profile_pageview.dart';
import 'package:skill_swap/view/edit_profile/user_info_screen.dart';
import 'package:skill_swap/view/auth/forget_password_screen.dart';
import 'package:skill_swap/view/auth/reset_password.dart';
import 'package:skill_swap/view/auth/sign_in_screen.dart';
import 'package:skill_swap/view/auth/sign_up_screen.dart';
import 'package:skill_swap/view/auth/success_reset_password.dart';
import 'package:skill_swap/view/auth/success_sign_up.dart';
import 'package:skill_swap/view/auth/verfiy_code_sign_up.dart';
import 'package:skill_swap/view/auth/verify_screen.dart';
import 'package:skill_swap/view/home_page.dart';
import 'package:skill_swap/view/onBoarding/onboarding_pageView.dart';
import 'package:skill_swap/view/welcome_screen/welcome_screen.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(
    name: Routes.onBoardingScrreen,
    page: () => const OnBoardingPageView(),
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
  GetPage(name: Routes.userinfo, page: () => UserInfo()),
  GetPage(name: Routes.editProfile, page: () => EditProfilePageview()),
  GetPage(name: "/", page: () => EditProfile()),
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
