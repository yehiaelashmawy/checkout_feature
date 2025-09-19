import 'package:checkout_payment/core/utils/style.dart';
import 'package:flutter/material.dart';

class OrderInfoItem extends StatelessWidget {
  const OrderInfoItem({super.key, required this.title, required this.price});
  final String title;
  final double price;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Style.style18),
        Text('\$$price', style: Style.style18),
      ],
    );
  }
}
