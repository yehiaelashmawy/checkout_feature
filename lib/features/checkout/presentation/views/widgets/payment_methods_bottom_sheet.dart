import 'package:checkout_payment/features/checkout/presentation/views/widgets/custom_bouton_bloc_consumer.dart';
import 'package:checkout_payment/features/checkout/presentation/views/widgets/payment_method_list_view.dart';
import 'package:flutter/material.dart';

class PaymentMethodsBottomSheet extends StatefulWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  State<PaymentMethodsBottomSheet> createState() =>
      _PaymentMethodsBottomSheetState();
}

class _PaymentMethodsBottomSheetState extends State<PaymentMethodsBottomSheet> {
  bool isPaypal = false;

  updatePaymentMethod({required int index}) {
    if (index == 0) {
      isPaypal = false;
    } else {
      isPaypal = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 20.0,
        left: 20,
        bottom: 50,
        top: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 6),
          PaymentMethodsListView(updatePaymentMethod: updatePaymentMethod),
          SizedBox(height: 32),
          CustomBouttonBlocConsumer(isPaypal: isPaypal),
        ],
      ),
    );
  }
}
