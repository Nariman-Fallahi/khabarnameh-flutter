import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseURL = 'https://khabarnamehapi.onrender.com';

  Future<http.Response> post(
      {required String url,
      required Map<String, dynamic> body,
      required Map<String, String> header}) async {
    final response = await http.post(Uri.parse('$baseURL$url'),
        headers: header, body: jsonEncode(body));
    return response;
  }
}
