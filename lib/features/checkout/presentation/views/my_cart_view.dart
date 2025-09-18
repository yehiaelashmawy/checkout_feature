import 'package:checkout_payment/core/utils/style.dart';
import 'package:checkout_payment/features/checkout/presentation/views/widgets/my_cart_view_body.dart';
import 'package:flutter/material.dart';
import 'package:svg_flutter/svg_flutter.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(child: SvgPicture.asset('assets/image/arrow.svg')),
        centerTitle: true,
        title: Text(
          'My Cart',
          textAlign: TextAlign.center,
          style: Style.style25,
        ),
      ),
      body: MyCartViewBody(),
    );
  }
}
