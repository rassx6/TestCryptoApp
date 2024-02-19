import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:testcryptoapp/repositories/crypto_coins/models/crypto_coin.dart';

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
      leading: SvgPicture.asset(
        'assets/svg/bitcoin-logo.svg', 
        height: 25, 
        width: 25,),
      title: Text(
        coin.name,
        style: theme.textTheme.bodyMedium
      ),
      subtitle: Text(
        '${coin.priceInUSD} \$', 
        style: theme.textTheme.labelSmall
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/coin',
          arguments: coin,
          );
      },
    );
  }
}