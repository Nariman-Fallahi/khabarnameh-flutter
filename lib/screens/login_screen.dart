import 'package:flutter/material.dart';
import 'package:myapp/constants/icons.dart';
import 'package:myapp/constants/strings.dart';
import 'package:myapp/enums/auth_enum.dart';
import 'package:myapp/repositories/user_repository.dart';
import 'package:myapp/services/api_service.dart';
import 'package:myapp/services/register_user.dart';
import 'package:myapp/widgets/register/custom_text_field.dart';
import 'package:myapp/widgets/register/footer.dart';
import 'package:myapp/widgets/register/header.dart';
import 'package:myapp/widgets/register/submit_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late final UserRepository userRepository;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    ApiService apiService = ApiService();
    userRepository = UserRepository(apiService);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                    const Header(label: loginHeaderText),
                    const SizedBox(height: 30),
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
                      label: 'ورود',
                      isLoading: isLoading,
                      onPressed: () {
                        if (_formKey.currentState!.validate() && !isLoading) {
                          registerUser(
                              context: context,
                              body: {
                                'email': _emailController.text,
                                'password': _passwordController.text,
                              },
                              type: AuthEnum.login,
                              userRepository: userRepository,
                              onLoading: (bool value) {
                                setState(() {
                                  isLoading = value;
                                });
                              });
                        }
                      },
                    ),
                    const Footer(isLoginScreen: true)
                  ],
                ),
              ),
            )));
  }
}
