import 'package:get/get.dart';
import 'package:skill_swap/core/theming/assets.dart';
import 'package:skill_swap/data/models/onboarding_model.dart';
import 'package:skill_swap/generated/l10n.dart';

List<OnboardingModel> onBoardingList = [
  OnboardingModel(
    title: S.of(Get.context!).onBoardingTitle1,
    description: S.of(Get.context!).onBoardingSubtitle1,
    image: Assets.imagesOnboarding1,
  ),
  OnboardingModel(
    title: S.of(Get.context!).onBoardingTitle2,
    description: S.of(Get.context!).onBoardingSubtitle2,
    image: Assets.imagesOnboarding2,
  ),
  OnboardingModel(
    title: S.of(Get.context!).onBoardingTitle3,
    description: S.of(Get.context!).onBoardingSubtitle3,
    image: Assets.imagesOnboarding3,
  ),
  OnboardingModel(
    title: S.of(Get.context!).onBoardingTitle4,
    description: S.of(Get.context!).onBoardingSubtitle4,
    image: Assets.imagesOnboarding4,
  ),
];
