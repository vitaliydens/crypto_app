
class CoinsData {
  CoinsData({
    required this.response,
    required this.message,
    required this.data,
    required this.hasWarning,
    required this.type,
  });

  String response;
  String message;
  Map<String, CryptoCoin> data;
  bool hasWarning;
  int type;

  factory CoinsData.fromJson(Map<String, dynamic> json) => CoinsData(
    response: json["Response"],
    message: json["Message"],
    data: Map.from(json["Data"]).map((k, v) => MapEntry<String, CryptoCoin>(k, CryptoCoin.fromJson(v))),
    hasWarning: json["HasWarning"],
    type: json["Type"],
  );
}

class CryptoCoin {
  CryptoCoin({
    required this.id,
    required this.name,
    required this.symbol,
  });

  String id;
  String name;
  String symbol;


  factory CryptoCoin.fromJson(Map<String, dynamic> json) => CryptoCoin(
    id: json["Id"],
    name: json["Name"],
    symbol: json["Symbol"],
  );
}
