import 'package:flutter/material.dart';
import 'package:multisig_wallet_with_delegation/components/blockies/custom_blockie.dart';
import 'package:multisig_wallet_with_delegation/screens/wallet.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({
    Key? key,
    required this.color,
    required this.name,
    required this.address,
  }) : super(key: key);

  final MaterialColor color;
  final String name;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            Wallet.id,
            arguments: WalletArguments(title: name, address: address),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: color[50],
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomBlockie(size: 150, data: address),
                Column(
                  children: [
                    Text(
                      address,
                      style: Theme.of(context).textTheme.bodySmall,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      name,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
