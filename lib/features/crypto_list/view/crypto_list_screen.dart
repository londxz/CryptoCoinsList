import 'package:firstapp/repositories/crypto_coins/crypto_coins_repository.dart';
import 'package:flutter/material.dart';

import '../../../repositories/crypto_coins/models/crypto_coin.dart';
import '../widgets/widgets.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({
    super.key
    });

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {

//make variable
List<CryptoCoin>? _cryptoCoinsList;

@override
  void initState() {
  _loadCryptoCoins();
  super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(172, 36, 36, 35) ,
      appBar: AppBar(
        title: const Text('Coin List'),
        
      ),

      body: (_cryptoCoinsList == null) ? const Center(child: CircularProgressIndicator()) :

      ListView.separated(
        padding: const EdgeInsets.only(top: 16),
        itemCount: _cryptoCoinsList!.length,
        separatorBuilder: (context, index) => Divider(color: theme.dividerColor),
        
        itemBuilder: (context, i) {

          final coin = _cryptoCoinsList![i];

        return CryptoCoinTile(coin: coin);
        },
      ),

    );
  }

  Future<void> _loadCryptoCoins() async {
    _cryptoCoinsList = await CryptoCoinsRepository().getCoinsList();
    setState(() { });
  }
}
