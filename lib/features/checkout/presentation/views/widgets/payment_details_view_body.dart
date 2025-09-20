import 'package:checkout_payment/features/checkout/presentation/views/widgets/custom_boutton.dart';
import 'package:checkout_payment/features/checkout/presentation/views/widgets/custom_credit_card.dart';
import 'package:checkout_payment/features/checkout/presentation/views/widgets/payment_method_list_view.dart';
import 'package:flutter/material.dart';

class PaymentDetailsViewBody extends StatelessWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: PaymentMethodsListView()),
        SliverFillRemaining(child: CustomCreditCard()),
        SliverToBoxAdapter(child: CustomBoutton()),
      ],
    );
  }
}
