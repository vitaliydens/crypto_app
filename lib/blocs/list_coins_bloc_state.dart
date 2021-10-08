part of 'list_coins_bloc_cubit.dart';

@immutable
abstract class ListCoinsBlocState {}

class ListCoinsBlocInitial extends ListCoinsBlocState {}

class LoadingCoinsState extends ListCoinsBlocState {}

class LoadedCoinsState extends ListCoinsBlocState {
  final CoinsData data;

  LoadedCoinsState(this.data);

}

class ErrorLoadCoinsState extends ListCoinsBlocState {

  final String error;

  ErrorLoadCoinsState(this.error);

}
