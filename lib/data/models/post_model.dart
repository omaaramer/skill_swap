import 'package:hive/hive.dart';
import 'package:skill_swap/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'post_model.g.dart';

@HiveType(typeId: 0)
class SkillModel {
  @HiveField(0)
  final String? mySkill;
  @HiveField(1)
  final String? skillNeeded;
  @HiveField(2)
  final String? description;
  @HiveField(3)
  final String? skillImage;
  @HiveField(4)
  final bool isOnline; // Change to bool
  @HiveField(5)
  final DateTime dateTime;
  @HiveField(6)
  final String userId;
  @HiveField(7)
  final String? skillId;

  SkillModel({
    required this.skillId,
    required this.userId,
    required this.mySkill,
    required this.skillNeeded,
    this.description,
    required this.skillImage,
    required this.isOnline, // bool type
    required this.dateTime,
  });

  factory SkillModel.fromJson(Map<String, dynamic> map) {
    return SkillModel(
      skillImage: map[AppConstant.kSkillImageUrl] ?? '',
      skillId: map['skillId'] ?? '',
      mySkill: map[AppConstant.kMySkill] ?? '',
      skillNeeded: map[AppConstant.kSkillNeeded] ?? '',
      description: map[AppConstant.kMySkillDescription] ?? '',
      isOnline: map[AppConstant.kIsOnline] == false, // Safely cast to bool
      dateTime: (map[AppConstant.kTime] as Timestamp).toDate(),
      userId: map[AppConstant.kId],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'skillId': skillId,
      AppConstant.kMySkill: mySkill,
      AppConstant.kSkillNeeded: skillNeeded,
      AppConstant.kSkillNeededDescription: description,
      AppConstant.kSkillImageUrl: skillImage,
      AppConstant.kIsOnline: isOnline, // Stored as bool
      AppConstant.kTime: dateTime,
      AppConstant.kId: userId,
    };
  }
}
