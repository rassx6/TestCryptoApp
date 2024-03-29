import 'package:flutter/material.dart';
import 'package:testcryptoapp/repositories/crypto_coins/crypto_coin.dart';
import '../widgets/widgets.dart';


class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key, required this.title});
  final String title;

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {

List<CryptoCoin>? _cryptoCoinsList;

@override
  void initState() {
    _loadCryptoCoins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CryptoApp'),
        centerTitle: true,
      ),
      body: (_cryptoCoinsList == null) 
      ? const Center(child: CircularProgressIndicator()) :
      ListView.separated(
      padding: const EdgeInsets.only(top: 16),
        itemCount: _cryptoCoinsList!.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, i) {
        final coin = _cryptoCoinsList![i];
        return CryptoCoinTile(coin: coin);
        },
      ),
    );
  }

  Future<void> _loadCryptoCoins() async {
    _cryptoCoinsList = await CryptoCoinsRepository().getCoinsList();
    setState(() {
    });
  }
}