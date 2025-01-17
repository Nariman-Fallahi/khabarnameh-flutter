import 'package:flutter_secure_storage/flutter_secure_storage.dart';

AndroidOptions _getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );

final _storage = FlutterSecureStorage(aOptions: _getAndroidOptions());
const String accessKey = "accessToken";
const String refreshKey = "refreshToken";

Future<void> saveAuthToken(
    {required String accessToken, required String refreshToken}) async {
  await _storage.write(key: accessKey, value: accessToken);
  await _storage.write(key: refreshKey, value: refreshToken);
}

Future<String?> getAccessToken() async {
  return await _storage.read(key: accessKey);
}

Future<String?> getRefreshToken() async {
  return await _storage.read(key: refreshKey);
}
