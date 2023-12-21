import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment/Features/checkout/data/models/amount/amount.model.dart';
import 'package:payment/Features/checkout/data/models/amount/details.model.dart';
import 'package:payment/Features/checkout/data/models/item_list_model/item.dart';
import 'package:payment/Features/checkout/data/models/item_list_model/item_list_model.dart';
import 'package:payment/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment/Features/checkout/presentation/manager/cubit/payment_cubit.dart';
import 'package:payment/Features/checkout/presentation/views/success_view.dart';
import 'package:payment/core/utils/api_keys.dart';

import '../../../../../core/widgets/custom_button.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
    required this.isPaypal,
  });
  final bool isPaypal;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSuccess) {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) {
            return const SuccessView();
          }));
        }

        if (state is PaymentFailure) {
          Navigator.of(context).pop();
          
          SnackBar snackBar = SnackBar(content: Text(state.errorMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return CustomButton(
            onTap: () {
              if (isPaypal) {
                var transactionsData = getTransactionsData();
                executePayPalPayment(context, transactionsData);
              } else {
                executeStripePayment(context);
              }
            },
            isLoading: state is PaymentLoading ? true : false,
            buttonName: 'Continue');
      },
    );
  }

  void executeStripePayment(BuildContext context) {
    PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
      amount: '100',
      currency: 'USD',
      customerID: APIKeys.customerID,
    );
    BlocProvider.of<PaymentCubit>(context)
        .makePayment(paymentIntentInputModel: paymentIntentInputModel);
  }

  void executePayPalPayment(BuildContext context,
      ({AmountModel amount, ItemListModel itemList}) transactionData) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PaypalCheckoutView(
        sandboxMode: true, // test = true or real =false
        clientId: APIKeys.clientID,
        secretKey: APIKeys.paypalSecretKey,
        transactions: [
          {
            "amount": transactionData.amount.toJson(),
            "description": "The payment transaction description.",
            "item_list": transactionData.itemList.toJson(),
          }
        ],
        note: "Contact us for any questions on your order.",
        onSuccess: (Map params) async {
          log("onSuccess: $params");
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) {
            return const SuccessView();
          }));
        },
        onError: (error) {
          log("onError: $error");
          Navigator.pop(context);
        },
        onCancel: () {
          print('cancelled:');
          Navigator.pop(context);
        },
      ),
    ));
  }

  ({AmountModel amount, ItemListModel itemList}) getTransactionsData() {
    var amount = AmountModel(
      total: '100',
      currency: 'USD',
      details: DetailsModel(
        shipping: '0',
        shippingDiscount: 0,
        subtotal: '100',
      ),
    );
    List<OrderItemModel> orders = [
      OrderItemModel(
        currency: 'USD',
        name: 'Apple',
        price: '10',
        quantity: 4,
      ),
      OrderItemModel(
        currency: 'USD',
        name: 'Apple',
        price: '12',
        quantity: 5,
      ),
    ];
    var itemList = ItemListModel(
      orders: orders,
    );
    return (amount: amount, itemList: itemList);
  }
}
