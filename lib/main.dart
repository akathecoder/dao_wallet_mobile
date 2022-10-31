import 'package:flutter/material.dart';
import 'package:multisig_wallet_with_delegation/screens/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multisig Wallet',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        Homepage.id: (context) => const Homepage(title: "Multisig Wallet"),
      },
      initialRoute: Homepage.id,
    );
  }
}
