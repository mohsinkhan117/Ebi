// lib/core/exceptions/auth_exceptions/auth_exceptions.dart

/// A custom exception class for handling authentication-related errors.
class AuthException implements Exception {
  /// The error message describing the authentication error.
  final String message;

  /// The error code associated with this exception (optional).
  final String? code;

  /// Creates a new [AuthException] with the given [message] and optional [code].
  AuthException(this.message, {this.code});

  @override
  String toString() {
    if (code != null) {
      return 'AuthException: [$code] $message';
    }
    return 'AuthException: $message';
  }
}

/// Exception thrown when user credentials are invalid.
class InvalidCredentialsException extends AuthException {
  InvalidCredentialsException() : super('Invalid email or password.');
}

/// Exception thrown when a user account doesn't exist.
class UserNotFoundException extends AuthException {
  UserNotFoundException() : super('User not found.', code: 'user-not-found');
}

/// Exception thrown when an email is already in use during registration.
class EmailAlreadyInUseException extends AuthException {
  EmailAlreadyInUseException()
    : super('Email is already in use.', code: 'email-already-in-use');
}

/// Exception thrown when a password is too weak during registration.
class WeakPasswordException extends AuthException {
  WeakPasswordException()
    : super(
        'Password is too weak. Please use a stronger password.',
        code: 'weak-password',
      );
}

/// Exception thrown when the user is not logged in but trying to access authenticated features.
class UserNotLoggedInException extends AuthException {
  UserNotLoggedInException()
    : super('User is not logged in.', code: 'user-not-logged-in');
}

/// Exception thrown when there's a network error during authentication.
class NetworkErrorException extends AuthException {
  NetworkErrorException()
    : super(
        'Network error. Please check your internet connection.',
        code: 'network-error',
      );
}

/// Exception thrown when a user account has been disabled.
class UserDisabledException extends AuthException {
  UserDisabledException()
    : super('User account has been disabled.', code: 'user-disabled');
}

/// Exception thrown when there's a server error during authentication.
class ServerErrorException extends AuthException {
  ServerErrorException()
    : super('Server error. Please try again later.', code: 'server-error');
}

/// Exception thrown when a user tries to access features without proper authorization.
class InsufficientPermissionsException extends AuthException {
  InsufficientPermissionsException()
    : super(
        'You do not have permission to perform this action.',
        code: 'insufficient-permissions',
      );
}

/// Exception thrown when a user account verification is required.
class EmailVerificationRequiredException extends AuthException {
  EmailVerificationRequiredException()
    : super(
        'Email verification required. Please check your email.',
        code: 'email-verification-required',
      );
}

/// Factory for creating the appropriate auth exception from Firebase error codes
class AuthExceptionFactory {
  /// Creates a specific auth exception based on Firebase error code
  static AuthException fromFirebaseErrorCode(String code, [String? message]) {
    switch (code) {
      case 'invalid-email':
      case 'wrong-password':
        return InvalidCredentialsException();
      case 'user-not-found':
        return UserNotFoundException();
      case 'user-disabled':
        return UserDisabledException();
      case 'email-already-in-use':
        return EmailAlreadyInUseException();
      case 'weak-password':
        return WeakPasswordException();
      case 'network-request-failed':
        return NetworkErrorException();
      case 'requires-recent-login':
        return AuthException(
          'This operation requires recent authentication. Please log in again.',
          code: code,
        );
      case 'too-many-requests':
        return AuthException(
          'Too many unsuccessful login attempts. Please try again later.',
          code: code,
        );
      default:
        return AuthException(
          message ?? 'An authentication error occurred.',
          code: code,
        );
    }
  }
}
