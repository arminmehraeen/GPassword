import 'package:flutter_test/flutter_test.dart';
import 'package:gpassword/gpassword.dart';

void main() {
  test('App testing', () {
    GPassword gPassword = GPassword();
    String password = gPassword.generate();
    bool isSecure = gPassword.passwordIsSecure(password: password);
    String encryptPassword = gPassword.encryptPassword(password: password);
    expect(isSecure, true);
  });
}
