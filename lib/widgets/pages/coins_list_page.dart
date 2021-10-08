import 'package:crypto_app/blocs/list_coins_bloc_cubit.dart';
import 'package:crypto_app/generated/l10n.dart';
import 'package:crypto_app/widgets/components/crypto_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoinsListPage extends StatefulWidget {
  const CoinsListPage({Key? key}) : super(key: key);

  @override
  _CoinsListPageState createState() => _CoinsListPageState();
}

class _CoinsListPageState extends State<CoinsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(S.of(context).title),),
        body: BlocProvider(
          create: (context) => ListCoinsBlocCubit()..loadCoinsData(),
          child: Builder(builder: (context) {
            return BlocBuilder<ListCoinsBlocCubit, ListCoinsBlocState>(
              bloc: BlocProvider.of<ListCoinsBlocCubit>(context, listen: false),
              builder: (context, state) {
                if (state is ListCoinsBlocInitial) {
                  return const SizedBox();
                } else if (state is LoadingCoinsState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is LoadedCoinsState) {
                  return ListView.separated(
                      padding: const EdgeInsets.all(8),
                      itemCount: state.data.data.values.length,
                      separatorBuilder: (BuildContext context, int index) => const Divider(),
                      itemBuilder: (context, index) {
                        var coin = state.data.data.values.toList()[index];
                        return CryptoCell(coin: coin, onPressed: () {
                          print(coin.symbol);
                          var bloc = BlocProvider.of<ListCoinsBlocCubit>(context, listen: false);
                          bloc.loadCoinPrice(coin.symbol);
                        },);
                      });
                } else {
                  return const SizedBox();
                }
              },
              // builder: ,
            );
          }),
        ));
  }
}
