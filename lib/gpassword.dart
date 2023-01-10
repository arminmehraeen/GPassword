library gpassword;

import 'dart:math';

class GPassword {
  List<String> generate({int passLen = 16}) {
    List<String> passwords = [];
    List.generate(9, (index) => passwords.add(_compute(passLen: passLen)));
    return passwords;
  }

  String _compute({required int passLen}) {
    String upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    String lower = 'abcdefghijklmnopqrstuvwxyz';
    String numbers = '1234567890';
    String symbols = '!@#&';
    int passLength = passLen;
    String seed = upper + lower + numbers + symbols;
    String password = '';
    List<String> list = seed.split('').toList();
    Random rand = Random();
    for (int i = 0; i < passLength; i++) {
      int index = rand.nextInt(list.length);
      password += list[index];
    }
    return password;
  }
}
