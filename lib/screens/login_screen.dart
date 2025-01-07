import 'package:flutter/material.dart';
import 'package:myapp/widgets/register/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: _formKey,
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                  child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/image/registerIcon.png',
                      width: 230,
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'لطفا اطلاعات خود را وارد کنید.',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 30),
                    CustomTextField(
                      label: 'نام و نام خانوادگی',
                      controller: _fullNameController,
                      icon: 'assets/icon/email.svg',
                      hintText: 'نریمان فلاحی',
                    ),
                    CustomTextField(
                      label: 'ایمیل',
                      controller: _emailController,
                      icon: 'assets/icon/email.svg',
                      hintText: 'example@gmail.com',
                    ),
                    CustomTextField(
                      label: 'رمزعبور',
                      controller: _passwordController,
                      icon: 'assets/icon/email.svg',
                      hintText: 'Example_@123',
                      isPassword: true,
                    ),
                  ],
                ),
              )))),
    );
  }
}
