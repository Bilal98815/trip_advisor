part of 'view.dart';

class UserDataView extends StatelessWidget {
  UserDataView({super.key, required this.email, required this.password});

  final String email;
  final String password;

  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final List<String> items = [
    'UK',
    'America',
    'Canada',
    'Australia',
    'Pakistan'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: LayoutBuilder(
            builder: (context, size) {
              return Container(
                width: size.maxWidth,
                height: size.maxHeight,
                color: Theme.of(context).colorScheme.background,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.maxHeight * 0.07,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.maxWidth * 0.03,
                        ),
                        child: Container(
                          width: size.maxWidth * 0.3,
                          height: size.maxHeight * 0.1,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/man.png',
                              width: size.maxWidth * 0.15,
                              height: size.maxHeight * 0.07,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.maxHeight * 0.04,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.maxWidth * 0.08,
                        ),
                        child: CommonText(
                          text: LocaleStrings.userDataHeading,
                          color: Colors.white,
                          textOverflow: TextOverflow.clip,
                          textAlign: TextAlign.left,
                          fontsize: 31,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      SizedBox(
                        height: size.maxHeight * 0.04,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.maxWidth * 0.08,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LocaleStrings.userDataNameFieldTitle,
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            SizedBox(
                              height: size.maxHeight * 0.01,
                            ),
                            TextFormField(
                              controller: nameController,
                              validator: (val) =>
                                  val!.isEmpty ? 'Enter name!' : null,
                              style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                              decoration: InputDecoration(
                                hintText: LocaleStrings.userDataNameFieldHint,
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: Theme.of(context).hintColor,
                                      fontWeight: FontWeight.normal,
                                    ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Theme.of(context).colorScheme.error,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.maxHeight * 0.03,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.maxWidth * 0.08,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LocaleStrings.userDataLocationFieldTitle,
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                            SizedBox(
                              height: size.maxHeight * 0.01,
                            ),
                            Container(
                              width: size.maxWidth,
                              height: size.maxHeight * 0.08,
                              padding: EdgeInsets.symmetric(
                                vertical: size.maxHeight * 0.01,
                                horizontal: size.maxWidth * 0.03,
                              ),
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onTertiaryContainer,
                                ),
                              ),
                              child:
                                  BlocBuilder<UserDataBloc, UserDataBlocState>(
                                builder: (context, state) {
                                  debugPrint(
                                    '---->> Country: ${state.country}',
                                  );
                                  return DropdownButton(
                                    icon: const SizedBox.shrink(),
                                    underline: const SizedBox.shrink(),
                                    //value: state.country,
                                    hint: Text(
                                      state.country,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall
                                          ?.copyWith(
                                            color: Theme.of(context).hintColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                    dropdownColor: Theme.of(context)
                                        .colorScheme
                                        .primaryContainer,
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                    items: items.map((String item) {
                                      return DropdownMenuItem(
                                        value: item,
                                        child: Text(item),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      context.read<UserDataBloc>().add(
                                            UpdateCountryEvent(country: value!),
                                          );
                                      context.read<UserDataBloc>().add(
                                            StoreCountryDB(
                                              country: value,
                                              email: email,
                                            ),
                                          );
                                      debugPrint(
                                        '---->> Selected Country: $value',
                                      );
                                      debugPrint(
                                        '---->> Country: ${state.country}',
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.maxHeight * 0.04,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.maxWidth * 0.08,
                        ),
                        child: BlocBuilder<UserDataBloc, UserDataBlocState>(
                          builder: (context, state) {
                            return PrimaryButton(
                              ignoring: false,
                              onTap: () {
                                if (!formKey.currentState!.validate()) {
                                  debugPrint('------Enter Name');
                                } else {
                                  context.read<UserDataBloc>().add(
                                        UpdateNameEvent(
                                          name: nameController.text,
                                          email: email,
                                        ),
                                      );
                                  context.read<LoginBloc>().add(
                                        OnLoginEvent(
                                          email: email,
                                          password: password,
                                        ),
                                      );
                                  context.read<AccountBloc>().add(
                                        UpdateSigningCondition(
                                          condition: SignOutCondition.signIn,
                                        ),
                                      );
                                  context.go(ExploreView.route());
                                }
                              },
                              height: size.maxHeight * 0.064,
                              color: Theme.of(context).colorScheme.onPrimary,
                              size: size,
                              child: Center(
                                child: Text(
                                  LocaleStrings.userDataButton,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background,
                                      ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: size.maxHeight * 0.05,
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
