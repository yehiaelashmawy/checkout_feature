import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    this.isAtive = false,
    required this.image,
  });
  final bool isAtive;
  final String image;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 62,
      width: 103,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1.5,
            color: isAtive ? Color(0XFF34A853) : Color(0XFF808080),
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        shadows: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 4,
            spreadRadius: 0,
            color: isAtive ? Color(0XFF34A853) : Color(0XFF808080),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),

        child: Center(child: SvgPicture.asset(image)),
      ),
    );
  }
}
