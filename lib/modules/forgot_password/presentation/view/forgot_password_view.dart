import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trip_advisor/common/widgets/primary_button.dart';
import 'package:trip_advisor/modules/forgot_password/presentation/bloc/forgot_password_bloc.dart';
import 'package:trip_advisor/modules/forgot_password/presentation/bloc/forgot_password_bloc_state.dart';
import 'package:trip_advisor/modules/forgot_password/presentation/bloc/forgot_password_event.dart';
import 'package:trip_advisor/modules/forgot_password/presentation/widgets/show_dialogue.dart';

import '../../../../common/helpers/enums/enums.dart';
import '../../../../common/widgets/common_text_widget.dart';

class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({super.key});

  final _key = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _key,
          child: LayoutBuilder(builder: (context, size) {
            return Container(
              width: size.maxWidth,
              height: size.maxHeight,
              color: Colors.black87,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.maxWidth * 0.08),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.maxHeight * 0.03,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                          )),
                      SizedBox(
                        height: size.maxHeight * 0.04,
                      ),
                      const CommonText(
                          text: 'Enter the email address you used to sign up.',
                          color: Colors.white,
                          fontsize: 28,
                          textAlign: TextAlign.left,
                          textOverflow: TextOverflow.clip,
                          fontWeight: FontWeight.w800),
                      SizedBox(
                        height: size.maxHeight * 0.04,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Email address',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: size.maxHeight * 0.01,
                          ),
                          TextFormField(
                            controller: emailController,
                            validator: (val) =>
                                val!.isEmpty ? "Enter email!" : null,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'Email address',
                              hintStyle: const TextStyle(color: Colors.grey),
                              border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(8)),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.maxHeight * 0.05,
                      ),
                      BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
                        listener: (context, state) {
                          if (state.resetPasswordState ==
                              ResetPasswordState.failure) {
                            Fluttertoast.showToast(
                                msg: state.error,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.grey,
                                textColor: Colors.red,
                                fontSize: 16.0);
                          } else if (state.resetPasswordState ==
                              ResetPasswordState.success) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return DialogueBox(
                                      constraint: size,
                                      email: emailController.text.trim());
                                });
                          }
                        },
                        builder: (context, state) {
                          return PrimaryButton(
                              onTap: () {
                                if (!_key.currentState!.validate()) {
                                  context.read<ForgotPasswordBloc>().add(ShowError(
                                      error:
                                          'Please enter correct Credentials'));
                                  debugPrint('------> Enter email');
                                } else {
                                  context.read<ForgotPasswordBloc>().add(
                                      ResetPassword(
                                          email: emailController.text.trim()));
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return DialogueBox(
                                            constraint: size,
                                            email: emailController.text.trim());
                                      });
                                }
                              },
                              color: Colors.white,
                              height: size.maxHeight * 0.075,
                              size: size,
                              child: const Center(
                                child: CommonText(
                                    text: 'Send email',
                                    color: Colors.black87,
                                    fontsize: 20,
                                    fontWeight: FontWeight.w500),
                              ));
                        },
                      ),
                      SizedBox(
                        height: size.maxHeight * 0.035,
                      ),
                      const CommonText(
                          text: 'We\'ll send you a password reset email.',
                          color: Colors.white,
                          fontsize: 16,
                          fontWeight: FontWeight.w400),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
