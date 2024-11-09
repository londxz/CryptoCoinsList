import 'package:firstapp/repositories/crypto_coins/models/crypto_coin.dart';
import 'package:flutter/material.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.coin,
  });

  final CryptoCoin coin;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
    
      leading: Image.network(
        coin.imageUrl,
        height: 50,
        width: 50),
      title: Text(
        coin.name,
        style:  theme.textTheme.bodyMedium,
      ),
    
      subtitle: Text('${coin.priceInUSD}\$',
      style: theme.textTheme.labelSmall,
      ),
    
      trailing: const Icon(Icons.arrow_forward_ios),
    
      onTap: () { //make coinField tapped
        Navigator.of(context).pushNamed(
          '/coin',
           arguments: coin.name
           );
      }, 
    );
  }
}