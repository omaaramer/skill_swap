class SwapRequest {
  final String receiverName;
  final String receiverJopTitle;
  final String receiverImage;
  final String senderImage;
  final String receiverSkill;
  final String senderId;
  final String senderName;
  final String senderJopTitle;
  final String senderSkill;
  final String skillImage;
  final String receiverId;
  final String receiverSkillId;
  final String status; // pending, accepted, rejected
  final DateTime requestTime;

  SwapRequest({
    required this.receiverJopTitle,
    required this.receiverImage,
    required this.senderImage,
    required this.senderJopTitle,
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
        receiverJopTitle: json['receiverJopTitle'],
        receiverImage: json['receiverImage'],
        senderImage: json['senderImage'],
        senderJopTitle: json['senderJopTitle'],
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
        'receiverJopTitle': receiverJopTitle,
        'receiverImage': receiverImage,
        'senderImage': senderImage,
        'senderJopTitle': senderJopTitle,
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
