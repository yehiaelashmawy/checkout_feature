import 'package:checkout_payment/core/utils/style.dart';
import 'package:checkout_payment/features/checkout/presentation/views/widgets/card_info_widget.dart';
import 'package:checkout_payment/features/checkout/presentation/views/widgets/payment_item_info.dart';
import 'package:checkout_payment/features/checkout/presentation/views/widgets/total_price.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Color(0xFFEDEDED),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 66.0, left: 22, right: 23),
        child: Column(
          children: [
            Text('Thank you!', style: Style.style25),
            SizedBox(height: 2),
            Text('Your transaction was successful', style: Style.style20),
            SizedBox(height: 42),
            PaymentItemInfo(title: 'Date', info: '01/24/2023'),
            SizedBox(height: 20),
            PaymentItemInfo(title: 'Time', info: '10:15 AM'),
            SizedBox(height: 20),

            PaymentItemInfo(title: 'To', info: 'Sam Louis'),
            SizedBox(height: 6),
            Divider(thickness: 2, height: 24 + 24, color: Color(0xffc7c7c7)),
            TotalPrice(),
            SizedBox(height: 30),
            CardInfoWidget(),
          ],
        ),
      ),
    );
  }
}
