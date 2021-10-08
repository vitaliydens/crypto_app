// To parse this JSON data, do
//
//     final coinsData = coinsDataFromJson(jsonString);

import 'dart:convert';

class CoinsData {
  CoinsData({
    required this.response,
    required this.message,
    required this.data,
    required this.rateLimit,
    required this.hasWarning,
    required this.type,
  });

  String response;
  String message;
  Map<String, Datum> data;
  RateLimit rateLimit;
  bool hasWarning;
  int type;

  factory CoinsData.fromJson(Map<String, dynamic> json) => CoinsData(
    response: json["Response"],
    message: json["Message"],
    data: Map.from(json["Data"]).map((k, v) => MapEntry<String, Datum>(k, Datum.fromJson(v))),
    rateLimit: RateLimit.fromJson(json["RateLimit"]),
    hasWarning: json["HasWarning"],
    type: json["Type"],
  );

  Map<String, dynamic> toJson() => {
    "Response": response,
    "Message": message,
    "Data": Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    "RateLimit": rateLimit.toJson(),
    "HasWarning": hasWarning,
    "Type": type,
  };
}

class Datum {
  Datum({
    required this.id,
    required this.url,
    required this.imageUrl,
    required this.contentCreatedOn,
    required this.name,
    required this.symbol,
    required this.coinName,
    required this.fullName,
    required this.description,
    required this.assetTokenStatus,
    required this.algorithm,
    required this.proofType,
    required this.sortOrder,
    required this.sponsored,
    required this.taxonomy,
    required this.rating,
    required this.isTrading,
    required this.totalCoinsMined,
    required this.circulatingSupply,
    required this.blockNumber,
    required this.netHashesPerSecond,
    required this.blockReward,
    required this.blockTime,
    this.assetLaunchDate,
    required this.assetWhitepaperUrl,
    required this.assetWebsiteUrl,
    required this.maxSupply,
    required this.mktCapPenalty,
    required this.isUsedInDefi,
    required this.isUsedInNft,
    required this.platformType,
    required this.builtOn,
    required this.smartContractAddress,
    required this.decimalPoints,
    required this.difficulty,
    required this.algorithmType,
  });

  String id;
  String url;
  String? imageUrl;
  int contentCreatedOn;
  String name;
  String symbol;
  String? coinName;
  String? fullName;
  String? description;
  String? assetTokenStatus;
  String? algorithm;
  String? proofType;
  String? sortOrder;
  bool? sponsored;
  Taxonomy taxonomy;
  Rating? rating;
  bool? isTrading;
  double? totalCoinsMined;
  double? circulatingSupply;
  int? blockNumber;
  double? netHashesPerSecond;
  double? blockReward;
  double? blockTime;
  dynamic assetLaunchDate;
  String? assetWhitepaperUrl;
  String? assetWebsiteUrl;
  double? maxSupply;
  double? mktCapPenalty;
  int? isUsedInDefi;
  int? isUsedInNft;
  String? platformType;
  String? builtOn;
  String? smartContractAddress;
  double? decimalPoints;
  double? difficulty;
  String? algorithmType;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["Id"],
    url: json["Url"],
    imageUrl: json["ImageUrl"] == null ? null : json["ImageUrl"],
    contentCreatedOn: json["ContentCreatedOn"],
    name: json["Name"],
    symbol: json["Symbol"],
    coinName: json["CoinName"],
    fullName: json["FullName"],
    description: json["Description"],
    assetTokenStatus: json["AssetTokenStatus"],
    algorithm: json["Algorithm"],
    proofType: json["ProofType"],
    sortOrder: json["SortOrder"],
    sponsored: json["Sponsored"],
    taxonomy: Taxonomy.fromJson(json["Taxonomy"]),
    rating: Rating.fromJson(json["Rating"]),
    isTrading: json["IsTrading"],
    totalCoinsMined: json["TotalCoinsMined"] == null ? null : json["TotalCoinsMined"].toDouble(),
    circulatingSupply: json["CirculatingSupply"] == null ? null : json["CirculatingSupply"].toDouble(),
    blockNumber: json["BlockNumber"] == null ? null : json["BlockNumber"],
    netHashesPerSecond: json["NetHashesPerSecond"] == null ? null : json["NetHashesPerSecond"].toDouble(),
    blockReward: json["BlockReward"] == null ? null : json["BlockReward"].toDouble(),
    blockTime: json["BlockTime"] == null ? null : json["BlockTime"].toDouble(),
    assetLaunchDate: json["AssetLaunchDate"],
    assetWhitepaperUrl: json["AssetWhitepaperUrl"] == null ? null : json["AssetWhitepaperUrl"],
    assetWebsiteUrl: json["AssetWebsiteUrl"] == null ? null : json["AssetWebsiteUrl"],
    maxSupply: json["MaxSupply"] == null ? null : json["MaxSupply"].toDouble(),
    mktCapPenalty: json["MktCapPenalty"] == null ? null : json["MktCapPenalty"].toDouble(),
    isUsedInDefi: json["IsUsedInDefi"] == null ? null : json["IsUsedInDefi"],
    isUsedInNft: json["IsUsedInNft"] == null ? null : json["IsUsedInNft"],
    platformType: json["PlatformType"] == null ? null : json["PlatformType"],
    builtOn: json["BuiltOn"] == null ? null : json["BuiltOn"],
    smartContractAddress: json["SmartContractAddress"] == null ? null : json["SmartContractAddress"],
    decimalPoints: json["DecimalPoints"] == null ? null : json["DecimalPoints"].toDouble(),
    difficulty: json["Difficulty"] == null ? null : json["Difficulty"].toDouble(),
    algorithmType: json["AlgorithmType"] == null ? null : json["AlgorithmType"],
  );
}
class Rating {
  Rating({
    required this.weiss,
  });

