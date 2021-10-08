class CoinPrice {
  final num usd;
  final num eur;

  CoinPrice(this.usd, this.eur);

  factory CoinPrice.fromJson(Map<String, dynamic> json) =>
      CoinPrice(json['USD'], json['EUR']);
}
