import 'package:checkout_payment/core/utils/style.dart';
import 'package:flutter/material.dart';

class PaymentItemInfo extends StatelessWidget {
  const PaymentItemInfo({super.key, required this.title, required this.info});
  final String title, info;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Style.style18),
        Text(info, style: Style.styleSemiBold18),
      ],
    );
  }
}
