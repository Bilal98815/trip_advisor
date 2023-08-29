part of 'models.dart';

enum Currencies {
  usDollars,
  pounds,
  euros,
  canadianDollars,
  francs,
  australianDollars,
  yen,
  yuan,
  indianRupees,
  lira,
  dirham,
}

extension CurrenciesX on Currencies {
  Currency get currency {
    switch (this) {
      case Currencies.usDollars:
        return Currency(
          currency: LocaleStrings.currencyUSDollars,
          symbol: '\$',
        );
      case Currencies.pounds:
        return Currency(currency: LocaleStrings.currencyPounds, symbol: '£');
      case Currencies.euros:
        return Currency(currency: LocaleStrings.currencyEuros, symbol: '€');
      case Currencies.canadianDollars:
        return Currency(
          currency: LocaleStrings.currencyCanadianDollars,
          symbol: 'CA\$',
        );
      case Currencies.francs:
        return Currency(currency: LocaleStrings.currencyFrancs, symbol: 'CHF');
      case Currencies.australianDollars:
        return Currency(
          currency: LocaleStrings.currencyAustralianDollars,
          symbol: 'A\$',
        );
      case Currencies.yen:
        return Currency(currency: LocaleStrings.currencyYen, symbol: '¥');
      case Currencies.yuan:
        return Currency(currency: LocaleStrings.currencyYuan, symbol: 'CN¥');
      case Currencies.indianRupees:
        return Currency(
          currency: LocaleStrings.currencyIndianRupees,
          symbol: '₹',
        );
      case Currencies.lira:
        return Currency(currency: LocaleStrings.currencyLira, symbol: 'TRY');
      case Currencies.dirham:
        return Currency(currency: LocaleStrings.currencyDirham, symbol: 'AED');
    }
  }
}
