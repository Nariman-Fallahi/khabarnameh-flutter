import 'package:flutter/material.dart';
import 'package:myapp/theme/app_colors.dart';

class SubmitButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String label;
  final Function onPressed;
  final bool isLoading;

  const SubmitButton(
      {super.key,
      required this.formKey,
      required this.label,
      required this.onPressed,
      required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => onPressed(),
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        child: isLoading
            ? const SizedBox(
                width: 25,
                height: 25,
                child: CircularProgressIndicator(
                  color: AppColors.grey7,
                ))
            : Text(
                label,
                style: const TextStyle(color: AppColors.grey3, fontSize: 16),
              ),
      ),
    );
  }
}
