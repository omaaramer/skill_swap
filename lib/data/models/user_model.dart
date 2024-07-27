import 'package:skill_swap/constant.dart';

class UserModel {
  final String fullname;
  final String profileImageUrl;
  final String address;
  final String userId;

  UserModel({
    required this.userId,
    required this.address,
    required this.fullname,
    required this.profileImageUrl,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      address: map[AppConstant.kAddress],
      fullname: map[AppConstant.kFullname],
      profileImageUrl: map[AppConstant.kProfileImageUrl],
      userId: map[AppConstant.kId],
    );
  }
}
