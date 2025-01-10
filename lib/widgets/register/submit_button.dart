import 'package:flutter/material.dart';
import 'package:myapp/theme/app_colors.dart';

class SubmitButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const SubmitButton({
    super.key,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Processing Data')),
            );
          }
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        child: const Text(
          'ثبت نام',
          style: TextStyle(color: AppColors.grey3, fontSize: 16),
        ),
      ),
    );
  }
}
