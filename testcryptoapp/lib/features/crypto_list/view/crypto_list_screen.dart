import 'package:flutter/material.dart';
import 'package:testcryptoapp/repositories/crypto_coins/crypto_coins_repository.dart';
import 'package:testcryptoapp/repositories/crypto_coins/models/crypto_coin.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CryptoApp'),
        centerTitle: true,
      ),
      body: (_cryptoCoinsList == null) 
      ? const SizedBox() :
      ListView.separated(
        itemCount: _cryptoCoinsList!.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, i) {
        final coin = _cryptoCoinsList![i];
        return CryptoCoinTile(coin: coin);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.download),
        onPressed: () async {
         _cryptoCoinsList = await CryptoCoinsRepository().getCoinsList();
         setState(() {
           
         });
      }),
    );
  }
}

