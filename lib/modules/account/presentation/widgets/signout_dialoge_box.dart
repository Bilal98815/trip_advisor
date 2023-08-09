import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/widgets/common_text_widget.dart';
import '../../../../common/widgets/primary_button.dart';
import '../bloc/account_bloc.dart';
import '../bloc/account_event.dart';

class SignoutDialogBox extends StatelessWidget {
  final BoxConstraints size;

  const SignoutDialogBox({required this.size, super.key});

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
              height: size.maxHeight * 0.01,
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
              height: size.maxHeight * 0.02,
            ),
            const CommonText(
                text: 'Are you sure you want to sign out?',
                color: Colors.white,
                fontsize: 15,
                fontWeight: FontWeight.w300),
            SizedBox(
              height: size.maxHeight * 0.04,
            ),
            PrimaryButton(
                onTap: () {
                  context.read<AccountBloc>().add(SignOutEvent());
                  Navigator.pop(context);
                },
                color: Colors.white,
                height: size.maxHeight * 0.06,
                size: size,
                child: const Center(
                  child: CommonText(
                      text: 'Sign out',
                      color: Colors.black87,
                      fontsize: 15,
                      fontWeight: FontWeight.w700),
                )),
            SizedBox(
              height: size.maxHeight * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
