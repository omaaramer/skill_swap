import 'package:skill_swap/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String mySkill;
  final String skillNeeded;
  // final String skillOfferedDescription;
  // final String skillRequiredDescription;
  final String skillImage;
  final String isOnline;
  final DateTime dateTime;
  final String skillId;

  PostModel({
    required this.skillId,
    required this.mySkill,
    required this.skillNeeded,
    // required this.skillOfferedDescription,
    // required this.skillRequiredDescription,
    required this.skillImage,
    required this.isOnline,
    required this.dateTime,
  });

  factory PostModel.fromMap(Map<String, dynamic> map) {
    return PostModel(
      mySkill: map[AppConstant.kMySkill],
      skillNeeded: map[AppConstant.kSkillNeeded],
      // skillOfferedDescription: map['skillOfferedDescription'] ?? '',
      // skillRequiredDescription: map['skillRequiredDescription'] ?? '',
      skillImage: map[AppConstant.kSkillImageUrl],
      isOnline: map[AppConstant.kIsOnline],
      dateTime: (map[AppConstant.kTime] as Timestamp).toDate(),
      skillId: map[AppConstant.kId],
    );
  }
}
