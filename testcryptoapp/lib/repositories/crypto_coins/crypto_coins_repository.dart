import 'package:dio/dio.dart';
import 'package:testcryptoapp/repositories/crypto_coins/models/crypto_coin.dart';

class CryptoCoinsRepository {
  Future<List<CryptoCoin>> getCoinsList() async {
    final response = await Dio().get(
      'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB&tsyms=USD'
    );
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCoinsList = dataRaw.entries
    .map((e) { CryptoCoin(
      name: e.key, 
      priceInUSD: (e.value as Map<String, dynamic>)['USD']),
      )}
    .toList();
    return cryptoCoinsList;
  }
}