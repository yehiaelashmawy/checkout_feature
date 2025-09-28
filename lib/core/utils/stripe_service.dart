import 'package:checkout_payment/core/utils/api_keys.dart';
import 'package:checkout_payment/core/utils/api_service.dart';
import 'package:checkout_payment/features/checkout/data/models/ephemral_key_model/ephemral_key_model.dart';
import 'package:checkout_payment/features/checkout/data/models/init_payment_sheet_input_model.dart';
import 'package:checkout_payment/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_payment/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final ApiService apiService = ApiService();
  Future<PaymentIntentModel> createpaymentintent(
    PaymentIntentInputModel paymentIntentInputModel,
  ) async {
    var response = await apiService.post(
      contentype: Headers.formUrlEncodedContentType,
      body: paymentIntentInputModel.toJson(),
      url: 'https://api.stripe.com/v1/payment_intents',
      token: ApiKeys.secretKey,
    );

    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);

    return paymentIntentModel;
  }

  Future initpaymentsheet({
    required InitPaymentSheetInputModel initPaymentSheetInputModel,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
        customerId: initPaymentSheetInputModel.customerId,
        customerEphemeralKeySecret:
            initPaymentSheetInputModel.ephemralKeySecret,
        merchantDisplayName: 'Yehia Elashmawy',
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    var paymentIntentModel = await createpaymentintent(paymentIntentInputModel);
    var ephemralKeyModel = await createEphemeralKey(
      customerId: paymentIntentInputModel.customerId,
    );

    var initPaymentSheetInputModel = InitPaymentSheetInputModel(
      clientSecret: paymentIntentModel.clientSecret!,
      customerId: paymentIntentInputModel.customerId,
      ephemralKeySecret: ephemralKeyModel.secret!,
    );
    await initpaymentsheet(
      initPaymentSheetInputModel: initPaymentSheetInputModel,
    );

    await displayPaymentSheet();
  }

  Future<EphemralKeyModel> createEphemeralKey({
    required String customerId,
  }) async {
    var response = await apiService.post(
      contentype: Headers.formUrlEncodedContentType,
      body: {'customer': customerId},
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      token: ApiKeys.secretKey,
      headers: {
        'Authorization': 'Bearer ${ApiKeys.secretKey}',
        'Stripe-Version': '2025-08-27.basil',
      },
    );

    var ephemralKeyModel = EphemralKeyModel.fromJson(response.data);

    return ephemralKeyModel;
  }
}
