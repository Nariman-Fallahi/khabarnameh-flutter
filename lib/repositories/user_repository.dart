import 'dart:convert';

import 'package:myapp/constants/strings.dart';
import 'package:myapp/enums/auth_enum.dart';
import 'package:myapp/models/register.dart';
import 'package:myapp/services/api_service.dart';

class UserRepository {
  final ApiService apiService;

  UserRepository(this.apiService);

  Future<Register> register(
      {required AuthEnum type, required Map<String, dynamic> body}) async {
    final response = await apiService.post(
        url: '/auth/${type == AuthEnum.signup ? 'signup' : 'login'}',
        body: body,
        header: {'Content-Type': 'application/json'});

    if (response.statusCode == 201) {
      return Register.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else if (response.statusCode == 409 && type == AuthEnum.signup) {
      throw emailAlreadyRegistered;
    } else if (response.statusCode == 404 && type == AuthEnum.login) {
      throw accountNotFound;
    } else {
      throw authError;
    }
  }
}
