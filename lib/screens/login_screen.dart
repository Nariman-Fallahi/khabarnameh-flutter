import 'package:flutter/material.dart';
import 'package:myapp/widgets/register/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/image/registerIcon.png',
                  width: 230,
                ),
                const SizedBox(height: 50),
                CustomTextField(
                  label: 'email',
                  controller: _emailController,
                  textAlign: TextAlign.end,
                )
              ],
            ),
          )),
    );
  }
}
