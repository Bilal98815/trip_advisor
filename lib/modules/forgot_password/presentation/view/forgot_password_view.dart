part of 'view.dart';

class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({super.key});

  final _key = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Form(
          key: _key,
          child: LayoutBuilder(
            builder: (context, size) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: size.maxWidth * 0.08),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.maxHeight * 0.04),
                      Text(
                        LocaleStrings.forgotPasswordHeading,
                        style: textTheme.titleLarge,
                      ),
                      SizedBox(height: size.maxHeight * 0.04),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleStrings.forgotPasswordEmailLabel,
                            style: textTheme.labelSmall,
                          ),
                          SizedBox(height: size.maxHeight * 0.01),
                          CustomTextFormField(
                            controller: emailController,
                            validator: (val) => val!.isEmpty
                                ? LocaleStrings.forgotPasswordEmailError
                                : null,
                          ),
                        ],
                      ),
                      SizedBox(height: size.maxHeight * 0.05),
                      BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
                        listener: (context, state) {
                          if (state.resetPasswordState ==
                              ResetPasswordState.failure) {
                            Fluttertoast.showToast(
                              msg: state.error,
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              backgroundColor: kGrey,
                              textColor: Theme.of(context).colorScheme.error,
                              fontSize: 16.0,
                            );
                          } else if (state.resetPasswordState ==
                              ResetPasswordState.success) {
                            showDialog<void>(
                              context: context,
                              builder: (context) {
                                return DialogueBox(
                                  constraint: size,
                                  email: emailController.text.trim(),
                                );
                              },
                            );
                          }
                        },
                        builder: (context, state) {
                          return PrimaryButton(
                            ignoring: false,
                            onTap: () {
                              if (!_key.currentState!.validate()) {
                                context.read<ForgotPasswordBloc>().add(
                                      ShowError(
                                        error:
                                            LocaleStrings.forgotPasswordError,
                                      ),
                                    );
                                debugPrint('------> Enter email');
                              } else {
                                context.read<ForgotPasswordBloc>().add(
                                      ResetPassword(
                                        email: emailController.text.trim(),
                                      ),
                                    );
                                showDialog<void>(
                                  context: context,
                                  builder: (context) {
                                    return DialogueBox(
                                      constraint: size,
                                      email: emailController.text.trim(),
                                    );
                                  },
                                );
                              }
                            },
                            color: colorScheme.onBackground,
                            height: size.maxHeight * 0.075,
                            size: size,
                            child: Center(
                              child: Text(
                                LocaleStrings.forgotPasswordButton,
                                style: textTheme.headlineSmall?.copyWith(
                                  color: colorScheme.background,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: size.maxHeight * 0.035),
                      Text(
                        LocaleStrings.forgotPasswordInformation,
                        style: textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
