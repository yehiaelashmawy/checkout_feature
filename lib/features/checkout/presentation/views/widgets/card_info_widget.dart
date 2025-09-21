import 'package:checkout_payment/core/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

class CardInfoWidget extends StatelessWidget {
  const CardInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 23, vertical: 16),
      width: 305,

      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      ),
      child: Row(
        children: [
          SvgPicture.asset('assets/image/master_logo.svg'),
          SizedBox(width: 23),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: 'Credit Card\n', style: Style.style18),
                TextSpan(
                  text: 'Mastercard **78 ',
                  style: Style.style18.copyWith(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
