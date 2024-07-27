import 'package:skill_swap/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String mySkill;
  final String skillNeeded;
  // final String skillOfferedDescription;
  // final String skillRequiredDescription;
  final String skillImage;
  final String username;
  final String userAddress;
  final String isOnline;
  final DateTime dateTime;
  final String profileImage;

  PostModel({
    required this.mySkill,
    required this.skillNeeded,
    // required this.skillOfferedDescription,
    // required this.skillRequiredDescription,
    required this.skillImage,
    required this.username,
    required this.userAddress,
    required this.isOnline,
    required this.dateTime,
    required this.profileImage,
  });

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      mySkill: map[AppConstant.kMySkill] ?? '',
      skillNeeded: map[AppConstant.kSkillNeeded] ?? '',
      // skillOfferedDescription: map['skillOfferedDescription'] ?? '',
      // skillRequiredDescription: map['skillRequiredDescription'] ?? '',
      skillImage: map[AppConstant.kSkillImageUrl] ?? '',
      username: map[AppConstant.kFullname] ?? '',
      userAddress: map[AppConstant.kAddress] ?? '',
      isOnline: map[AppConstant.kIsOnline] ?? '',
      dateTime: (map[AppConstant.kTime] as Timestamp).toDate(),
      profileImage: map[AppConstant.kProfileImageUrl] ?? '',
    );
  }
}
