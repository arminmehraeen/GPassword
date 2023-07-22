import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:gpassword/src/utils/constants.dart';

class GPassword {
  List<String> generateList({int passwordLength = Constants.passwordLength}) =>
      List.generate(Constants.passwordCount,
          (index) => _generatePassword(passLength: passwordLength)).toList();

  String generate({int passwordLength = Constants.passwordLength}) =>
      _generatePassword(passLength: passwordLength);

  // Minimum eight characters, at least one uppercase letter, one lowercase letter, one number and one special character:
  bool passwordIsSecure({required String password}) {
    if (password.length < 6) return false;
    RegExp regExp = RegExp(
      Constants.regex,
      caseSensitive: false,
      multiLine: false,
    );
    return regExp.hasMatch(password);
  }

  String encryptPassword({required String password}) {
    final bytes = utf8.encode(password);
    final hash = sha256.convert(bytes);
    return hash.toString();
  }

  String _generatePassword({required int passLength}) {
    String password = '';
    List<String> list = Constants.concat.split('').toList();
    Random rand = Random();
    for (int i = 0; i < passLength; i++) {
      int index = rand.nextInt(list.length);
      password += list[index];
    }

    if (!password.contains(Constants.numbers)) {
      List<String> temp = password.split("").toList();
      int passwordRandomIndex = rand.nextInt(temp.length);
      int numberRandomIndex = rand.nextInt(Constants.numbers.length);
      temp[passwordRandomIndex] = Constants.numbers[numberRandomIndex];
      password = temp.join();
    }

    if (!password.contains(Constants.symbols)) {
      List<String> temp = password.split("").toList();
      int passwordRandomIndex = rand.nextInt(temp.length);
      int symbolRandomIndex = rand.nextInt(Constants.symbols.length);
      temp[passwordRandomIndex] = Constants.symbols[symbolRandomIndex];
      password = temp.join();
    }

    return password;
  }
}
