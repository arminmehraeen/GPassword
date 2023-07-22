class Constants {
  static const int passwordLength = 16;
  static const int passwordCount = 9;

  static const String upperWords = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  static const String lowerWords = 'abcdefghijklmnopqrstuvwxyz';
  static const String numbers = '1234567890';
  static const String symbols = '@!%*?&';

  static const String regex =
      r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@!%*?&])[A-Za-z\d@!%*?&]{8,}$";

  static String get concat => upperWords + lowerWords + numbers + symbols;
}
