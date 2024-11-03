import 'package:skill_swap/constant.dart';

class UserModel {
  final String fullname;
  final String profileImageUrl;
  final String jopTitle;
  final String address;
  final String userId;
  final String? phone;
  final DateTime? birthDate;

  UserModel({
    this.phone,
    this.birthDate,
    required this.jopTitle,
    required this.userId,
    required this.address,
    required this.fullname,
    required this.profileImageUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      // phone: map[AppConstant.kPhone],
      // birthDate: DateTime.parse(map[AppConstant.kBirthDate]),
      jopTitle: map[AppConstant.kJopTitle],
      address: map[AppConstant.kAddress],
      fullname: map[AppConstant.kFullname],
      profileImageUrl: map[AppConstant.kProfileImageUrl],
      userId: map[AppConstant.kId],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      AppConstant.kJopTitle: jopTitle,
      AppConstant.kAddress: address,
      AppConstant.kFullname: fullname,
      AppConstant.kProfileImageUrl: profileImageUrl,
      AppConstant.kId: userId,
      AppConstant.kPhone: phone,
      AppConstant.kBirthDate: birthDate!.toIso8601String(),
    };
  }
}
