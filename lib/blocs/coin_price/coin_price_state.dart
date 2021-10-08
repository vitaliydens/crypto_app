part of 'coin_price_cubit.dart';

@immutable
abstract class CoinPriceState {}

class CoinPriceInitial extends CoinPriceState {}

class LoadingCoinPriceState extends CoinPriceState {}

class LoadedCoinPriceState extends CoinPriceState {
  final CoinPrice data;

  LoadedCoinPriceState(this.data);
}

class ErrorLoadCoinPriceState extends CoinPriceState {

  final String error;

  ErrorLoadCoinPriceState(this.error);

}
