import 'package:checkout_payment/core/utils/api_keys.dart';
import 'package:checkout_payment/features/checkout/data/models/amount_model/amount_model.dart';
import 'package:checkout_payment/features/checkout/data/models/amount_model/details.dart';
import 'package:checkout_payment/features/checkout/data/models/item_list_model/item.dart';
import 'package:checkout_payment/features/checkout/data/models/item_list_model/item_list_model.dart';
import 'package:checkout_payment/features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:checkout_payment/features/checkout/presentation/views/thanks_you_view.dart';
import 'package:checkout_payment/features/checkout/presentation/views/widgets/custom_boutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

class CustomBouttonBlocConsumer extends StatelessWidget {
  const CustomBouttonBlocConsumer({super.key});

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
            // PaymentIntentInputModel paymentIntentInputModel =
            //     PaymentIntentInputModel(
            //       amount: '100',
            //       currency: 'USD',
            //       customerId: 'cus_T8bgOaDqieyRwJ',
            //     );
            // BlocProvider.of<PaymentCubit>(
            //   context,
            // ).makePayment(paymentIntentInputModel: paymentIntentInputModel);

            var transactionData = getTransactinData();
            executePaypalPayment(context, transactionData);
          },
          isLoading: state is PaymentLoading ? true : false,

          text: 'Continue',
        );
      },
    );
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
            print("onSuccess: $params");
          },
          onError: (error) {
            print("onError: $error");
            Navigator.pop(context);
          },
          onCancel: () {
            print('cancelled:');
          },
        ),
      ),
    );
  }

  ({AmountModel amount, ItemListModel itemList}) getTransactinData() {
    var amount = AmountModel(
      total: '100',
      currency: 'USD',
      details: Details(subtotal: '100', shipping: '0', shippingDiscount: 0),
    );

    List<OrederItemModel> orders = [
      OrederItemModel(currency: 'USD', name: 'Apple', quantity: 10, price: '4'),
      OrederItemModel(currency: 'USD', name: 'Apple', quantity: 5, price: '5'),
    ];

    var itemList = ItemListModel(items: orders);

    return (amount: amount, itemList: itemList);
  }
}
