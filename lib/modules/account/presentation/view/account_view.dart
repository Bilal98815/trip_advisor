part of 'view.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  static const routeName = '/account';

  static String route() => '/account';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, size) {
            return Container(
              width: size.maxWidth,
              height: size.maxHeight,
              color: Colors.black87,
              padding: EdgeInsets.symmetric(horizontal: size.maxWidth * 0.08),
              child: BlocBuilder<AccountBloc, AccountState>(
                builder: (context, state) {
                  if (state.signOutCondition == SignOutCondition.signIn) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: size.maxHeight * 0.04,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonText(
                              text: LocaleStrings.accountTitle,
                              color: Colors.white,
                              fontsize: 32,
                              fontWeight: FontWeight.w900,
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
                        SizedBox(
                          height: size.maxHeight * 0.05,
                        ),
                        ProfileSettingsTile(
                          image: 'assets/invoice.png',
                          onTap: () {
                            _launchUrl(Uri.parse('https://www.google.com'));
                          },
                          title: 'Bookings',
                          size: size,
                        ),
                        SizedBox(
                          height: size.maxHeight * 0.03,
                        ),
                        ProfileSettingsTile(
                          image: 'assets/user.png',
                          onTap: () => context.go(ProfileView.route()),
                          title: 'Profile',
                          size: size,
                        ),
                        SizedBox(
                          height: size.maxHeight * 0.03,
                        ),
                        ProfileSettingsTile(
                          image: 'assets/mail.png',
                          onTap: () {
                            _launchUrl(Uri.parse('https://www.google.com'));
                          },
                          title: 'Messages',
                          size: size,
                        ),
                        SizedBox(
                          height: size.maxHeight * 0.03,
                        ),
                        ProfileSettingsTile(
                          image: 'assets/settings.png',
                          onTap: () {},
                          title: 'Preferences',
                          size: size,
                        ),
                        SizedBox(
                          height: size.maxHeight * 0.03,
                        ),
                        ProfileSettingsTile(
                          image: 'assets/question.png',
                          onTap: () => context.go(SupportView.route()),
                          title: 'Support',
                          size: size,
                        ),
                        SizedBox(
                          height: size.maxHeight * 0.03,
                        ),
                        ProfileSettingsTile(
                          image: 'assets/owl_white.png',
                          onTap: () {
                            _launchUrl(Uri.parse('https://www.google.com'));
                          },
                          title: 'Tripadvisor Plus',
                          size: size,
                        ),
                        SizedBox(
                          height: size.maxHeight * 0.05,
                        ),
                        PrimaryButton(
                          ignoring: false,
                          onTap: () {
                            showDialog<void>(
                              context: context,
                              builder: (context) {
                                return SignoutDialogBox(size: size);
                              },
                            );
                          },
                          color: Colors.black12,
                          height: size.maxHeight * 0.075,
                          size: size,
                          child: Center(
                            child: CommonText(
                              text: LocaleStrings.accountSignoutButton,
                              color: Colors.white,
                              fontsize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.maxHeight * 0.03,
                        ),
                        const CommonText(
                          text: 'Version: v53.5 build 230724021',
                          color: Colors.white,
                          fontsize: 11,
                          fontWeight: FontWeight.w300,
                        ),
                        const CommonText(
                          text:
                              'Device ID: a31b370e-c00e-417c-94a0-7f5023fcc573',
                          color: Colors.white,
                          fontsize: 11,
                          fontWeight: FontWeight.w300,
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: size.maxHeight * 0.04,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonText(
                              text: LocaleStrings.accountTitle,
                              color: Colors.white,
                              fontsize: 32,
                              fontWeight: FontWeight.w900,
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
                        SizedBox(
                          height: size.maxHeight * 0.05,
                        ),
                        SignInBox(size: size),
                        SizedBox(
                          height: size.maxHeight * 0.05,
                        ),
                        ProfileSettingsTile(
                          image: 'assets/settings.png',
                          onTap: () {},
                          title: 'Preferences',
                          size: size,
                        ),
                        SizedBox(
                          height: size.maxHeight * 0.03,
                        ),
                        ProfileSettingsTile(
                          image: 'assets/question.png',
                          onTap: () => context.go(SupportView.route()),
                          title: 'Support',
                          size: size,
                        ),
                        SizedBox(
                          height: size.maxHeight * 0.03,
                        ),
                        ProfileSettingsTile(
                          image: 'assets/owl_white.png',
                          onTap: () {
                            _launchUrl(Uri.parse('https://www.google.com'));
                          },
                          title: 'Tripadvisor Plus',
                          size: size,
                        ),
                        SizedBox(
                          height: size.maxHeight * 0.03,
                        ),
                        const CommonText(
                          text: 'Version: v53.5 build 230724021',
                          color: Colors.white,
                          fontsize: 11,
                          fontWeight: FontWeight.w300,
                        ),
                        const CommonText(
                          text:
                              'Device ID: a31b370e-c00e-417c-94a0-7f5023fcc573',
                          color: Colors.white,
                          fontsize: 11,
                          fontWeight: FontWeight.w300,
                        ),
                      ],
                    );
                  }
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
      Fluttertoast.showToast(msg: 'Could not launch $url');
    }
  }
}
