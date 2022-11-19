import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:multisig_wallet_with_delegation/components/contract_wallet/contract_wallet_appbar.dart';
import 'package:multisig_wallet_with_delegation/constants/keys.dart';
import 'package:multisig_wallet_with_delegation/constants/konstants.dart';
import 'package:multisig_wallet_with_delegation/screens/connect_wallet.dart';
import 'package:multisig_wallet_with_delegation/utils/modals/wallet.dart';

class ContractWalletScreenArguments {
  const ContractWalletScreenArguments({
    required this.address,
    required this.title,
  });

  final String title;
  final String address;
}

class ContractWalletScreen extends StatefulWidget {
  static String id = "wallet_page";

  const ContractWalletScreen({super.key});

  @override
  State<ContractWalletScreen> createState() => _ContractWalletScreenState();
}

class _ContractWalletScreenState extends State<ContractWalletScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as ContractWalletScreenArguments;

    return ValueListenableBuilder(
      valueListenable:
          Hive.box<Wallet>('walletBox').listenable(keys: [primaryWalletKey]),
      builder: (BuildContext context, Box<Wallet> box, Widget? child) {
        if (box.get(primaryWalletKey) == null) {
          return ConnectWallet(title: kAppName);
        } else {
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              backgroundColor: Colors.grey[300],
              appBar: contractWalletAppbar(context: context, args: args),
              body: const TabBarView(
                children: [
                  Icon(Icons.flight, size: 350),
                  Icon(Icons.directions_transit, size: 350),
                  Icon(Icons.list, size: 350),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
