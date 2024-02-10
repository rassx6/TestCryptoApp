import 'package:flutter/material.dart';
import 'package:testcryptoapp/repositories/crypto_coins/crypto_coins_repository.dart';
import '../widgets/widgets.dart';


class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key, required this.title});
  final String title;

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CryptoApp'),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, i) {
          const coinName = 'Bitcoin';
        return const CryptoCoinTile(coinName: coinName);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.download),
        onPressed: (){
         CryptoCoinsRepository().getCoinsList();
      }),
    );
  }
}

