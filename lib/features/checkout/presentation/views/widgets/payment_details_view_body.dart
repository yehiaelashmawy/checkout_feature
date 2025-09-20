import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class PaymentDetailsViewBody extends StatelessWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 62,
          width: 103,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.5, color: Color(0XFF34A853)),
              borderRadius: BorderRadius.circular(15),
            ),
            shadows: [
              BoxShadow(
                offset: Offset(0, 0),
                blurRadius: 4,
                spreadRadius: 0,
                color: Color(0XFF34A853),
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),

            child: Center(child: SvgPicture.asset('assets/image/cart.svg')),
          ),
        ),
      ],
    );
  }
}
