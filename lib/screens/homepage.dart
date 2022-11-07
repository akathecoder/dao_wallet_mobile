import 'package:flutter/material.dart';
import 'package:multisig_wallet_with_delegation/components/appbar/custom_app_bar.dart';
import 'package:multisig_wallet_with_delegation/components/blockies/custom_blockie.dart';
import 'package:multisig_wallet_with_delegation/components/homepage/profile_info_app_bar_bottom.dart';

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
    return Container(
      margin: const EdgeInsets.all(8),
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
    );
  }
}
