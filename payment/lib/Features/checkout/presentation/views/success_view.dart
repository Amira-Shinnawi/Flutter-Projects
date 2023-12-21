import 'package:flutter/material.dart';
import 'package:payment/Features/checkout/presentation/views/widgets/success_view_body.dart';
import 'package:payment/core/widgets/custom_app_bar.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: ''),
      body: Transform.translate(
        offset: const Offset(0, -16),
        child: const SuccessViewBody(),
      ),
    );
  }
}
