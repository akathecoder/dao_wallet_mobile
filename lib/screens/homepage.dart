import 'package:flutter/material.dart';
import 'package:multisig_wallet_with_delegation/components/homepage/homepage_appbar.dart';
import 'package:multisig_wallet_with_delegation/components/homepage/homepage_main_wallet_box.dart';
import 'package:multisig_wallet_with_delegation/components/homepage/wallet_card.dart';

class Homepage extends StatefulWidget {
  static String id = "homepage";

  const Homepage({super.key, required this.title});

  final String title;

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String walletAddress = "0xb5f7E8dD674E8fEaA37E7817AD26dA72adadce1f";

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
      extendBodyBehindAppBar: true,
      appBar: homepageAppBar(context: context, title: widget.title),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 106,
              ),
            ),
            SliverToBoxAdapter(
              child: HomepageMainWalletBox(walletAddress: walletAddress),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(
                  "Wallets",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    shadows: [
                      Shadow(
                        offset: Offset(1.0, 1.0),
                        blurRadius: 38.0,
                        color: Color.fromARGB(255, 21, 21, 21),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 1.5,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return wallets[index];
                },
                childCount: wallets.length,
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.only(bottom: 80.0),
            ),
          ],
        ),
      ),
    );
  }
}
