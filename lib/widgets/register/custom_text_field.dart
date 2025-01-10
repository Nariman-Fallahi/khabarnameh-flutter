import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String icon;
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.label,
    required this.icon,
    required this.hintText,
    this.isPassword = false,
    required this.controller,
  });

  @override
  State<CustomTextField> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CustomTextField> {
  bool _isObscured = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(fontSize: 16),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: TextFormField(
            controller: widget.controller,
            obscureText: widget.isPassword ? _isObscured : false,
            cursorHeight: 20,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'مقدار این فیلد نمیتواند خالی باشد.';
              }
              return null;
            },
            style: const TextStyle(
              height: 0.5,
            ),
            decoration: InputDecoration(
              hintText: widget.hintText,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  widget.icon,
                  width: 18,
                  height: 18,
                ),
              ),
              suffixIcon: widget.isPassword
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          _isObscured = !_isObscured;
                        });
                      },
                      icon: SvgPicture.asset(
                          !_isObscured
                              ? 'assets/icons/eye.svg'
                              : 'assets/icons/eye-slash.svg',
                          width: 20,
                          height: 20),
                    )
                  : null,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
