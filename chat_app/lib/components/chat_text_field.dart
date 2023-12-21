import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants.dart';
import '../cubits/chat/cubit/chat_cubit.dart';

class ChatTextFeild extends StatelessWidget {
  const ChatTextFeild({
    super.key,
    required this.messageController,
    required this.email,
    required ScrollController controller,
  }) : _controller = controller;

  final TextEditingController messageController;
  final String email;
  final ScrollController _controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: messageController,
      onSubmitted: (data) {
        BlocProvider.of<ChatCubit>(context)
            .sendMessage(message: data, email: email);
        messageController.clear();
        _controller.animateTo(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn,
        );
      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        hintText: 'Send Message',
        suffixIcon: IconButton(
          icon: const Icon(
            Icons.send,
            color: kPrimaryColor,
          ),
          onPressed: () {
            String data = messageController.text;
            BlocProvider.of<ChatCubit>(context)
                .sendMessage(message: data, email: email);
            messageController.clear();
            _controller.animateTo(0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn);
          },
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
