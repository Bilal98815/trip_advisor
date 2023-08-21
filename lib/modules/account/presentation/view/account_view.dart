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
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/mine.jpg'),
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
                          image: 'assets/invoice.png',
                          onTap: () {
                            _launchUrl(Uri.parse('https://www.google.com'));
                          },
                          title: LocaleStrings.bookingsTile,
                        ),
                        ProfileSettingsTile(
                          image: 'assets/user.png',
                          onTap: () => context.go(ProfileView.route()),
                          title: LocaleStrings.profileTile,
                        ),
                        ProfileSettingsTile(
                          image: 'assets/mail.png',
                          onTap: () {
                            _launchUrl(Uri.parse('https://www.google.com'));
                          },
                          title: LocaleStrings.messagesTile,
                        ),
                      ],
                      if (state.signOutCondition !=
                          SignOutCondition.signIn) ...[
                        SignInBox(size: size),
                        SizedBox(height: size.maxHeight * 0.05),
                      ],
                      ProfileSettingsTile(
                        image: 'assets/settings.png',
                        onTap: () {},
                        title: LocaleStrings.preferencesTile,
                      ),
                      ProfileSettingsTile(
                        image: 'assets/question.png',
                        onTap: () => context.go(SupportView.route()),
                        title: LocaleStrings.supportTile,
                      ),
                      ProfileSettingsTile(
                        image: 'assets/owl_white.png',
                        onTap: () {
                          _launchUrl(Uri.parse('https://www.google.com'));
                        },
                        title: LocaleStrings.tripAdvisorTile,
                      ),
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

  Future<void> _launchUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      Fluttertoast.showToast(
        msg: LocaleStrings.urlLauncherError(url.toString()),
      );
    }
  }
}
