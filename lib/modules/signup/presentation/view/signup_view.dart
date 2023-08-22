part of 'view.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: constraints.maxWidth * 0.08,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: constraints.maxHeight * 0.04,
                      ),
                      Text(
                        LocaleStrings.signupTitle,
                        style: textTheme.titleLarge,
                        overflow: TextOverflow.clip,
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: constraints.maxHeight * 0.05),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleStrings.signupEmailFieldTitle,
                            style: textTheme.labelSmall,
                          ),
                          SizedBox(height: constraints.maxHeight * 0.01),
                          CustomTextFormField(
                            hintText: LocaleStrings.signupEmailFieldTitle,
                            controller: emailController,
                            validator: (val) =>
                                val!.isEmpty ? 'Enter email!' : null,
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
                              Text(
                                LocaleStrings.signupPasswordFieldTitle,
                                style: textTheme.labelSmall,
                              ),
                              SizedBox(height: constraints.maxHeight * 0.01),
                              CustomTextFormField(
                                obscureText: true,
                                hintText:
                                    LocaleStrings.signupPasswordFieldTitle,
                                controller: passwordController,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return 'Enter password!';
                                  } else if (val.length < 6) {
                                    return 'please enter more than 6 digits';
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                            ],
                          );
                        },
                      ),
                      SizedBox(height: constraints.maxHeight * 0.03),
                      PasswordRulesRow(
                        size: constraints,
                        rule: LocaleStrings.characterNumbersText,
                      ),
                      SizedBox(height: constraints.maxHeight * 0.01),
                      PasswordRulesRow(
                        size: constraints,
                        rule: LocaleStrings.specialCharacterText,
                      ),
                      SizedBox(height: constraints.maxHeight * 0.03),
                      Row(
                        children: [
                          BlocBuilder<SignupBloc, SignupBlocState>(
                            builder: (context, state) {
                              return Checkbox(
                                value: state.isChecked,
                                onChanged: (value) {
                                  context
                                      .read<SignupBloc>()
                                      .add(CheckBoxEvent());
                                },
                                checkColor: colorScheme.background,
                              );
                            },
                          ),
                          SizedBox(
                            width: constraints.maxWidth * 0.7,
                            child: Text(
                              LocaleStrings.signupCheckbox,
                              style: textTheme.bodyMedium,
                              overflow: TextOverflow.clip,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: constraints.maxHeight * 0.08),
                      BlocConsumer<SignupBloc, SignupBlocState>(
                        listener: (context, state) {
                          if (state.registerApiState == ApiState.error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: colorScheme.error,
                                content: Text(state.errorMessage),
                              ),
                            );
                          } else if (state.registerApiState == ApiState.done) {
                            context.goNamed(
                              LocationDataPage.routeName,
                              extra: {
                                'password': passwordController.text,
                                'email': emailController.text,
                              },
                            );
                          }
                        },
                        builder: (context, state) {
                          return PrimaryButton(
                            ignoring: false,
                            height: constraints.maxHeight * 0.075,
                            onTap: () {
                              if (!formKey.currentState!.validate()) {
                                context.read<SignupBloc>().add(
                                      SignupErrorUpdated(
                                        LocaleStrings.signupError,
                                      ),
                                    );
                              } else {
                                context.read<SignupBloc>().add(
                                      RegisterEvent(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      ),
                                    );
                              }
                            },
                            color: colorScheme.onBackground,
                            size: constraints,
                            child: Center(
                              child: state.registerApiState == ApiState.loading
                                  ? const CircularProgressIndicator()
                                  : Text(
                                      LocaleStrings.signupButton,
                                      style: textTheme.headlineSmall?.copyWith(
                                        color: colorScheme.background,
                                      ),
                                    ),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.03,
                      ),
                      PrimaryButton(
                        ignoring: false,
                        height: constraints.maxHeight * 0.075,
                        onTap: () => context.go(LoginView.route()),
                        color: colorScheme.background,
                        size: constraints,
                        child: Center(
                          child: Text(
                            LocaleStrings.signInButton,
                            style: textTheme.headlineSmall?.copyWith(
                              color: colorScheme.onBackground,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: constraints.maxHeight * 0.08),
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
