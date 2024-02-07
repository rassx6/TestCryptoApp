import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const CryptoApp());
}

class CryptoApp extends StatelessWidget {
  const CryptoApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoApp',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 43, 42, 42),
        primarySwatch: Colors.yellow,
        dividerColor: Colors.white24,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 43, 42, 42),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700)
        ),
        listTileTheme: const ListTileThemeData(iconColor: Colors.white),
        textTheme: TextTheme(
          bodyMedium: const TextStyle(            
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 20,),
          labelSmall: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontWeight: FontWeight.w500,
            fontSize: 14,),
        )
      ),
      routes: {
        '/' : (context) => CryptoListScreen(title: '',),
        '/coin' : (context) => CryptoCoinScreen(),
      },
     // initialRoute: '/', //can be removed
    );
  }
}

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key, required this.title});
  final String title;

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
        },
      ),
    );
  }
}

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  
  String? coinName;

@override
  void didChangeDependencies() {
    final args  = ModalRoute.of(context)?.settings.arguments;
    if (args == null) {
      print('you must provive args');
      return;
    }
    if (args is! String) {
      print('You must provide string args');
      return;
    }
    coinName = args;
    setState(() {});
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(coinName ?? '...')),
    );
  }
}