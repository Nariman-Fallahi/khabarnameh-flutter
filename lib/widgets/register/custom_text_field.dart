import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType inputType;
  final TextAlign textAlign;

  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    this.inputType = TextInputType.text,
    this.textAlign = TextAlign.right,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, fontFamily: 'vazirmatnR'),
        ),
        Container(
          margin: const EdgeInsets.only(top: 5),
          child: TextFormField(
            controller: controller,
            keyboardType: inputType,
            cursorHeight: 20,
            textAlign: textAlign,
            style: const TextStyle(
              height: 0.5,
            ),
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
        )
      ],
    );
  }
}
