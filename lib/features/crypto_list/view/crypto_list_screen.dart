import 'package:firstapp/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:firstapp/features/crypto_list/widgets/widgets.dart';
import 'package:firstapp/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';


class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({
    super.key
    });

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {

final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstractCoinsRepository>());

@override
  void initState() {

  // add bloc's event
  _cryptoListBloc.add(LoadCryptoList());

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

      body: BlocBuilder<CryptoListBloc, CryptoListState>(

        bloc: _cryptoListBloc,
        builder: (context, state) {
        if (state is CryptoListLoaded) {
          return ListView.separated(

          padding: const EdgeInsets.only(top: 16),
          itemCount: state.coinsList.length,
          separatorBuilder: (context, index) => Divider(color: theme.dividerColor),
          
          itemBuilder: (context, i) {

            final coin = state.coinsList[i];

            return CryptoCoinTile(coin: coin);
            },
          );
        }
        
        if (state is CryptoListLoadingFailure) {
          return Center(
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Something went wrong',
                  style: theme.textTheme.bodyMedium,
                ),
                Text(
                  'Please try againg later',
                  style: theme.textTheme.labelSmall,
                ),       
              ],
            ), 
          );
        }
        return const Center(child: CircularProgressIndicator());
        },
      ),

    );
  }

}
