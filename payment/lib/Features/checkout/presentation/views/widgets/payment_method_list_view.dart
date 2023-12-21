import 'package:flutter/material.dart';
import 'package:payment/Features/checkout/presentation/views/widgets/payment_method_item.dart';

import '../../../../../core/utils/assets.dart';

class PaymentMethodListView extends StatefulWidget {
  const PaymentMethodListView({super.key, required this.updatePaymentMethod});
  final Function({required int index}) updatePaymentMethod;

  @override
  State<PaymentMethodListView> createState() => _PaymentMethodListViewState();
}

class _PaymentMethodListViewState extends State<PaymentMethodListView> {
  final List<String> paymentsMethodItems = const [
    AssetsData.card,
    AssetsData.paypal,
    AssetsData.pay,
  ];
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.builder(
          itemCount: paymentsMethodItems.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: () {
                  activeIndex = index;
                  setState(() {});
                  widget.updatePaymentMethod(index:activeIndex);
                },
                child: PaymentMethodItem(
                  isActive: activeIndex == index,
                  image: paymentsMethodItems[index],
                ),
              ),
            );
          }),
    );
  }
}
