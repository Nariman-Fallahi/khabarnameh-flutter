import 'package:flutter/material.dart';
import 'package:myapp/repositories/user_repository.dart';
import 'package:myapp/screens/sign_up_screen.dart';
import 'package:myapp/services/api_service.dart';
import 'package:myapp/utils/show_toast.dart';
import 'package:myapp/widgets/register/custom_text_field.dart';
import 'package:myapp/widgets/register/submit_button.dart';
import 'package:toastification/toastification.dart';

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

  late final UserRepository userRepository;

  @override
  void initState() {
    super.initState();
    ApiService apiService = ApiService();
    userRepository = UserRepository(apiService);
  }

  void registerUser() async {
    try {
      final response = await userRepository.createUser(body: {
        'name': _fullNameController.text,
        'email': _emailController.text,
        'password': _passwordController.text
      });
    } catch (e) {
      showToastification(text: 'ارور', type: ToastificationType.error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: _formKey,
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                  child: SizedBox(
                height: MediaQuery.sizeOf(context).height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/image/registerIcon.png',
                      width: 230,
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'لطفا اطلاعات خود را برای ثبت نام وارد کنید.',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 30),
                    CustomTextField(
                      label: 'نام و نام خانوادگی',
                      controller: _fullNameController,
                      icon: 'assets/icons/user.svg',
                      hintText: 'نریمان فلاحی',
                    ),
                    CustomTextField(
                      label: 'ایمیل',
                      controller: _emailController,
                      icon: 'assets/icons/email.svg',
                      hintText: 'example@gmail.com',
                    ),
                    CustomTextField(
                      label: 'رمزعبور',
                      controller: _passwordController,
                      icon: 'assets/icons/key.svg',
                      hintText: 'Example_@123',
                      isPassword: true,
                    ),
                    SubmitButton(
                      formKey: _formKey,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Row(
                        children: [
                          const Text('قبلا حساب کاربری دارید؟'),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpScreen()),
                              );
                            },
                            style: TextButton.styleFrom(
                                splashFactory: NoSplash.splashFactory),
                            child: const Text('کلیک کنید'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )))),
    );
  }
}
