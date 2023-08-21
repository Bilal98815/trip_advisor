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
                    horizontal: constraints.maxWidth * 0.08,
                  ),
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
                          ),
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.04,
                        ),
                        CommonText(
                          text: LocaleStrings.loginHeading,
                          color: Colors.white,
                          fontsize: 31,
                          fontWeight: FontWeight.w800,
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.07,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LocaleStrings.loginEmailLabel,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: constraints.maxHeight * 0.01,
                            ),
                            TextFormField(
                              controller: emailController,
                              validator: (val) => val!.isEmpty
                                  ? LocaleStrings.loginEmailError
                                  : null,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: LocaleStrings.loginEmailHint,
                                hintStyle: const TextStyle(color: Colors.grey),
                                border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
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
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
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
                                    hintStyle:
                                        const TextStyle(color: Colors.grey),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
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
                          child: CommonText(
                            text: LocaleStrings.loginForgotPassword,
                            color: Colors.purple.shade200,
                            fontsize: 22,
                            fontWeight: FontWeight.w700,
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
                                  backgroundColor: Colors.red,
                                  content: Text(
                                    state.errorMessage,
                                    style: const TextStyle(color: Colors.white),
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
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
