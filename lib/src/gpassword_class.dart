import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:collection/collection.dart';
import 'package:gpassword/src/utils/constants.dart';

/// A class that provides password generation, validation, and security features.
class GPassword {
  /// Generates a list of secure passwords.
  ///
  /// [passwordLength] specifies the length of each password (default: 12).
  /// [count] specifies how many passwords to generate (default: 5).
  /// [includeUppercase] whether to include uppercase letters (default: true).
  /// [includeLowercase] whether to include lowercase letters (default: true).
  /// [includeNumbers] whether to include numbers (default: true).
  /// [includeSymbols] whether to include special symbols (default: true).
  List<String> generateList({
    int passwordLength = Constants.passwordLength,
    int count = Constants.passwordCount,
    bool includeUppercase = true,
    bool includeLowercase = true,
    bool includeNumbers = true,
    bool includeSymbols = true,
  }) {
    return List.generate(
      count,
      (index) => generate(
        passwordLength: passwordLength,
        includeUppercase: includeUppercase,
        includeLowercase: includeLowercase,
        includeNumbers: includeNumbers,
        includeSymbols: includeSymbols,
      ),
    );
  }

  /// Generates a single secure password.
  ///
  /// [passwordLength] specifies the length of the password (default: 12).
  /// [includeUppercase] whether to include uppercase letters (default: true).
  /// [includeLowercase] whether to include lowercase letters (default: true).
  /// [includeNumbers] whether to include numbers (default: true).
  /// [includeSymbols] whether to include special symbols (default: true).
  String generate({
    int passwordLength = Constants.passwordLength,
    bool includeUppercase = true,
    bool includeLowercase = true,
    bool includeNumbers = true,
    bool includeSymbols = true,
  }) {
    return _generatePassword(
      passLength: passwordLength,
      includeUppercase: includeUppercase,
      includeLowercase: includeLowercase,
      includeNumbers: includeNumbers,
      includeSymbols: includeSymbols,
    );
  }

  /// Validates if a password meets security requirements.
  ///
  /// Returns true if the password:
  /// - Is at least 8 characters long
  /// - Contains at least one uppercase letter
  /// - Contains at least one lowercase letter
  /// - Contains at least one number
  /// - Contains at least one special character
  bool passwordIsSecure({required String password}) {
    if (password.length < 8) return false;

    bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
    bool hasLowercase = password.contains(RegExp(r'[a-z]'));
    bool hasNumbers = password.contains(RegExp(r'[0-9]'));
    bool hasSpecialChars = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

    return hasUppercase && hasLowercase && hasNumbers && hasSpecialChars;
  }

  /// Calculates a password strength score from 0 to 100.
  ///
  /// The score is based on:
  /// - Length (up to 40 points)
  /// - Character variety (up to 30 points)
  /// - Complexity (up to 30 points)
  int getPasswordStrength({required String password}) {
    int score = 0;

    // Length score (up to 40 points)
    score += min(password.length * 2, 40);

    // Character variety score (up to 30 points)
    if (password.contains(RegExp(r'[A-Z]'))) score += 10;
    if (password.contains(RegExp(r'[a-z]'))) score += 10;
    if (password.contains(RegExp(r'[0-9]'))) score += 5;
    if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) score += 5;

    // Complexity score (up to 30 points)
    int uniqueChars = password.split('').toSet().length;
    score += min(uniqueChars * 2, 30);

    return min(score, 100);
  }

  /// Encrypts a password using SHA-256.
  String encryptPassword({required String password}) {
    final bytes = utf8.encode(password);
    final hash = sha256.convert(bytes);
    return hash.toString();
  }

  /// Checks if a password matches a specific pattern.
  ///
  /// [pattern] can be a regular expression or a simple string pattern.
  bool matchesPattern({required String password, required String pattern}) {
    try {
      return RegExp(pattern).hasMatch(password);
    } catch (e) {
      return password.contains(pattern);
    }
  }

  String _generatePassword({
    required int passLength,
    bool includeUppercase = true,
    bool includeLowercase = true,
    bool includeNumbers = true,
    bool includeSymbols = true,
  }) {
    String chars = '';
    if (includeUppercase) chars += Constants.uppercase;
    if (includeLowercase) chars += Constants.lowercase;
    if (includeNumbers) chars += Constants.numbers;
    if (includeSymbols) chars += Constants.symbols;

    if (chars.isEmpty) {
      throw ArgumentError('At least one character type must be included');
    }

    String password = '';
    List<String> charList = chars.split('');
    Random rand = Random.secure();

    // Generate initial password
    for (int i = 0; i < passLength; i++) {
      int index = rand.nextInt(charList.length);
      password += charList[index];
    }

    // Ensure password meets minimum requirements
    if (includeUppercase && !password.contains(RegExp(r'[A-Z]'))) {
      password = _replaceRandomChar(
        password,
        Constants.uppercase[rand.nextInt(Constants.uppercase.length)],
      );
    }
    if (includeLowercase && !password.contains(RegExp(r'[a-z]'))) {
      password = _replaceRandomChar(
        password,
        Constants.lowercase[rand.nextInt(Constants.lowercase.length)],
      );
    }
    if (includeNumbers && !password.contains(RegExp(r'[0-9]'))) {
      password = _replaceRandomChar(
        password,
        Constants.numbers[rand.nextInt(Constants.numbers.length)],
      );
    }
    if (includeSymbols &&
        !password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      password = _replaceRandomChar(
        password,
        Constants.symbols[rand.nextInt(Constants.symbols.length)],
      );
    }

    return password;
  }

  String _replaceRandomChar(String password, String newChar) {
    List<String> chars = password.split('');
    int index = Random.secure().nextInt(chars.length);
    chars[index] = newChar;
    return chars.join();
  }
}
