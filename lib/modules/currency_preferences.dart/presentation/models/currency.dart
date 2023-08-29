part of 'models.dart';

class Currency extends Equatable {
  const Currency({this.symbol = '', this.currency = ''});

  final String symbol;
  final String currency;

  Currency copyWith({
    String? currency,
    String? symbol,
  }) {
    return Currency(
      currency: currency ?? this.currency,
      symbol: symbol ?? this.symbol,
    );
  }

  @override
  List<Object?> get props => [symbol, currency];
}
