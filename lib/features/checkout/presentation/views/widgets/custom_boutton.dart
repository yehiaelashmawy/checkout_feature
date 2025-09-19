import 'package:checkout_payment/core/utils/style.dart';
import 'package:flutter/material.dart';

class CustomBoutton extends StatelessWidget {
  const CustomBoutton({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 73,
        width: double.infinity,
        decoration: ShapeDecoration(
          color: Color(0xff34A853),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Center(child: Text('Complete Payment', style: Style.style22)),
      ),
    );
  }
}
