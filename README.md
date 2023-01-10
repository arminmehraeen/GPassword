Password Generator Flutter Package .

## Features

Random password generator .

## Getting started

This will add a line like this to your package's pubspec.yaml ( run an implicit dart pub get ) :

```dart
dependencies:
  bmi:
    git:
      url: https://github.com/arminmehraeen/Bmi.git
```

```dart
import 'package:bmi/bmi.dart';
```

## Usage

```dart
final bmi = BMI(weight: 70, height: 180) ;
print(bmi.data.bmi);
print(bmi.data.weight);
print(bmi.data.height);
print(bmi.data.status);
print(bmi.data.message);
```

## Additional information
Support this package by star it :heart_on_fire:
