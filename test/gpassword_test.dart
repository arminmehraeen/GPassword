import 'package:flutter_test/flutter_test.dart';

import 'package:gpassword/gpassword.dart';

void main() {
  test('adds one to input values', () {
    GPassword gPassword = GPassword();
    // expect(gPassword.generate() , null);
    print(gPassword.generate());
  });
}
