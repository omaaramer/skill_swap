import 'package:get/get.dart';

class MyTranslation extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "en": {
          "onBoardingTitle1": "Welcome to Skill Swap!",
          "onBoardingSubtitle1":
              "Discover a community where you can learn new skills and share your expertise with others. Let\'s get started!",
        },
        "ar": {
          "onBoardingTitle1": "مرحبا بك في Skill Swap!",
          "onBoardingSubtitle1":
              "تصفح مجتمعًا مناسبًا للتعلم من المهارات الجديدة والتواصل مع الشخصيات الاخرى. قم بالبدء الان!",
        },
      };
}
