import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void showToastification(
    {required BuildContext context,
    required String text,
    required ToastificationType type}) {
  toastification.show(
    context: context,
    type: type,
    style: ToastificationStyle.flatColored,
    showProgressBar: false,
    title: Text(
      text,
    ),
    autoCloseDuration: const Duration(seconds: 5),
  );
}
