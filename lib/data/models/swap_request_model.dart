class SwapRequest {
  final String receiverName;
  final String receiverSkill;
  final String senderId;
  final String senderName;
  final String senderSkill;
  final String skillImage;
  final String receiverId;
  final String receiverSkillId;
  final String status; // pending, accepted, rejected
  final DateTime requestTime;

  SwapRequest({
    required this.senderName,
    required this.senderSkill,
    required this.receiverName,
    required this.receiverSkill,
    required this.skillImage,
    required this.senderId,
    required this.receiverId,
    required this.receiverSkillId,
    this.status = "pending",
    required this.requestTime,
  });

  factory SwapRequest.fromJson(Map<String, dynamic> json) => SwapRequest(
        senderName: json['senderName'],
        senderSkill: json['senderSkill'],
        receiverName: json['receiverName'],
        receiverSkill: json['receiverSkill'],
        skillImage: json['skillImage'],
        senderId: json['senderId'],
        receiverId: json['receiverId'],
        receiverSkillId: json['receiverSkillId'],
        status: json['status'],
        requestTime: DateTime.parse(json['requestTime']),
      );
  Map<String, dynamic> toJson() => {
        'senderName': senderName,
        'senderSkill': senderSkill,
        'receiverName': receiverName,
        'receiverSkill': receiverSkill,
        'skillImage': skillImage,
        'senderId': senderId,
        'receiverId': receiverId,
        'receiverSkillId': receiverSkillId,
        'status': status,
        'requestTime': requestTime.toIso8601String(),
      };
}
