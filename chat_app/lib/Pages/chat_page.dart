import 'package:chat_app/components/chat_bubble.dart';
import 'package:chat_app/constants.dart';
import 'package:chat_app/cubits/chat/cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/chat_text_field.dart';

class ChatPage extends StatelessWidget {
  static String id = 'ChatPage';

  TextEditingController messageController = TextEditingController();
  final _controller = ScrollController();

  ChatPage({super.key});
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments.toString();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              kLogo,
              width: 50,
            ),
            const Text('Chat'),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                var messagesList =
                    BlocProvider.of<ChatCubit>(context).messagesList;
                return ListView.builder(
                    reverse: true,
                    controller: _controller,
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return messagesList[index].id == email
                          ? ChatBubble(
                              isSender: false,
                              color: kPrimaryColor,
                              message: messagesList[index],
                            )
                          : ChatBubble(
                              message: messagesList[index],
                              isSender: true,
                              color: kFriendsChat);
                    });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ChatTextFeild(
                messageController: messageController,
                email: email,
                controller: _controller),
          ),
        ],
      ),
    );
  }
}
