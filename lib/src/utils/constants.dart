/// Constants used throughout the GPassword package.
class Constants {
  /// Default password length
  static const int passwordLength = 12;

  /// Default number of passwords to generate in a list
  static const int passwordCount = 5;

  /// Uppercase letters
  static const String uppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

  /// Lowercase letters
  static const String lowercase = 'abcdefghijklmnopqrstuvwxyz';

  /// Numbers
  static const String numbers = '0123456789';

  /// Special symbols
  static const String symbols = '!@#\$%^&*(),.?":{}|<>';

  /// Combined character set
  static const String concat = '$uppercase$lowercase$numbers$symbols';

  /// Regular expression for password validation
  static const String regex =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
}
