part of 'widgets.dart';

class LanguageTile extends StatelessWidget {
  const LanguageTile({super.key, required this.language});

  final Languages language;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return BlocBuilder<PreferencesBloc, PreferencesState>(
      builder: (context, state) {
        return Column(
          children: [
            RadioListTile<String>(
              title: Text(language.language.name, style: textTheme.bodyMedium),
              subtitle: Text(
                language.language.localizedName,
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              value: language.name,
              groupValue: state.language.name,
              onChanged: (value) {
                context.read<PreferencesBloc>().add(
                      PreferencesLanguageChanged(
                        Languages.values.byName(value ?? 'englishUK'),
                      ),
                    );
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
