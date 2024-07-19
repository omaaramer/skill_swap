class PostModel {
  final String skillOffered;
  final String skillRequired;
  final String skillOfferedDescription;
  final String skillRequiredDescription;
  final String skillImage;
  final String username;
  final String userAddress;
  final Enum connectWay;
  final DateTime dateTime;
  final String profileImage;

  PostModel({
    required this.skillOffered,
    required this.skillRequired,
    required this.skillOfferedDescription,
    required this.skillRequiredDescription,
    required this.skillImage,
    required this.username,
    required this.userAddress,
    required this.connectWay,
    required this.dateTime,
    required this.profileImage,
  });
}
