import 'package:bloc/bloc.dart';
import 'package:crypto_app/api/entities/coin_price.dart';
import 'package:crypto_app/api/repository.dart';
import 'package:meta/meta.dart';

part 'coin_price_state.dart';

class CoinPriceCubit extends Cubit<CoinPriceState> {

  final Repository repository;

  CoinPriceCubit(this.repository) : super(CoinPriceInitial());

  void loadCoinPrice(String symbol) async {
    emit(LoadingCoinPriceState());
    var result = await repository.fetchCoinPrice(symbol);
    if (result.data != null) {
      emit(LoadedCoinPriceState(result.data!));
    } else {
      emit(ErrorLoadCoinPriceState(result.error ?? ''));
    }
  }
}
