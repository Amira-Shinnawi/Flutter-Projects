import 'package:chat_app/Pages/login_page.dart';
import 'package:chat_app/bolcs/auth_bloc/auth_bloc.dart';
import 'package:chat_app/components/custom_button.dart';
import 'package:chat_app/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../constants.dart';
import '../cubits/chat/cubit/chat_cubit.dart';
import '../helper/show_snackBar.dart';
import 'chat_page.dart';

class RegisterPage extends StatelessWidget {
  String? email;

  String? password;
  bool isLoading = false;
  static String id = 'registerPage';
  GlobalKey<FormState> formkey = GlobalKey();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          isLoading = true;
        } else if (state is RegisterSuccess) {
          BlocProvider.of<ChatCubit>(context).getMessages();
          Navigator.pushNamed(context, ChatPage.id, arguments: email);
          isLoading = false;
        } else if (state is RegisterFailure) {
          showSnackBar(context, state.errorMessage);
          isLoading = false;
        }
      },
      builder: (context, state) {
        return LoadingOverlay(
          isLoading: isLoading,
          child: Scaffold(
            backgroundColor: kPrimaryColor,
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Form(
                key: formkey,
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 75,
                    ),
                    Image.asset(
                      'assets/images/scholar.png',
                      height: 100,
                    ),
                    const Center(
                      child: Text(
                        'Scholar Chat',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Pacifico',
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 75,
                    ),
                    const Row(
                      children: [
                        Text(
                          'REGISTER',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomFormTextField(
                      onChanged: (data) {
                        email = data;
                      },
                      hintText: 'Email',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomFormTextField(
                      onChanged: (data) {
                        password = data;
                      },
                      hintText: 'Password',
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    CustomButton(
                        onTap: () {
                          if (formkey.currentState!.validate()) {
                            BlocProvider.of<AuthBloc>(context).add(
                                RegisterEvent(
                                    email: email!, password: password!));
                          }
                        },
                        buttonName: 'REGISTER'),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'already have an account?',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, LoginPage.id);
                          },
                          child: const Text(
                            '  Login',
                            style: TextStyle(
                              color: Color(0xffC7EDE6),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
