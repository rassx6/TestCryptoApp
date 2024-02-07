import 'package:testcryptoapp/features/crypto_coin/crypto_coin.dart';
import 'package:testcryptoapp/features/crypto_list/crypto_list.dart';

final routes = {
        '/' : (context) => const CryptoListScreen(title: '',),
        '/coin' : (context) => const CryptoCoinScreen(),
};