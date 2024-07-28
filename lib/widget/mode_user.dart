import 'package:flutter/foundation.dart';

class User {
  final String firstName;
  final String secondName;
  final String profileImage;

  User({
    required this.firstName,
    required this.secondName,
    required this.profileImage,
  });

  User copyWith({
    String? firstName,
    String? secondName,
    String? profileImage,
  }) {
    return User(
      firstName: firstName ?? this.firstName,
      secondName: secondName ?? this.secondName,
      profileImage: profileImage ?? this.profileImage,
    );
  }
}
