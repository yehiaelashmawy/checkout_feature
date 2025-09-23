import 'package:checkout_payment/features/checkout/data/repos/checkout_repo.dart';
import 'package:checkout_payment/features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:checkout_payment/features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:checkout_payment/features/checkout/presentation/views/widgets/custom_boutton.dart';
import 'package:checkout_payment/features/checkout/presentation/views/widgets/order_info_item.dart';
import 'package:checkout_payment/features/checkout/presentation/views/widgets/payment_methods_bottom_sheet.dart';
import 'package:checkout_payment/features/checkout/presentation/views/widgets/total_price.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          CustomBoutton(
            onTap: () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                showDragHandle: true,
                backgroundColor: Colors.white,
                context: context,
                builder: (context) {
                  return BlocProvider(
                    create: (context) => PaymentCubit(CheckoutRepoImpl()),
                    child: PaymentMethodsBottomSheet(),
                  );
                },
              );
            },
            text: 'Complete Payment',
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
