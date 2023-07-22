import 'package:flutter_test/flutter_test.dart';
import 'package:gpassword/gpassword.dart';

void main() {
  test('adds one to input values', () {
    GPassword gPassword = GPassword();
    String password = gPassword.generate();
    print("Password => $password");
    bool isSecure = gPassword.passwordIsSecure(password: password);
    print("Password is secure => $isSecure");
  });
}
