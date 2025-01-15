import 'package:flutter/material.dart';
import 'package:myapp/constants/icons.dart';
import 'package:myapp/constants/strings.dart';
import 'package:myapp/repositories/user_repository.dart';
import 'package:myapp/services/api_service.dart';
import 'package:myapp/widgets/register/custom_text_field.dart';
import 'package:myapp/widgets/register/footer.dart';
import 'package:myapp/widgets/register/header.dart';
import 'package:myapp/widgets/register/submit_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late final UserRepository userRepository;

  @override
  void initState() {
    super.initState();
    ApiService apiService = ApiService();
    userRepository = UserRepository(apiService);
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // void registerUser() async {
  //   try {
  //     final response = await userRepository.createUser(body: {
  //       'name': _fullNameController.text,
  //       'email': _emailController.text,
  //       'password': _passwordController.text
  //     });
  //   } catch (e) {
  //     showToastification(text: 'ارور', type: ToastificationType.error);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: _formKey,
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Header(label: signUpHeaderText),
                    const SizedBox(height: 30),
                    CustomTextField(
                      label: 'نام و نام خانوادگی',
                      controller: _fullNameController,
                      icon: userIcon,
                      hintText: 'نریمان فلاحی',
                    ),
                    CustomTextField(
                      label: 'ایمیل',
                      controller: _emailController,
                      icon: emailIcon,
                      hintText: 'example@gmail.com',
                    ),
                    CustomTextField(
                      label: 'رمزعبور',
                      controller: _passwordController,
                      icon: keyIcon,
                      hintText: 'Example_@123',
                      isPassword: true,
                    ),
                    SubmitButton(
                      formKey: _formKey,
                      label: 'ثبت نام',
                    ),
                    const Footer(isLoginScreen: false)
                  ],
                ),
              ))),
    );
  }
}
