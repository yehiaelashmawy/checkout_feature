class InitPaymentSheetInputModel {
  final String clientSecret;
  final String customerId;
  final String ephemralKeySecret;

  InitPaymentSheetInputModel({
    required this.clientSecret,
    required this.customerId,
    required this.ephemralKeySecret,
  });
}
