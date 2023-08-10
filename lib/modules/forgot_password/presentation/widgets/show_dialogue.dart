import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_advisor/common/widgets/primary_button.dart';
import 'package:trip_advisor/modules/forgot_password/presentation/bloc/forgot_password_bloc.dart';
import 'package:trip_advisor/modules/forgot_password/presentation/bloc/forgot_password_event.dart';
import 'package:trip_advisor/modules/login/presentation/view/login_view.dart';

import '../../../../common/widgets/common_text_widget.dart';

class DialogueBox extends StatelessWidget {
  final BoxConstraints constraint;
  final String email;

  const DialogueBox({required this.constraint, required this.email, super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.grey[900],
      surfaceTintColor: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: constraint.maxHeight * 0.02,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                  )),
            ),
            SizedBox(
              height: constraint.maxHeight * 0.02,
            ),
            const CommonText(
                text: 'We\'ve sent a password reset email.',
                color: Colors.white,
                fontsize: 18,
                fontWeight: FontWeight.w700),
            SizedBox(
              height: constraint.maxHeight * 0.02,
            ),
            const CommonText(
                text:
                    'Check your inbox for an email from Tripadvisor and follow the instructions to reset your password',
                color: Colors.white,
                textOverflow: TextOverflow.clip,
                textAlign: TextAlign.center,
                fontsize: 19,
                fontWeight: FontWeight.w400),
            PrimaryButton(
                ignoring: false,
                onTap: () {
                  context.go(LoginView.route());
                },
                color: Colors.white,
                height: constraint.maxHeight * 0.06,
                size: constraint,
                child: const Center(
                  child: CommonText(
                      text: 'Back to sign in',
                      color: Colors.black87,
                      fontsize: 18,
                      fontWeight: FontWeight.w700),
                )),
            SizedBox(
              height: constraint.maxHeight * 0.01,
            ),
            PrimaryButton(
                ignoring: false,
                onTap: () {
                  context
                      .read<ForgotPasswordBloc>()
                      .add(ResetPassword(email: email));
                  Navigator.pop(context);
                },
                color: Colors.black87,
                height: constraint.maxHeight * 0.06,
                size: constraint,
                child: const Center(
                  child: CommonText(
                      text: 'Resend email',
                      color: Colors.white,
                      fontsize: 18,
                      fontWeight: FontWeight.w700),
                )),
          ],
        ),
      ),
    );
  }
}
