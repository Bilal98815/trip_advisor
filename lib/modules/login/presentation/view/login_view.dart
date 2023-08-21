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
                          SizedBox(
                            height: constraints.maxHeight * 0.01,
                          ),
                          TextFormField(
                            controller: emailController,
                            validator: (val) => val!.isEmpty
                                ? LocaleStrings.loginEmailError
                                : null,
                            decoration: InputDecoration(
                              hintText: LocaleStrings.loginEmailHint,
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: colorScheme.error),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: colorScheme.primaryContainer,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: colorScheme.onBackground,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
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
                              Text(
                                LocaleStrings.loginPasswordLabel,
                                style: textTheme.labelSmall,
                              ),
                              SizedBox(
                                height: constraints.maxHeight * 0.01,
                              ),
                              TextFormField(
                                obscureText: true,
                                controller: passwordController,
                                style: const TextStyle(color: Colors.white),
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return LocaleStrings
                                        .loginPasswordEmptyError;
                                  } else if (val.length < 6) {
                                    return LocaleStrings
                                        .loginPasswordLengthError;
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: LocaleStrings.loginPasswordHint,
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: colorScheme.error),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: colorScheme.primaryContainer,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: colorScheme.onBackground,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
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
                            color: Colors.white,
                            size: constraints,
                            child: Center(
                              child: state.authApiState == ApiState.loading
                                  ? const CircularProgressIndicator()
                                  : CommonText(
                                      text: LocaleStrings.loginSigninButton,
                                      color: Colors.black87,
                                      fontsize: 20,
                                      fontWeight: FontWeight.w500,
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
                          child: CommonText(
                            text: LocaleStrings.loginSignupButton,
                            color: Colors.white,
                            fontsize: 20,
                            fontWeight: FontWeight.w500,
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
