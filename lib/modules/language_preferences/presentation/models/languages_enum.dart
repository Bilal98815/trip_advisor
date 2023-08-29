part of 'models.dart';

enum Languages { englishUK, englishUS }

extension LanguagesX on Languages {
  Language get language {
    switch (this) {
      case Languages.englishUK:
        return Language(
          name: 'English (United Kingdom)',
          localizedName: LocaleStrings.languageEnglishUK,
          locale: kLocaleEnglishUK,
        );
      case Languages.englishUS:
        return Language(
          name: 'English (United States)',
          localizedName: LocaleStrings.languageEnglishUS,
          locale: kLocaleEnglishUS,
        );
    }
  }
}
