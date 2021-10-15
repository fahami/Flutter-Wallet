import 'package:beningswallet/style.dart';
import 'package:beningswallet/view/home_screen.dart';
import 'package:beningswallet/view_model/wallet_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WalletProvider(),
      builder: (context, child) => MaterialApp(
        theme: appTheme(context),
        title: 'Benings Indonesia Wallet',
        initialRoute: '/',
        routes: {
          '/': (context) => HomeScreen(),
        },
      ),
    );
  }
}
