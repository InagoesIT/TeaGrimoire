import 'package:flutter/material.dart';

class ParchmentDivider extends StatelessWidget {
  const ParchmentDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(color: Color(0xFF4A2C0A), thickness: 0.8),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          child: Text(
            '✦',
            style: TextStyle(color: const Color(0xFF3D2208), fontSize: 8),
          ),
        ),
        const Expanded(
          child: Divider(color: Color(0xFF4A2C0A), thickness: 0.8),
        ),
      ],
    );
  }
}
