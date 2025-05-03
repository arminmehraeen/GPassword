# GPassword

A powerful and secure password generation and validation Flutter package.

## Features

- Generate secure passwords with customizable options
- Generate multiple passwords at once
- Password strength scoring (0-100)
- Password validation and security checks
- Pattern matching for passwords
- SHA-256 password encryption
- Customizable character sets (uppercase, lowercase, numbers, symbols)

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  gpassword: ^1.0.0
```

## Usage

### Generate a Single Password

```dart
final gpassword = GPassword();

// Generate a default password (12 characters)
String password = gpassword.generate();

// Generate a custom password
String customPassword = gpassword.generate(
  passwordLength: 16,
  includeUppercase: true,
  includeLowercase: true,
  includeNumbers: true,
  includeSymbols: true,
);
```

### Generate Multiple Passwords

```dart
// Generate a list of 5 default passwords
List<String> passwords = gpassword.generateList();

// Generate a list of custom passwords
List<String> customPasswords = gpassword.generateList(
  passwordLength: 16,
  count: 10,
  includeUppercase: true,
  includeLowercase: true,
  includeNumbers: true,
  includeSymbols: true,
);
```

### Check Password Security

```dart
bool isSecure = gpassword.passwordIsSecure(password: "MyPassword123!");
```

### Get Password Strength Score

```dart
int strength = gpassword.getPasswordStrength(password: "MyPassword123!");
// Returns a score from 0 to 100
```

### Check Password Pattern

```dart
// Check if password matches a regular expression
bool matches = gpassword.matchesPattern(
  password: "MyPassword123!",
  pattern: r'^[A-Za-z0-9!@#$%^&*(),.?":{}|<>]{8,}$'
);

// Check if password contains a specific string
bool contains = gpassword.matchesPattern(
  password: "MyPassword123!",
  pattern: "Password"
);
```

### Encrypt Password

```dart
String encrypted = gpassword.encryptPassword(password: "MyPassword123!");
// Returns SHA-256 hash of the password
```

## Security Features

- Uses cryptographically secure random number generation
- Enforces minimum password requirements
- Provides password strength scoring
- Supports SHA-256 encryption
- Customizable character sets
- Pattern matching for additional validation

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
