import 'package:crypto_app/api/entities/coins_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CryptoCell extends StatelessWidget {
  final CryptoCoin coin;
  final VoidCallback onPressed;

  const CryptoCell({Key? key, required this.coin, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                coin.symbol,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
