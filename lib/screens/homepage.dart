import 'package:flutter/material.dart';
import 'package:multisig_wallet_with_delegation/components/appbar/custom_app_bar.dart';
import 'package:multisig_wallet_with_delegation/components/homepage/profile_info_app_bar_bottom.dart';
import 'package:multisig_wallet_with_delegation/components/homepage/wallet_card.dart';

class Homepage extends StatefulWidget {
  static String id = "homepage";

  const Homepage({super.key, required this.title});

  final String title;

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<Widget> wallets = [
    const WalletCard(
      color: Colors.blue,
      address: "0xb5f7E8dD674E8fEaA37E7817AD26dA72adadce1f",
      name: "Super Secret Wallet",
    ),
    const WalletCard(
      color: Colors.red,
      address: "0xb5f7E8dD674E8fEaA37E7817AD26dA72adadce1f",
      name: "Super Secret Wallet",
    ),
    const WalletCard(
      color: Colors.purple,
      address: "0xb5f7E8dD674E8fEaA37E7817AD26dA72adadce1f",
      name: "Super Secret Wallet",
    ),
    const WalletCard(
      color: Colors.brown,
      address: "0xb5f7E8dD674E8fEaA37E7817AD26dA72adadce1f",
      name: "Super Secret Wallet",
    ),
    const WalletCard(
      color: Colors.blue,
      address: "0xb5f7E8dD674E8fEaA37E7817AD26dA72adadce1f",
      name: "Super Secret Wallet",
    ),
    const WalletCard(
      color: Colors.red,
      address: "0xb5f7E8dD674E8fEaA37E7817AD26dA72adadce1f",
      name: "Super Secret Wallet",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: widget.title,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.help_outline),
              tooltip: "Help",
            ),
          ),
        ],
        bottom: profileInfoAppBarBottom(context: context),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              "Wallets",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          Expanded(
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return wallets[index];
              },
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.5,
              ),
              itemCount: wallets.length,
            ),
          ),
        ],
      ),
    );
  }
}
