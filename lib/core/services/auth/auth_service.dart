// lib/core/services/auth/auth_service.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebi_project/core/exceptions/auth_exceptions/auth_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get current auth user
  User? get currentUser => _firebaseAuth.currentUser;

  // Handle Firebase Auth exceptions
  AuthException _handleAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case 'invalid-email':
        return AuthException('Invalid email address');
      case 'user-disabled':
        return AuthException('This user has been disabled');
      case 'user-not-found':
        return AuthException('User not found');
      case 'wrong-password':
        return AuthException('Incorrect password');
      case 'email-already-in-use':
        return AuthException('Email already in use');
      case 'operation-not-allowed':
        return AuthException('Operation not allowed');
      case 'weak-password':
        return AuthException('Password is too weak');
      case 'network-request-failed':
        return AuthException('Network error. Check your connection');
      default:
        return AuthException(e.message ?? 'Authentication error');
    }
  }
}
