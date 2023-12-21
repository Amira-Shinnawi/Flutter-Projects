import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/Features/checkout/data/models/ephemeral_key/ephemeral_key.model.dart';
import 'package:payment/Features/checkout/data/models/init_Payment_Sheet_Input_Model.dart';
import 'package:payment/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment/Features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:payment/core/errors/failures.dart';
import 'package:payment/core/utils/api_keys.dart';
import 'package:payment/core/utils/api_service.dart';

class StripeService {
  final APIService apiService = APIService();
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      contentType: Headers.formUrlEncodedContentType,
      url: 'https://api.stripe.com/v1/payment_intents',
      token: APIKeys.secretKey,
    );

    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);

    return paymentIntentModel;
  }

  Future<void> initPaymentSheet(
      {required InitPaymentSheetInputModel initPaymentSheetInputModel}) async {
    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: initPaymentSheetInputModel.clientSecret,
          customerEphemeralKeySecret: initPaymentSheetInputModel.ephemeralKey,
          customerId: initPaymentSheetInputModel.customerID,
          merchantDisplayName: 'amira',
        ),
      );
    } catch (e) {
      ServerFailure(errorMessage: e.toString());
      rethrow;
    }
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    var ephemeralKeyModel = await createEphemeralKey(
        customerID: paymentIntentInputModel.customerID);

    var initPaymentSheetInputModel = InitPaymentSheetInputModel(
        clientSecret: paymentIntentModel.clientSecret!,
        customerID: paymentIntentInputModel.customerID,
        ephemeralKey: ephemeralKeyModel.secret!);
    await initPaymentSheet(
        initPaymentSheetInputModel: initPaymentSheetInputModel);
    await displayPaymentSheet();
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {required String customerID}) async {
    var response = await apiService.post(
        body: {
          'customer': customerID,
        },
        contentType: Headers.formUrlEncodedContentType,
        url: 'https://api.stripe.com/v1/ephemeral_keys',
        token: APIKeys.secretKey,
        headers: {
          'Authorization': "Bearer ${APIKeys.secretKey}",
          'Stripe-Version': '2023-10-16',
        });

    var ephemeralKey = EphemeralKeyModel.fromJson(response.data);

    return ephemeralKey;
  }
}