  Weiss weiss;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    weiss: Weiss.fromJson(json["Weiss"]),
  );

  Map<String, dynamic> toJson() => {
    "Weiss": weiss.toJson(),
  };
}

class Weiss {
  Weiss({
    required this.rating,
    required this.marketPerformanceRating,
    required this.technologyAdoptionRating,
  });

  String rating;
  String technologyAdoptionRating;
  String marketPerformanceRating;

  factory Weiss.fromJson(Map<String, dynamic> json) => Weiss(
    rating: json["Rating"],
    technologyAdoptionRating: json["TechnologyAdoptionRating"],
    marketPerformanceRating: json["MarketPerformanceRating"],
  );

  Map<String, dynamic> toJson() => {
    "Rating":rating,
    "TechnologyAdoptionRating": technologyAdoptionRating,
    "MarketPerformanceRating": marketPerformanceRating,
  };
}


class Taxonomy {
  Taxonomy({
    required this.access,
    required this.fca,
    required this.finma,
    required this.industry,
    required this.collateralizedAsset,
    required this.collateralizedAssetType,
    required this.collateralType,
    required this.collateralInfo,
  });

  String access;
  String fca;
  String finma;
  String industry;
  String collateralizedAsset;
  String collateralizedAssetType;
  String collateralType;
  String collateralInfo;

  factory Taxonomy.fromJson(Map<String, dynamic> json) => Taxonomy(
    access: json["Access"],
    fca: json["FCA"],
    finma: json["FINMA"],
    industry: json["Industry"],
    collateralizedAsset: json["CollateralizedAsset"],
    collateralizedAssetType: json["CollateralizedAssetType"],
    collateralType: json["CollateralType"],
    collateralInfo: json["CollateralInfo"],
  );

  Map<String, dynamic> toJson() => {
    "Access": access,
    "FCA": fca,
    "FINMA": finma,
    "Industry": industry,
    "CollateralizedAsset": collateralizedAsset,
    "CollateralizedAssetType": collateralizedAssetType,
    "CollateralType": collateralType,
    "CollateralInfo": collateralInfo,
  };
}

class RateLimit {
  RateLimit();

  factory RateLimit.fromJson(Map<String, dynamic> json) => RateLimit(
  );

  Map<String, dynamic> toJson() => {
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
