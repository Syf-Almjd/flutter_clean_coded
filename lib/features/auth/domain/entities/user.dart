import 'package:flutter_clean_coded/shared/models/image_model.dart';

/// Pure domain representation of a user.
///
/// Contains business properties and has no dependencies on database/serialization libraries.
class UserEntity {
  final int userId;
  final String username;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String gender;
  final String userRole;
  final String userType;
  final String userStatus;
  final ImageModel image;
  final DateTime createdAt;
  final DateTime updatedAt;

  const UserEntity({
    required this.userId,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.gender,
    required this.userRole,
    required this.userType,
    required this.userStatus,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });
}
