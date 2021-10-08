import 'package:crypto_app/api/repository.dart';
import 'package:crypto_app/blocs/coin_price/coin_price_cubit.dart';
import 'package:crypto_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinPricePage extends StatelessWidget {
  final String coinSymbol;
  final String coinName;

  const CoinPricePage(
      {Key? key, required this.coinSymbol, required this.coinName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).title),
      ),
      body: BlocProvider(
          create: (context) => CoinPriceCubit(CoinRepository())..loadCoinPrice(coinSymbol),
          child: BlocBuilder<CoinPriceCubit, CoinPriceState>(
            builder: (context, state) {
              if (state is CoinPriceInitial) {
                return const SizedBox();
              } else if (state is LoadingCoinPriceState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is LoadedCoinPriceState) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        '$coinName :',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Expanded(
                        child: Text(
                          'USD - ${state.data.usd}\nEUR - ${state.data.eur}',
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          )),
    );
  }
}
