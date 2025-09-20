import 'package:checkout_payment/features/checkout/presentation/views/widgets/custom_app_bar.dart';
import 'package:checkout_payment/features/checkout/presentation/views/widgets/my_cart_view_body.dart';
import 'package:flutter/material.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFFFFFF),
      appBar: buildAppBar(title: 'My Cart'),
      body: MyCartViewBody(),
    );
  }
}
