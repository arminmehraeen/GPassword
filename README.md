Password Generator Flutter Package .

## Features

Random password generator .

## Getting started

This will add a line like this to your package's pubspec.yaml ( run an implicit dart pub get ) :

```dart
dependencies:
  gpassword:
    git:
      url: https://github.com/arminmehraeen/GPassword.git
```

```dart
import 'package:gpassword/gpassword.dart';
```

## Usage

```dart
GPassword gPassword = GPassword();

List<String> passwords = gPassword.generateList();
String password = gPassword.generate(passwordLength: 8);
// Minimum eight characters, at least one uppercase letter, one lowercase letter, one number and one special character:
bool passwordStatus = gPassword.passwordIsSecure(password: password);
String encryptPassword = gPassword.encryptPassword(password: password);
```

## Additional information
Support this package by star it :heart_on_fire:
