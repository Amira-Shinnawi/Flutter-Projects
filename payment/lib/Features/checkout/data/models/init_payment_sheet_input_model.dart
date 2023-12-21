class InitPaymentSheetInputModel {
  final String clientSecret;
  final String customerID;
  final String ephemeralKey;

  InitPaymentSheetInputModel(
      {required this.clientSecret,
      required this.customerID,
      required this.ephemeralKey});
}
