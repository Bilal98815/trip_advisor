part of 'widgets.dart';

class LanguageTile extends StatelessWidget {
  const LanguageTile({super.key, required this.language});

  final Language language;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return BlocBuilder<PreferencesBloc, PreferencesState>(
      builder: (context, state) {
        return Column(
          children: [
            RadioListTile<String>(
              title: Text(language.name, style: textTheme.bodyMedium),
              subtitle: Text(
                language.localizedName,
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              value: language.locale.toLanguageTag(),
              groupValue: state.locale.toLanguageTag(),
              onChanged: (value) {
                final Locale locale = value != null
                    ? Locale.fromSubtags(
                        languageCode: value.split('-')[0],
                        countryCode: value.split('-')[1],
                      )
                    : kStartingLocale;

                context
                    .read<PreferencesBloc>()
                    .add(PreferencesLocaleChanged(locale));
              },
              activeColor: Theme.of(context).colorScheme.onBackground,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Divider(),
            ),
          ],
        );
      },
    );
  }
}
