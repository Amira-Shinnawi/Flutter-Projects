import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/Features/checkout/data/repos/checkout_repo_impl.dart';
import 'package:payment/Features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:payment/Features/checkout/presentation/views/widgets/payment_method_bottom_sheet.dart';
import 'package:payment/Features/checkout/presentation/views/widgets/total_price.dart';
import 'package:payment/core/utils/assets.dart';

import '../../../../../core/widgets/custom_button.dart';
import 'order_info_item.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: Image.asset(
              AssetsData.myCart,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const OrderInfoItem(
            title: 'Order Subtotal',
            value: '\$42.79',
          ),
          const OrderInfoItem(
            title: 'Discount ',
            value: '\$0',
          ),
          const OrderInfoItem(
            title: 'Shipping',
            value: '\$8',
          ),
          const Divider(
            thickness: 2,
            height: 34,
            indent: 15,
            endIndent: 15,
            color: Color(0xFFC6C6C6),
          ),
          const TotalPrice(title: 'Total', value: '\$50.79'),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
            buttonName: 'Complete Payment',
            onTap: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => const PaymentDetails(),
              //   ),
              // );
              showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  builder: (context) {
                    return BlocProvider(
                      create: (context) => PaymentCubit(CheckoutRepoImpel()),
                      child: const PaymentMethodsBottomSheet(),
                    );
                  });
            },
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
