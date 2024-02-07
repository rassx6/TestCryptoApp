import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class CryptoCoinTile extends StatelessWidget {
  const CryptoCoinTile({
    super.key,
    required this.coinName,

  });

  final String coinName;


  @override
  Widget build(BuildContext context) {
     final theme = Theme.of(context);
    return ListTile(
      leading: SvgPicture.asset(
        'assets/svg/bitcoin-logo.svg', 
        height: 25, 
        width: 25,),
      title: Text(
        coinName,
        style: theme.textTheme.bodyMedium
      ),
      subtitle: Text('20000\$', style: theme.textTheme.labelSmall
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context).pushNamed(
          '/coin',
          arguments: coinName,
          );
      },
    );
  }
}