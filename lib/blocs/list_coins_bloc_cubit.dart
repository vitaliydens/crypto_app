import 'package:bloc/bloc.dart';
import 'package:crypto_app/api/entities/coins_data.dart';
import 'package:crypto_app/api/repository.dart';
import 'package:meta/meta.dart';

part 'list_coins_bloc_state.dart';

class ListCoinsBlocCubit extends Cubit<ListCoinsBlocState> {

  ListCoinsBlocCubit() : super(ListCoinsBlocInitial());

  void loadCoinsData() async {
    emit(LoadingCoinsState());
    var result = await CoinRepository().fetchListBlockChain();
    if (result.data != null) {
      emit(LoadedCoinsState(result.data!));
    } else {
      emit(ErrorLoadCoinsState(result.error ?? ''));
    }
  }

  void loadCoinPrice(String symbol) async {
    emit(LoadingCoinsState());
    var result = await CoinRepository().fetchCoinPrice(symbol);
    if (result.data != null) {
      emit(LoadedCoinsState(result.data!));
    } else {
      emit(ErrorLoadCoinsState(result.error ?? ''));
    }
  }


}
