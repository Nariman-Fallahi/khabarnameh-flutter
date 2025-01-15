import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/constants/icons.dart';
import 'package:myapp/theme/app_colors.dart';
import 'package:myapp/theme/app_text_theme.dart';
import 'package:myapp/utils/show_toast.dart';
import 'package:myapp/widgets/register/header.dart';
import 'package:myapp/widgets/register/otp_field.dart';
import 'package:toastification/toastification.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final ValueNotifier<bool> _isError = ValueNotifier(false);
  late String _otp;

  _onOtpChanged(String value) {
    setState(() {
      _otp = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Header(label: 'کد ارسال شده را وارد کنید'),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton.icon(
              onPressed: () {
                showToastification(
                    text: 'ارور',
                    type: ToastificationType.error,
                    context: context);
              },
              label: Text(
                'ویرایش ایمیل',
                style: AppTextTheme.buttonMD.copyWith(color: AppColors.success),
              ),
              icon: SvgPicture.asset(
                arrowRight,
                colorFilter:
                    const ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.success3,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
                width: double.infinity,
                child: Text(
                  'کد تایید',
                  style: AppTextTheme.h6,
                )),
            const SizedBox(height: 10),
            OtpField(
              onOtpChanged: _onOtpChanged,
              isError: _isError,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                SvgPicture.asset(timerIcon, width: 16),
                const SizedBox(width: 8),
                RichText(
                  text: TextSpan(
                    text: '01:25 ',
                    style: AppTextTheme.captionMD
                        .copyWith(color: AppColors.primary),
                    children: [
                      TextSpan(
                          text: 'تا دریافت دوباره کد',
                          style: AppTextTheme.captionMD
                              .copyWith(color: AppColors.grey7)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
