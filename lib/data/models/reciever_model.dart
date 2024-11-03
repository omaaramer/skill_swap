class RecieverModel {
  final String receiverId;
  final String receiverName;
  final String skillId;
  final String skill;
  final String receiverJopTitle;
  final String receiverImage;
  final String? imageUrl;
  final String? jopTitle;

  RecieverModel({
    required this.receiverJopTitle,
    required this.receiverImage,
    required this.receiverId,
    required this.receiverName,
    required this.skillId,
    required this.skill,
    this.imageUrl,
    this.jopTitle,
  });
}
