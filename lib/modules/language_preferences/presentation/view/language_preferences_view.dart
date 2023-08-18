part of 'view.dart';

class LanguagePreferencesView extends StatelessWidget {
  const LanguagePreferencesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: const CustomAppBar(title: 'Language'),
      body: ListView(
        children: [
          _LanguageTile(
            title: 'English (United Kingdom)',
            subtitle: LocaleStrings.languageEnglishUK,
            value: 'en_GB',
            groupValue: 'en_GB',
            onChanged: (value) {},
          ),
          _LanguageTile(
            title: 'English (United States)',
            subtitle: LocaleStrings.languageEnglishUS,
            value: 'en_US',
            groupValue: 'en_GB',
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}

class _LanguageTile extends StatelessWidget {
  const _LanguageTile({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  final String title;
  final String subtitle;
  final String value;
  final String groupValue;
  final ValueChanged<String?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RadioListTile<String>(
          title: TileTitleText(title: title),
          subtitle: TileSubtitleText(subtitle: subtitle),
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          activeColor: Colors.white,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Divider(thickness: 0.3, color: Colors.grey),
        ),
      ],
    );
  }
}
