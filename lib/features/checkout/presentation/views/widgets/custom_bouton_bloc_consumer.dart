import 'package:checkout_payment/core/functions/get_transaction_data.dart';
import 'package:checkout_payment/core/utils/api_keys.dart';
import 'package:checkout_payment/features/checkout/data/models/amount_model/amount_model.dart';
import 'package:checkout_payment/features/checkout/data/models/item_list_model/item_list_model.dart';
import 'package:checkout_payment/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_payment/features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:checkout_payment/features/checkout/presentation/views/thanks_you_view.dart';
import 'package:checkout_payment/features/checkout/presentation/views/widgets/custom_boutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

class CustomBouttonBlocConsumer extends StatelessWidget {
  const CustomBouttonBlocConsumer({super.key, required this.isPaypal});
  final bool isPaypal;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) {
                return ThankYouView();
              },
            ),
          );
        }

        if (state is PaymentFailure) {
          Navigator.of(context).pop();
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errMessage)));
        }
      },
      builder: (context, state) {
        return CustomBoutton(
          onTap: () {
            if (isPaypal) {
              var transactionData = getTransactinData();
              executePaypalPayment(context, transactionData);
            } else {
              executeStripePayment(context);
            }
          },
          isLoading: state is PaymentLoading ? true : false,

          text: 'Continue',
        );
      },
    );
  }

  void executeStripePayment(BuildContext context) {
    PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
      amount: '100',
      currency: 'USD',
      customerId: 'cus_T8bgOaDqieyRwJ',
    );
    BlocProvider.of<PaymentCubit>(
      context,
    ).makePayment(paymentIntentInputModel: paymentIntentInputModel);
  }

  void executePaypalPayment(
    BuildContext context,
    ({AmountModel amount, ItemListModel itemList}) transactionData,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: ApiKeys.clientId,
          secretKey: ApiKeys.paypalSecretKey,
          transactions: [
            {
              "amount": transactionData.amount.toJson(),
              "description": "The payment transaction description.",
              "item_list": transactionData.itemList.toJson(),
            },
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ThankYouView();
                },
              ),
              (route) {
                if (route.settings.name == '/') {
                  return true;
                } else {
                  return false;
                }
              },
            );
          },
          onError: (error) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(error.toString())));
            Navigator.pop(context);
            Navigator.pop(context);
          },
          onCancel: () {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Canceld')));
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
