import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trip_advisor/modules/login/presentation/view/login_view.dart';
import 'package:trip_advisor/modules/signup/presentation/bloc/signup_bloc.dart';
import 'package:trip_advisor/modules/signup/presentation/bloc/signup_event.dart';
import 'package:trip_advisor/modules/signup/presentation/widgets/password_rules_widget.dart';

import '../../../../common/helpers/enums/enums.dart';
import '../../../../common/widgets/common_text_widget.dart';
import '../../../../common/widgets/primary_button.dart';
import '../../../location_data/presentation/view/location_data_view.dart';
import '../bloc/signup_bloc_state.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Form(
        key: formKey,
        child: LayoutBuilder(
          builder: (context, constraints) {
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
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back_ios_new,
                            color: Colors.white,
                          )),
                      SizedBox(
                        height: constraints.maxHeight * 0.04,
                      ),
                      const CommonText(
                          text: 'Become a Tripadvisor member.',
                          color: Colors.white,
                          fontsize: 28,
                          textOverflow: TextOverflow.clip,
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.w800),
                      SizedBox(
                        height: constraints.maxHeight * 0.05,
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
                      BlocBuilder<SignupBloc, SignupBlocState>(
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
                      PasswordRulesRow(
                          size: constraints, rule: 'At least 6 characters'),
                      SizedBox(
                        height: constraints.maxHeight * 0.01,
                      ),
                      PasswordRulesRow(
                          size: constraints,
                          rule: 'Contains a special character'),
                      SizedBox(
                        height: constraints.maxHeight * 0.03,
                      ),
                      Row(
                        children: [
                          BlocBuilder<SignupBloc, SignupBlocState>(
                              builder: (context, state) {
                            return Checkbox(
                              value: state.isChecked,
                              onChanged: (value) {
                                context.read<SignupBloc>().add(CheckBoxEvent());
                              },
                              activeColor: Colors.purple.shade300,
                              checkColor: Colors.black87,
                            );
                          }),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                  text:
                                      'Yes, inform me on deals & new features. I',
                                  color: Colors.white,
                                  fontsize: 15,
                                  textOverflow: TextOverflow.clip,
                                  textAlign: TextAlign.left,
                                  fontWeight: FontWeight.normal),
                              CommonText(
                                  text: 'can opt out at any time',
                                  color: Colors.white,
                                  fontsize: 15,
                                  textOverflow: TextOverflow.clip,
                                  textAlign: TextAlign.left,
                                  fontWeight: FontWeight.normal),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.08,
                      ),
                      BlocConsumer<SignupBloc, SignupBlocState>(
                        listener: (context, state) {
                          if (state.registerApiState == ApiState.error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                  state.errorMessage,
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                            );
                          } else if (state.registerApiState == ApiState.done) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LocationDataView(
                                  email: emailController.text,
                                  password: passwordController.text,
                                ),
                              ),
                            );
                          }
                        },
                        builder: (context, state) {
                          return PrimaryButton(
                            height: constraints.maxHeight * 0.075,
                            onTap: () {
                              if (!formKey.currentState!.validate()) {
                                context
                                    .read<SignupBloc>()
                                    .updateError('Enter correct credentials');
                              } else {
                                context.read<SignupBloc>().add(RegisterEvent(
                                    email: emailController.text,
                                    password: passwordController.text));
                              }
                            },
                            color: Colors.white,
                            size: constraints,
                            child: Center(
                              child: state.registerApiState == ApiState.loading
                                  ? const CircularProgressIndicator()
                                  : const CommonText(
                                      text: 'Sign up',
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
                      PrimaryButton(
                          height: constraints.maxHeight * 0.075,
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginView()));
                          },
                          color: Colors.black12,
                          size: constraints,
                          child: const Center(
                            child: CommonText(
                                text: 'Sign in',
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
          },
        ),
      )),
    );
  }
}
