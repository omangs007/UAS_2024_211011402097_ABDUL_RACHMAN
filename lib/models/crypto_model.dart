class Crypto {
  final String name;
  late final double priceUsd;
  final String symbol;

  Crypto({required this.name, required this.priceUsd, required this.symbol});

  factory Crypto.fromJson(Map<String, dynamic> json) {
    return Crypto(
      name: json['name'],
      priceUsd: double.parse(json['price_usd']),
      symbol: json['symbol'],
    );
  }
}
