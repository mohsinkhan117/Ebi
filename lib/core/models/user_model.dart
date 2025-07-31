// lib/core/models/user_model.dart

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String email;
  final String fullName;
  final String phoneNumber;
  final String address;
  final String role; // 'customer' or 'Ebi'
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? profileImageUrl;
  final String? fcmToken;

  UserModel({
    required this.uid,
    required this.email,
    required this.fullName,
    required this.phoneNumber,
    required this.address,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
    this.profileImageUrl,
    this.fcmToken,
  });

  // Convert UserModel to Map
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'address': address,
      'role': role,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
      'profileImageUrl': profileImageUrl,
      'fcmToken': fcmToken,
    };
  }

  // Create UserModel from Map
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      email: map['email'] ?? '',
      fullName: map['fullName'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      address: map['address'] ?? '',
      role: map['role'] ?? '',
      createdAt: (map['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      updatedAt: (map['updatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      profileImageUrl: map['profileImageUrl'],
      fcmToken: map['fcmToken'],
    );
  }

  // Create copy of UserModel with updated fields
  UserModel copyWith({
    String? email,
    String? fullName,
    String? phoneNumber,
    String? address,
    String? profileImageUrl,
    String? fcmToken,
  }) {
    return UserModel(
      uid: uid,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      role: role,
      createdAt: createdAt,
      updatedAt: DateTime.now(),
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      fcmToken: fcmToken ?? this.fcmToken,
    );
  }

  // Check if user is customer
  bool get isCustomer => role == 'customer';

  // Check if user is Ebi
  bool get isEbi => role == 'Ebi';
}
