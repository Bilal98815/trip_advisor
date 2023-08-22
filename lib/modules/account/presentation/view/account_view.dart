part of 'view.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  static const routeName = '/account';
  static String route() => '/account';

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, size) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: size.maxWidth * 0.08),
              child: BlocBuilder<AccountBloc, AccountState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.maxHeight * 0.04),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            LocaleStrings.accountTitle,
                            style: textTheme.titleLarge,
                          ),
                          Container(
                            width: size.maxWidth * 0.11,
                            height: size.maxHeight * 0.1,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(
                                  ImagePath()
                                      .getPathByTheme(context, 'mine.jpg'),
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.maxHeight * 0.05),
                      if (state.signOutCondition ==
                          SignOutCondition.signIn) ...[
                        ProfileSettingsTile(
                          image: Asset.of(context).invoice,
                          onTap: () => UrlLauncher().launchCustomUrl(
                            Uri.parse('https://www.google.com'),
                          ),
                          title: LocaleStrings.bookingsTile,
                        ),
                        ProfileSettingsTile(
                          image:
                              ImagePath().getPathByTheme(context, 'user.png'),
                          onTap: () => context.go(ProfileView.route()),
                          title: LocaleStrings.profileTile,
                        ),
                        ProfileSettingsTile(
                          image:
                              ImagePath().getPathByTheme(context, 'mail.png'),
                          onTap: () => UrlLauncher().launchCustomUrl(
                            Uri.parse('https://www.google.com'),
                          ),
                          title: LocaleStrings.messagesTile,
                        ),
                      ],
                      if (state.signOutCondition !=
                          SignOutCondition.signIn) ...[
                        SignInBox(size: size),
                        SizedBox(height: size.maxHeight * 0.05),
                      ],
                      ProfileSettingsTile(
                        image:
                            ImagePath().getPathByTheme(context, 'settings.png'),
                        onTap: () {},
                        title: LocaleStrings.preferencesTile,
                      ),
                      ProfileSettingsTile(
                        image:
                            ImagePath().getPathByTheme(context, 'question.png'),
                        onTap: () => context.go(SupportView.route()),
                        title: LocaleStrings.supportTile,
                      ),
                      ProfileSettingsTile(
                        image:
                            ImagePath().getPathByTheme(context, 'owl_icon.png'),
                        onTap: () => UrlLauncher().launchCustomUrl(
                          Uri.parse('https://www.google.com'),
                        ),
                        title: LocaleStrings.tripAdvisorTile,
                      ),
                      if (state.signOutCondition ==
                          SignOutCondition.signIn) ...[
                        SizedBox(
                          height: size.maxHeight * 0.05,
                        ),
                        PrimaryButton(
                          ignoring: false,
                          size: size,
                          onTap: () {
                            showDialog<void>(
                              context: context,
                              builder: (context) {
                                return SignoutDialogBox(size: size);
                              },
                            );
                          },
                          color: colorScheme.background,
                          height: size.maxHeight * 0.075,
                          child: Center(
                            child: Text(
                              LocaleStrings.accountSignoutButton,
                              style: textTheme.displayMedium,
                            ),
                          ),
                        ),
                      ],
                      SizedBox(height: size.maxHeight * 0.03),
                      Text(LocaleStrings.version, style: textTheme.bodySmall),
                      Text(
                        LocaleStrings.deviceId(
                          'a31b370e-c00e-417c-94a0-7f5023fcc573',
                        ),
                        style: textTheme.bodySmall,
                      ),
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
