import 'package:flutter/material.dart';

import '../../../../../core/utils/style.dart';

class PaymentItemInfo extends StatelessWidget {
  const PaymentItemInfo({super.key, required this.title, required this.value});
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: Styles.style18,
          ),
          Text(
            value,
            style: Styles.style18.copyWith(
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
