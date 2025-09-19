import 'package:checkout_payment/features/checkout/presentation/views/widgets/custom_boutton.dart';
import 'package:checkout_payment/features/checkout/presentation/views/widgets/order_info_item.dart';
import 'package:checkout_payment/features/checkout/presentation/views/widgets/total_price.dart';
import 'package:flutter/material.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          SizedBox(height: 15),
          Expanded(child: Image.asset('assets/image/basket_image.png')),
          SizedBox(height: 25),
          OrderInfoItem(title: 'Order Subtotal', price: 42.97),
          SizedBox(height: 3),
          OrderInfoItem(title: 'Discount', price: 0),
          SizedBox(height: 3),
          OrderInfoItem(title: 'Shipping', price: 8),
          Divider(thickness: 2, height: 17 + 17, color: Color(0xffc7c7c7)),
          TotalPrice(),
          SizedBox(height: 16),
          CustomBoutton(),
          SizedBox(height: 34),
        ],
      ),
    );
  }
}
