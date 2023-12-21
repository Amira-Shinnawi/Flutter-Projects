import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:payment/Features/checkout/presentation/views/success_view.dart';
import 'package:payment/core/widgets/custom_button.dart';

import 'custom_credit_card.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        // const SliverToBoxAdapter(
        //   child: PaymentMethodsListView(),
        // ),
        SliverToBoxAdapter(
          child: CustomCreditCard(
            autovalidateMode: autovalidateMode,
            formkey: formKey,
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: CustomButton(
                  buttonName: 'Pay',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      log('Payment');
                    } else {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SuccessView(),
                      ));
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                ),
              )),
        ),
      ],
    );
  }
}
