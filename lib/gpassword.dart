library gpassword;

import 'dart:math';

class GPassword {
  static const _passwordLength = 16;
  static const _passwordCount = 9;
  static const String _upperWords = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  static const String _lowerWords = 'abcdefghijklmnopqrstuvwxyz';
  static const String _numbers = '1234567890';
  static const String _symbols = '!@#&';

  List<String> generate({int passwordLength = _passwordLength}) =>
      List.generate(
              _passwordCount, (index) => _compute(passLength: passwordLength))
          .toList();

  String get _concat => _upperWords + _lowerWords + _numbers + _symbols;

  String _compute({required int passLength}) {
    String password = '';
    List<String> list = _concat.split('').toList();
    Random rand = Random();
    for (int i = 0; i < passLength; i++) {
      int index = rand.nextInt(list.length);
      password += list[index];
    }
    return password;
  }
}
