import 'package:cloud_firestore/cloud_firestore.dart';

class SkillRequestModel {
  final String userId;
  final String fullname;
  final String skill;
  final String? skillImageUrl;
  final String jopTitle;
  final String postId;
  final Timestamp timestamp;

  SkillRequestModel({
    required this.userId,
    required this.fullname,
    required this.skill,
    required this.skillImageUrl,
    required this.jopTitle,
    required this.postId,
    required this.timestamp,
  });

  factory SkillRequestModel.fromDocumentSnapshot(
      DocumentSnapshot documentSnapshot) {
    return SkillRequestModel(
      userId: documentSnapshot['userId'],
      fullname: documentSnapshot['fullname'],
      skill: documentSnapshot['skill'],
      skillImageUrl: documentSnapshot['skillImageUrl'],
      jopTitle: documentSnapshot['jopTitle'],
      postId: documentSnapshot['postId'],
      timestamp: documentSnapshot['timestamp'],
    );
  }
}
