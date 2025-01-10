import 'dart:convert';

import 'package:myapp/services/api_service.dart';

class UserRepository {
  final ApiService apiService;

  UserRepository(this.apiService);

  Future<Map<String, dynamic>> createUser(
      {required Map<String, dynamic> body}) async {
    final response = await apiService.post(
        url: '',
        body: {'name': 'fff'},
        header: {'Content-Type': 'application/json'});

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to create user: ${response.statusCode}');
    }
  }
}
