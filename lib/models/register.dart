import 'package:myapp/constants/strings.dart';

class Register {
  final String message;
  final String accessToken;
  final String refreshToken;

  Register(
      {required this.message,
      required this.accessToken,
      required this.refreshToken});

  factory Register.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'message': String message,
        'accessToken': String accessToken,
        'refreshToken': String refreshToken,
      } =>
        Register(
            message: message,
            accessToken: accessToken,
            refreshToken: refreshToken),
      _ => throw fetchError,
    };
  }
}
