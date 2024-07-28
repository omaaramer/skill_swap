import 'package:get/get.dart';

String? validInput(String val, int min, int max, String type) {
  if (val.isEmpty) {
    return "Field can't be empty";
  }

  if (val.length < min) {
    return "Can't be less than $min characters";
  }

  if (val.length > max) {
    return "Can't be more than $max characters";
  }

  switch (type) {
    case "username":
      if (!GetUtils.isUsername(val)) {
        return "Not a valid username";
      }
      break;

    case "email":
      if (!GetUtils.isEmail(val)) {
        return "Not a valid email";
      }
      break;

    // case "text":
    //   if (!GetUtils.isLengthLessThan(val, 3)) {
    //     return "Can't be less than $min characters";
    //   }
    //   break;

    case "phone":
      if (!GetUtils.isPhoneNumber(val)) {
        return "Not a valid phone number";
      }
      break;

    case "password":
      if (!GetUtils.isLengthGreaterOrEqual(val, 6)) {
        return "Password must be at least 6 characters long";
      }
      break;

    // default:
    //   return "Invalid type specified";
  }

  return null; // Valid input
}
