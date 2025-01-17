import 'package:myapp/enums/auth_enum.dart';
import 'package:myapp/repositories/user_repository.dart';
import 'package:myapp/utils/auth_token.dart';
import 'package:myapp/utils/show_toast.dart';
import 'package:toastification/toastification.dart';

void registerUser(
    {required Map<String, dynamic> body,
    required Function(bool) onLoading,
    required context,
    required UserRepository userRepository,
    required AuthEnum type}) async {
  try {
    onLoading(true);

    final response = await userRepository.register(type: type, body: body);

    onLoading(false);

    saveAuthToken(
        accessToken: response.accessToken, refreshToken: response.refreshToken);
  } catch (error) {
    onLoading(false);

    showToastification(
        context: context,
        text: error.toString(),
        type: ToastificationType.error);
  }
}
