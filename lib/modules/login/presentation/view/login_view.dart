part of 'view.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  static const routeName = 'login';
  static String route() => '/onboarding/login';

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
                        LocaleStrings.loginHeading,
                        style: textTheme.titleLarge,
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.07,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocaleStrings.loginEmailLabel,
                            style: textTheme.labelSmall,
                          ),
                          SizedBox(height: constraints.maxHeight * 0.01),
                          CustomTextFormField(
                            controller: emailController,
                            validator: (val) => val!.isEmpty
                                ? LocaleStrings.loginEmailError
                                : null,
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
                              Text(
                                LocaleStrings.loginPasswordLabel,
                                style: textTheme.labelSmall,
                              ),
                              SizedBox(
                                height: constraints.maxHeight * 0.01,
                              ),
                              CustomTextFormField(
                                obscureText: true,
                                controller: passwordController,
                                validator: (val) {
                                  return val!.isEmpty
                                      ? LocaleStrings.loginPasswordEmptyError
                                      : val.length < 6
                                          ? LocaleStrings
                                              .loginPasswordLengthError
                                          : null;
                                },
                              ),
                            ],
                          );
                        },
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.03,
                      ),
                      InkWell(
                        onTap: () => context.go(ForgotPasswordPage.route()),
                        child: Text(
                          LocaleStrings.loginForgotPassword,
                          style: textTheme.labelMedium?.copyWith(
                            color: colorScheme.primary,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.08,
                      ),
                      BlocConsumer<LoginBloc, LoginBlocState>(
                        listener: (context, state) async {
                          if (state.authApiState == ApiState.error) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: colorScheme.error,
                                content: Text(
                                  state.errorMessage,
                                  style: TextStyle(color: colorScheme.onError),
                                ),
                              ),
                            );
                          } else if (state.authApiState == ApiState.done) {
                            context.read<LoginBloc>().setEmailInPreferences(
                                  emailController.text.trim(),
                                );
                            if (context.mounted) {
                              context.go(ExploreView.route());
                            }
                          }
                        },
                        builder: (context, state) {
                          return PrimaryButton(
                            ignoring: false,
                            height: constraints.maxHeight * 0.075,
                            onTap: () {
                              if (!formKey.currentState!.validate()) {
                                context.read<LoginBloc>().add(
                                      LoginErrorUpdated(
                                        LocaleStrings.loginError,
                                      ),
                                    );
                              } else {
                                context.read<LoginBloc>().add(
                                      OnLoginEvent(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      ),
                                    );
                                context.read<AccountBloc>().add(
                                      UpdateSigningCondition(
                                        condition: SignOutCondition.signIn,
                                      ),
                                    );
                              }
                            },
                            color: colorScheme.onBackground,
                            size: constraints,
                            child: Center(
                              child: state.authApiState == ApiState.loading
                                  ? const CircularProgressIndicator()
                                  : Text(
                                      LocaleStrings.loginSigninButton,
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
                        onTap: () => context.go(SignUpPage.route()),
                        color: Colors.black12,
                        size: constraints,
                        child: Center(
                          child: Text(
                            LocaleStrings.loginSignupButton,
                            style: textTheme.headlineSmall,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: constraints.maxHeight * 0.08,
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
