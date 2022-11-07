import 'package:flutter/material.dart';
import 'package:multisig_wallet_with_delegation/components/appbar/custom_app_bar.dart';

class WalletArguments {
  const WalletArguments({required this.address, required this.title});

  final String title;
  final String address;
}

class Wallet extends StatefulWidget {
  static String id = "wallet_page";

  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as WalletArguments;

    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: args.title,
      ),
    );
  }
}
