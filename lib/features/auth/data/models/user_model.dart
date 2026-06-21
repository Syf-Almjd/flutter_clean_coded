import 'package:flutter_clean_coded/shared/models/image_model.dart';
import 'package:flutter_clean_coded/features/auth/domain/entities/user.dart';

/// Data Transfer Object (DTO) for User serialization/deserialization.
class UserModel extends UserEntity {
  final String password;

  UserModel({
    required super.userId,
    required super.username,
    required super.firstName,
    required super.lastName,
    required super.email,
    required this.password,
    required super.phone,
    required super.gender,
    required super.userRole,
    required super.userType,
    required super.userStatus,
    required super.image,
    required super.createdAt,
    required super.updatedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: (json['userId'] ?? 0.0).toInt(),
      username: json['username'] ?? "",
      firstName: json['firstName'] ?? "",
      lastName: json['lastName'] ?? "",
      image: ImageModel.fromJson(json['image']),
      email: json['email'] ?? "",
      password: json['password'] ?? "",
      phone: json['phone'] ?? "",
      gender: json['gender'] ?? "",
      userRole: json['userRole'] ?? "",
      userStatus: json['userStatus'] ?? "",
      userType: json['userType'] ?? "",
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt']).toLocal()
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt']).toLocal()
          : DateTime.now(),
    );
  }

  factory UserModel.loadingUser() {
    return UserModel(
      userId: 0,
      username: "Loading",
      firstName: "Loading",
      image: ImageModel(
        imageId: 0,
        imageIndex: 0,
        imageUrl: 'https://loading.io/assets/mod/spinner/spinner/lg.gif',
        uploadedAt: '',
      ),
      lastName: "",
      email: "Loading",
      password: "",
      phone: "",
      gender: "",
      userRole: "",
      userType: "",
      createdAt: DateTime.now(),
      userStatus: '',
      updatedAt: DateTime.now(),
    );
  }

  Map<String, dynamic> toLocalJson() {
    return {
      'userId': userId,
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      "image": image.toFullJson(),
      'password': password,
      'phone': phone,
      'gender': gender,
      'userRole': userRole,
      'userStatus': userStatus,
      'userType': userType,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  Map<String, dynamic> toServerJson() {
    String? nullPass = password;
    if (password.isEmpty || password == "null") {
      nullPass = null;
    }

    return {
      'username': username,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'password': nullPass,
      'gender': gender,
      "image": image.toUploadJson(),
    };
  }
}
