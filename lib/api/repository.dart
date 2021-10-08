import 'dart:developer';
import 'dart:io';

import 'package:crypto_app/api/entities/api_response.dart';
import 'package:crypto_app/api/entities/coins_data.dart';
import 'package:dio/dio.dart';

abstract class Repository {
  Future<ApiResponse<CoinsData>> fetchListBlockChain();
}

class CoinRepository implements Repository {
  static final CoinRepository _singleton = CoinRepository._internal();

  final dio = Dio();

  final apiUrl = 'https://min-api.cryptocompare.com/data';
  final cryptoApiKey =
      'b3ff26f10a35cdad06f37c53f08d11b1379e2d2cf12c9c4ff8a73080fcc38e66';

  final blockChainListUrl = '/blockchain/list';
  final allCoinsUrl = '/all/coinlist';
  final coinPriceUrl = '/price';

  factory CoinRepository() {
    return _singleton;
  }

  CoinRepository._internal();

  Future<ApiResponse<CoinsData>> fetchListBlockChain() async {
    var url = apiUrl + allCoinsUrl + '?api_key=' + cryptoApiKey;
    try {
      final Response<Map<String, dynamic>> response =
          await dio.get<Map<String, dynamic>>(url);
      var coinsData = CoinsData.fromJson(response.data!);
      return ApiResponse(data: coinsData);
    }  catch (e) {
      if (e is DioError) {
        if (e.error is SocketException) {
          print('---------');
          return ApiResponse(error: e.message);
        }
      } else {
        return ApiResponse(error: e.toString());
      }
    }
    return ApiResponse();
  }

  Future<ApiResponse<CoinsData>> fetchCoinPrice(String symbol) async {
    var url = apiUrl + coinPriceUrl + '?fsym=$symbol' + '&tsyms=USD,EUR' + '&api_key=' + cryptoApiKey;
    print(url);
    try {
      final Response<Map<String, dynamic>> response =
      await dio.get<Map<String, dynamic>>(url);
      print(response.data);
      var coinsData = CoinsData.fromJson(response.data!);
      return ApiResponse(data: coinsData);
    }  catch (e) {
      if (e is DioError) {
        if (e.error is SocketException) {
          print('---------');
          return ApiResponse(error: e.message);
        }
      } else {
        return ApiResponse(error: e.toString());
      }
    }
    return ApiResponse();
  }
}
