import 'package:flutter/material.dart';
import 'package:payment/Features/checkout/presentation/views/widgets/custom_check_icon.dart';
import 'package:payment/Features/checkout/presentation/views/widgets/success_card.dart';

import 'custom_dashed_line.dart';

class SuccessViewBody extends StatelessWidget {
  const SuccessViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const SuccessCard(),
          Positioned(
              left: 20 + 7,
              right: 20 + 7,
              bottom: MediaQuery.sizeOf(context).height * .2 + 20,
              child: const CustomDashedLine()),
          Positioned(
            left: -20,
            bottom: MediaQuery.sizeOf(context).height * .2,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          Positioned(
            right: -20,
            bottom: MediaQuery.sizeOf(context).height * .2,
            child: const CircleAvatar(
              backgroundColor: Colors.white,
            ),
          ),
          const Positioned(
            right: 0,
            left: 0,
            top: -50,
            child: CircleAvatar(
              backgroundColor: Color(0xFFEDEDED),
              radius: 50,
            ),
          ),
          const Positioned(
            right: 0,
            left: 0,
            top: -40,
            child: CustomCheckIcon(),
          ),
        ],
      ),
    );
  }
}
