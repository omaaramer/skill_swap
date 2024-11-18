import 'package:intl/intl.dart';

class MyFunctions {
  static bool isArabic() {
    if (Intl.getCurrentLocale() == 'ar') {
      return true;
    } else {
      return false;
    }
  }
}
