part of 'view.dart';

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
                          text: LocaleStrings.signupTitle,
                          color: Colors.white,
                          fontsize: 28,
                          textOverflow: TextOverflow.clip,
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.w800,
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.05,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LocaleStrings.signupEmailFieldTitle,
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
                              validator: (val) =>
                                  val!.isEmpty ? 'Enter email!' : null,
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: LocaleStrings.signupEmailFieldTitle,
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
                        BlocBuilder<SignupBloc, SignupBlocState>(
                          builder: (context, state) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  LocaleStrings.signupPasswordFieldTitle,
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
                                      return 'Enter password!';
                                    } else if (val.length < 6) {
                                      return 'please enter more than 6 digits';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText:
                                        LocaleStrings.signupPasswordFieldTitle,
                                    hintStyle:
                                        const TextStyle(color: Colors.grey),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.red),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: const OutlineInputBorder(),
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
                          size: constraints,
                          rule: LocaleStrings.characterNumbersText,
                        ),
                        SizedBox(
                          height: constraints.maxHeight * 0.01,
                        ),
                        PasswordRulesRow(
                          size: constraints,
                          rule: LocaleStrings.specialCharacterText,
                        ),
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
                                    context
                                        .read<SignupBloc>()
                                        .add(CheckBoxEvent());
                                  },
                                  activeColor: Colors.purple.shade300,
                                  checkColor: Colors.black87,
                                );
                              },
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonText(
                                  text: LocaleStrings.signupCheckbox,
                                  color: Colors.white,
                                  fontsize: 15,
                                  textOverflow: TextOverflow.clip,
                                  textAlign: TextAlign.left,
                                  fontWeight: FontWeight.normal,
                                ),
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
                            } else if (state.registerApiState ==
                                ApiState.done) {
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
                              color: Colors.white,
                              size: constraints,
                              child: Center(
                                child:
                                    state.registerApiState == ApiState.loading
                                        ? const CircularProgressIndicator()
                                        : CommonText(
                                            text: LocaleStrings.signupButton,
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
                          onTap: () => context.go(LoginView.route()),
                          color: Colors.black12,
                          size: constraints,
                          child: Center(
                            child: CommonText(
                              text: LocaleStrings.signInButton,
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
