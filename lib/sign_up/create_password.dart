import 'package:flutter/material.dart';

import '../home_screen/components/reusable_row.dart';





class CreatePassword extends StatefulWidget {
  const CreatePassword({super.key});

  @override
  _CreatePasswordState createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  String password = '';
  String passwordStrength = 'Too Short';
  bool isPasswordValid = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const ReusableRow(
                title: "FOODSTERS",
                textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff2BB673)),
                spacing: 100,
                icon: Icons.cancel_outlined,
                iconColor: Color(0xff2BB673),
              ),
              const SizedBox(
                height: 30,
              ),
              Text("Create a password",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.w600, fontSize: 24)),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Password",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 5,
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    password = value;
                    passwordStrength = PasswordStrength.checkStrength(password);
                    isPasswordValid =
                        PasswordStrength.isValidPassword(password);
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter your password',
                  border: const OutlineInputBorder(),
                  errorText: !isPasswordValid && password.isNotEmpty
                      ? 'Password must be at least 8 characters long, include an uppercase letter, a number, and a special character'
                      : null,
                ),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              Text(
                'Password Strength:                                      $passwordStrength',
                style: TextStyle(
                  fontSize: 16,
                  color: PasswordStrength.getStrengthColor(passwordStrength),
                ),
              ),
              const SizedBox(height: 10),
              LinearProgressIndicator(
                value: _calculateStrengthValue(passwordStrength),
                backgroundColor: Colors.grey[300],
                minHeight: 9,
                borderRadius: BorderRadius.circular(10),
                valueColor: AlwaysStoppedAnimation<Color>(
                  PasswordStrength.getStrengthColor(passwordStrength),
                ),
              ),
              const SizedBox(height: 20),
              Text("Password must include:",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.w400)),
              const SizedBox(height: 20),
              const ReusableRow(
                title: 'At least 8 characters',
                spacing: 5,
                icon: Icons.check_circle_outline,
                iconColor: Color(0xff2BB673),
              ),
              const ReusableRow(
                title: 'Capital and lowercase letters',
                spacing: 5,
                icon: Icons.check_circle_outline,
                iconColor: Color(0xff2BB673),
              ),
              const ReusableRow(
                title: 'A special character -#@!',
                spacing: 5,
                icon: Icons.check_circle_outline,
                iconColor: Color(0xff2BB673),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: isPasswordValid ? () {} : null,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    fixedSize: const Size(375, 48),
                    backgroundColor: const Color(0xff2BB673),
                  ),
                  child: const Text(
                    'Create password',
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  double _calculateStrengthValue(String strength) {
    switch (strength) {
      case 'Too Short':
        return 0.2;
      case 'Weak':
        return 0.4;
      case 'Medium':
        return 0.7;
      case 'Strong':
        return 1.0;
      default:
        return 0.0;
    }
  }
}

class PasswordStrength {
  static String checkStrength(String password) {
    final hasUppercase = password.contains(RegExp(r'[A-Z]'));
    final hasDigits = password.contains(RegExp(r'[0-9]'));
    final hasLowercase = password.contains(RegExp(r'[a-z]'));
    final hasSpecialCharacters =
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    final isLengthValid = password.length >= 8;

    if (!isLengthValid) {
      return 'Too Short';
    } else if (hasUppercase &&
        hasDigits &&
        hasLowercase &&
        hasSpecialCharacters) {
      return 'Strong';
    } else if ((hasUppercase && hasDigits) ||
        (hasLowercase && hasSpecialCharacters)) {
      return 'Medium';
    } else {
      return 'Weak';
    }
  }

  static Color getStrengthColor(String strength) {
    switch (strength) {
      case 'Too Short':
        return Colors.red;
      case 'Weak':
        return Colors.orange;
      case 'Medium':
        return Colors.yellow;
      case 'Strong':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  static bool isValidPassword(String password) {
    final hasUppercase = password.contains(RegExp(r'[A-Z]'));
    final hasDigits = password.contains(RegExp(r'[0-9]'));
    final hasSpecialCharacters =
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    final isLengthValid = password.length >= 8;
    return isLengthValid && hasUppercase && hasDigits && hasSpecialCharacters;
  }
}
