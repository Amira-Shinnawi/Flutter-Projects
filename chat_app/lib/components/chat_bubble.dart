import 'package:chat_app/Model/message.dart';
import 'package:chat_bubbles/bubbles/bubble_normal.dart';
import 'package:flutter/material.dart';


class ChatBubble extends StatelessWidget {
  ChatBubble({
    super.key,
    required this.message,
    required this.isSender,
    required this.color,
  });
  final Message message;
  bool isSender;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 16),
      child: BubbleNormal(
        text: message.message,
        isSender: isSender,
        color: color,
        tail: true,
        textStyle: const TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
