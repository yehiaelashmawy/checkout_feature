import 'package:flutter/material.dart';

class CustomDashedLine extends StatelessWidget {
  const CustomDashedLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        25,
        (index) => Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Container(height: 2, color: Color(0XFFB8B8B8)),
          ),
        ),
      ),
    );
  }
}
