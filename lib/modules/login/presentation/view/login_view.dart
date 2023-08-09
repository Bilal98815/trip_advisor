import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trip_advisor/common/widgets/authentication_button.dart';
import 'package:trip_advisor/common/widgets/common_text_widget.dart';
import 'package:trip_advisor/modules/account/presentation/bloc/account_bloc.dart';
import 'package:trip_advisor/modules/account/presentation/bloc/account_event.dart';
import 'package:trip_advisor/modules/forgot_password/presentation/view/forgot_password_view.dart';
import 'package:trip_advisor/modules/signup/presentation/view/signup_view.dart';

import '../../../../common/helpers/enums/enums.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_bloc_state.dart';
import '../bloc/login_event.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  static const routeName = "login";
  static String route() => "/onboarding/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: LayoutBuilder(builder: (context, constraints) {
            return Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              color: Colors.black87,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: constraints.maxWidth * 0.08),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: constraints.maxHeight * 0.03,
                      ),
                      InkWell(
                          onTap: () {
                            context.pop();
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                          )),
                      SizedBox(
                        height: constraints.maxHeight * 0.04,
                      ),
                      const CommonText(
                          text: 'Welcome back.',
                          color: Colors.white,
                          fontsize: 31,
                          fontWeight: FontWeight.w800),
                      SizedBox(
                        height: constraints.maxHeight * 0.07,
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
                            height: constraints.maxHeight * 0.01,
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
                        height: constraints.maxHeight * 0.03,
                      ),
                      BlocBuilder<LoginBloc, LoginBlocState>(
                        builder: (context, state) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Password',
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: constraints.maxHeight * 0.01,
                              ),
                              TextFormField(
                                obscureText: true,
                                controller: passwordController,
                                style: const TextStyle(color: Colors.white),
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Enter password!";
                                  } else if (val.length < 6) {
                                    return "please enter more than 6 digits";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: 'password',
                                  hintStyle:
                                      const TextStyle(color: Colors.grey),
                                  border: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.circular(8)),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black)),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.03,
                      ),
                      InkWell(
                        onTap: () => context.go(ForgotPasswordView.route()),
                        child: CommonText(
                            text: 'Forgot password?',
                            color: Colors.purple.shade200,
                            fontsize: 22,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.08,
                      ),
                      BlocConsumer<LoginBloc, LoginBlocState>(
                        listener: (context, state) async {
                          if (state.authApiState == ApiState.error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                  state.errorMessage,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          } else if (state.authApiState == ApiState.done) {
                            context.read<LoginBloc>().setEmailInPreferences(
                                emailController.text.trim());
                            if (context.mounted) context.go('/explore');
                          }
                        },
                        builder: (context, state) {
                          return AuthenticationButton(
                            height: constraints.maxHeight * 0.075,
                            onTap: () {
                              if (!formKey.currentState!.validate()) {
                                context
                                    .read<LoginBloc>()
                                    .updateError('Enter correct credentials');
                              } else {
                                context.read<LoginBloc>().add(OnLoginEvent(
                                    email: emailController.text,
                                    password: passwordController.text));
                                context.read<AccountBloc>().add(
                                    UpdateSigningCondition(
                                        condition: SignOutCondition.signIn));
                              }
                            },
                            color: Colors.white,
                            size: constraints,
                            child: Center(
                              child: state.authApiState == ApiState.loading
                                  ? const CircularProgressIndicator()
                                  : const CommonText(
                                      text: 'Sign in',
                                      color: Colors.black87,
                                      fontsize: 20,
                                      fontWeight: FontWeight.w500),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.03,
                      ),
                      AuthenticationButton(
                          height: constraints.maxHeight * 0.075,
                          onTap: () => context.go(SignUpView.route()),
                          color: Colors.black12,
                          size: constraints,
                          child: const Center(
                            child: CommonText(
                                text: 'Sign up',
                                color: Colors.white,
                                fontsize: 20,
                                fontWeight: FontWeight.w500),
                          )),
                      SizedBox(
                        height: constraints.maxHeight * 0.08,
                      ),
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
