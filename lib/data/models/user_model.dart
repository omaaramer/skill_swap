import 'package:skill_swap/constant.dart';

class UserModel {
  final String fullname;
  final String profileImageUrl;
  final String? profileCoverImage;
  final String jobTitle; // Corrected spelling
  final String address;
  final String userId;
  final String? aboutMe;
  final String? bio;
  final String? phone;
  final DateTime? birthDate;

  UserModel({
    this.profileCoverImage,
    required this.fullname,
    required this.profileImageUrl,
    required this.jobTitle,
    required this.address,
    required this.userId,
    this.aboutMe,
    this.bio,
    this.phone,
    this.birthDate,
  });

  /// Factory constructor to create a UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      profileCoverImage: map[AppConstant.kProfileCoverImage],
      fullname: map[AppConstant.kFullname] ?? 'Unknown User',
      profileImageUrl: map[AppConstant.kProfileImageUrl] ?? '',
      jobTitle: map[AppConstant.kJobTitle] ?? 'Unspecified',
      address: map[AppConstant.kAddress] ?? 'No Address',
      userId: map[AppConstant.kId] ?? '',
      aboutMe: map[AppConstant.kAboutMe] ?? '',
      bio: map[AppConstant.kBio] ?? '',
      phone: map[AppConstant.kPhone],
      birthDate: map[AppConstant.kBirthDate] != null
          ? DateTime.tryParse(map[AppConstant.kBirthDate])
          : null,
    );
  }

  /// Method to convert UserModel into JSON
  Map<String, dynamic> toJson() {
    return {
      AppConstant.kProfileCoverImage: profileCoverImage,
      AppConstant.kFullname: fullname,
      AppConstant.kProfileImageUrl: profileImageUrl,
      AppConstant.kJobTitle: jobTitle,
      AppConstant.kAddress: address,
      AppConstant.kId: userId,
      AppConstant.kAboutMe: aboutMe,
      AppConstant.kBio: bio,
      AppConstant.kPhone: phone,
      AppConstant.kBirthDate: birthDate?.toIso8601String(),
    };
  }

  /// CopyWith method for immutability and updating specific fields
  UserModel copyWith({
    String? profileCoverImage,
    String? fullname,
    String? profileImageUrl,
    String? jobTitle,
    String? address,
    String? userId,
    String? aboutMe,
    String? bio,
    String? phone,
    DateTime? birthDate,
  }) {
    return UserModel(
      profileCoverImage: profileCoverImage ?? this.profileCoverImage,
      fullname: fullname ?? this.fullname,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      jobTitle: jobTitle ?? this.jobTitle,
      address: address ?? this.address,
      userId: userId ?? this.userId,
      aboutMe: aboutMe ?? this.aboutMe,
      bio: bio ?? this.bio,
      phone: phone ?? this.phone,
      birthDate: birthDate ?? this.birthDate,
    );
  }
}
