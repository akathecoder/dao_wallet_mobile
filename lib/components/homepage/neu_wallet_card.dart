import 'package:flutter/material.dart';
import 'package:multisig_wallet_with_delegation/components/general/neu_box.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({super.key, required this.name, required this.address});

  final String name;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: NeuBox(
          child: Column(
        children: [],
      )),
    );
  }
}
