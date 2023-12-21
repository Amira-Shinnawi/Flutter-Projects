import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/Features/checkout/presentation/views/check_out_view.dart';
import 'package:payment/core/utils/api_keys.dart';

void main() {
  Stripe.publishableKey = APIKeys.publishableKey;
  runApp(const CheckoutApp());
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CheckoutView(),
    );
  }
}
