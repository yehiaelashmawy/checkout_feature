import 'package:checkout_payment/core/utils/style.dart';
import 'package:flutter/material.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Total', style: Style.style24),
        Text(r'$50.97', style: Style.style24),
      ],
    );
  }
}
