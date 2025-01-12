import 'package:flutter/material.dart';
import 'package:myapp/constants/strings.dart';
import 'package:myapp/screens/login_screen.dart';
import 'package:myapp/screens/sign_up_screen.dart';

class Footer extends StatelessWidget {
  final bool isLoginScreen;

  const Footer({
    super.key,
    required this.isLoginScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Row(
        children: [
          Text(isLoginScreen ? dontHaveAccount : alreadyHaveAccount),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => isLoginScreen
                      ? const SignUpScreen()
                      : const LoginScreen(),
                ),
              );
            },
            style: TextButton.styleFrom(splashFactory: NoSplash.splashFactory),
            child: const Text('کلیک کنید'),
          ),
        ],
      ),
    );
  }
}
