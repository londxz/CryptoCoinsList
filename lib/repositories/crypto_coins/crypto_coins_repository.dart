import 'package:dio/dio.dart';
import 'package:firstapp/repositories/crypto_coins/crypto_coins.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository {

  final Dio dio;

  CryptoCoinsRepository({
    required this.dio
    });

  @override
  Future<List<CryptoCoin>> getCoinsList() async {

    final response = await dio.get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,SOL,TON,NOT,HMSTR,DOGE,PEPE,GRASS,AVAX&tsyms=USD'
    );
    
    final data = response.data as Map<String,dynamic>;
    final dataRaw = data['RAW'] as Map<String,dynamic>;

    final cryptoCoinsList = dataRaw.entries.map((e) {
      final usdData = (e.value as Map<String, dynamic>)['USD'];
      final price = usdData['PRICE'];
      //final price = (noRoundedPrice * 100).round() / 100;
      final imageUrl = usdData['IMAGEURL'];
     
     return CryptoCoin(
      name: e.key, 
      priceInUSD: price,
      imageUrl: 'https://www.cryptocompare.com/$imageUrl'
      );
    }).toList();

    return cryptoCoinsList;
  }
}