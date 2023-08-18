part of 'view.dart';

class PreferencesView extends StatelessWidget {
  const PreferencesView({super.key});

  static const routeName = 'preferences';
  static String route() => '/account/preferences';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: HeadingText(heading: LocaleStrings.preferencesTitle),
              ),
              const SizedBox(height: 15),
              ProfileSettingsTile(
                title: LocaleStrings.preferencesTileAccountInfo,
                onTap: () => UrlLauncher().launchCustomUrl(
                  Uri.parse('https://www.google.com'),
                ),
              ),
              ProfileSettingsTile(
                title: LocaleStrings.preferencesTileLanguage,
                onTap: () {},
              ),
              ProfileSettingsTile(
                title: LocaleStrings.preferencesTileCurrency,
                onTap: () {},
              ),
              ProfileSettingsTile(
                title: LocaleStrings.preferencesTileUnits,
                onTap: () {},
              ),
              ProfileSettingsTile(
                title: LocaleStrings.preferencesTilePayment,
                onTap: () => UrlLauncher().launchCustomUrl(
                  Uri.parse('https://www.google.com'),
                ),
              ),
              ProfileSettingsTile(
                title: LocaleStrings.preferencesTileNotifications,
                onTap: () {},
              ),
              ProfileSettingsTile(
                title: LocaleStrings.preferencesTilePrivacy,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
