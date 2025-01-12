import 'package:flutter/material.dart';
import 'package:myapp/constants/icons.dart';

class Header extends StatelessWidget {
  final String label;

  const Header({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Image.asset(
            registerIcon,
            width: 230,
          ),
          const SizedBox(height: 30),
          Text(
            textAlign: TextAlign.center,
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
