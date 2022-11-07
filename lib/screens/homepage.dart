import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: AppBar(
              backgroundColor: Colors.black.withOpacity(0.2),
              title: Text(widget.title),
              centerTitle: true,
              elevation: 0.0,
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness:
                    Brightness.dark, // For Android (dark icons)
                statusBarBrightness: Brightness.light, // For iOS (dark icons)
              ),
            ),
          ),
        ),
      ),
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
            // SliverToBoxAdapter(
            //   child: Container(
            //     height: 100.0,
            //     width: double.infinity,
            //     color: Colors.yellow,
            //   ),
            // ),
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
