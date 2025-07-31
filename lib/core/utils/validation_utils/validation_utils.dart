// lib/core/utils/validation_utils/validation_utils.dart

class Validators {
  // validate name
  static String? validateName(String? value) {
    if (value!.isEmpty) {
      return 'Username is Required.';
    }
    final RegExp nameExp = RegExp(r'^[A-za-zğüşöçİĞÜŞÖÇ ]+$');
    if (!nameExp.hasMatch(value)) {
      return 'Please enter only alphabetical characters.';
    }
    return null;
  }

  static String? validateEmail(String email) {
    // Check if the email is empty
    if (email.isEmpty) {
      return 'Email is required';
    }

    // Use a more robust regex to check if the email format is valid
    if (!RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(email)) {
      return 'Enter a valid email';
    }

    // Return null if no error (email is valid)
    return null;
  }

  // static String? validateEmail(String email) {
  //   if (email.isEmpty) {
  //     return 'Email is required';
  //   } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
  //     return 'Enter a valid email';
  //   }
  //   return null;
  // }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Password is required';
    } else if (password.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  // --------- More robust implementations ---------
  // validate Email
  //   static String? validateEmail(String? value) {
  //     if (value == null || value.isEmpty) {
  //       return 'Email is required.';
  //     }
  // // Regular expression for email validation
  //     final emailRegExp = RegExp(r'^[\-\.]+@([\-]+\.)+[\w-]{2,4}$');
  //     if (!emailRegExp.hasMatch(value)) {
  //       return 'Invalid email address.';
  //     }
  //     return null;
  //   }

  //   static String? validatePassword(String? value) {
  //     if (value == null || value.isEmpty) {
  //       return 'Password is required.';
  //     }

  // // Check for minimum password length

  //     if (value.length < 6) {
  //       return 'Password must be at least 6 characters long.';
  //     }
  // // Check for uppercase letters
  //     if (!value.contains(RegExp(r' [A-Z]'))) {
  //       return 'Password must contain at least one uppercase letter.';
  //     }
  // // Check for numbers
  //     if (!value.contains(RegExp(r' [0-9]'))) {
  //       return 'Password must contain at least one number.';
  //     }
  // // Check for special characters
  //     if (!value.contains(RegExp(r' [!@#$%^&*(),.?": {}|<>]'))) {
  //       return 'Password must contain at least one special character.';
  //     }
  //     return null;
  //   }

  // Password validation
  static String? validatePasswordForSignUp(String password) {
    if (password.isEmpty) {
      return 'Password is required';
    }
    if (password.length < 6 || !password.contains(RegExp(r'\d'))) {
      return 'Password must be at least 6 characters and contain a number';
    }
    return null;
  }

  // Confirm Password validation
  static String? validateConfirmPassword(
    String password,
    String confirmPassword,
  ) {
    if (confirmPassword.isEmpty) {
      return 'Confirm Password is required';
    }
    if (confirmPassword != password) {
      return 'Passwords do not match';
    }
    return null;
  }

  // validate phone number
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required.';
    }
    // Regular expression for phone number validation (assuming a 10-digit US phone number format)
    final phoneRegExp = RegExp(r'^\d{10}$');
    if (!phoneRegExp.hasMatch(value)) {
      return 'Invalid phone number format (10 digits required).';
    }
    return null;
  }
}
