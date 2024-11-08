import 'package:firstapp/repositories/crypto_coins/crypto_coins_repository.dart';
import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({
    super.key
    });

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(172, 36, 36, 35) ,
      appBar: AppBar(
        title: const Text('Coin List'),
        
      ),

      body: ListView.separated(
        itemCount: 5,
        separatorBuilder: (context, index) => Divider(color: theme.dividerColor),
        
        itemBuilder: (context, i) {

          const coinName = 'Bitcoin';

        return const CryptoCoinTile(coinName: coinName);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.download),
        onPressed: () {
        CryptoCoinsRepository().getCoinsList();
      }),
    );
  }
}
