import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/constants/icons.dart';
import 'package:myapp/theme/app_colors.dart';
import 'package:myapp/theme/app_text_theme.dart';

class OtpField extends StatefulWidget {
  final Function(String) onOtpChanged;
  final ValueNotifier<bool> isError;

  const OtpField({
    super.key,
    required this.onOtpChanged,
    required this.isError,
  });

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {
  static const _length = 6;
  final _controllers =
      List.generate(_length, (index) => TextEditingController());

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _checkOtpCompletion() {
    String code = _controllers.map((controller) => controller.text).join();

    if (code.length == _length) {
      widget.onOtpChanged(code);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
            children: List.generate(
                _length,
                (index) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5, left: 5),
                        child: SizedBox(
                          child: Directionality(
                            textDirection: TextDirection.ltr,
                            child: TextField(
                              controller: _controllers[index],
                              keyboardType: TextInputType.number,
                              maxLength: 1,
                              textAlign: TextAlign.center,
                              textAlignVertical: TextAlignVertical.center,
                              style: const TextStyle(fontSize: 16),
                              decoration: InputDecoration(
                                counterText: '',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  FocusScope.of(context).nextFocus();
                                } else {
                                  FocusScope.of(context).previousFocus();
                                }
                                _checkOtpCompletion();
                              },
                            ),
                          ),
                        ),
                      ),
                    ))),
        const SizedBox(height: 10),
        widget.isError.value
            ? Row(
                children: [
                  SvgPicture.asset(
                    dangerIcon,
                    colorFilter: const ColorFilter.mode(
                        AppColors.error, BlendMode.srcIn),
                    width: 16,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '‌کد وارد شده اشتباه است !',
                    style:
                        AppTextTheme.captionMD.copyWith(color: AppColors.error),
                  )
                ],
              )
            : const SizedBox.shrink()
      ],
    );
  }
}
