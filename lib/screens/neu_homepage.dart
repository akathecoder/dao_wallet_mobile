import 'package:flutter/material.dart';
import 'package:multisig_wallet_with_delegation/components/general/neu_box.dart';
import 'package:multisig_wallet_with_delegation/components/homepage/neu_homepage_main_wallet_box.dart';
import 'package:multisig_wallet_with_delegation/components/homepage/neu_wallet_card.dart';
// import 'package:multisig_wallet_with_delegation/components/homepage/wallet_card.dart';

class Homepage extends StatefulWidget {
  static String id = "homepage";

  const Homepage({super.key, required this.title});

  final String title;

  @override
  State<Homepage> createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {
  String walletAddress = "0xb5f7E8dD674E8fEaA37E7817AD26dA72adadce1f";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 60,
                    width: 60,
                    // child: NeuBox(child: Icon(Icons.arrow_back)),
                  ),
                  Text(
                    widget.title.toUpperCase().split('').join(" "),
                  ),
                  const SizedBox(
                    height: 60,
                    width: 60,
                    child: NeuBox(child: Icon(Icons.question_mark)),
                  ),
                ],
              ),

              //  Space

              const SizedBox(height: 25),

              // Information Card

              HomepageMainWalletBox(walletAddress: walletAddress),

              //

              // Space

              // Headline

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Wallets".toUpperCase().split('').join(" "),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 14),

              // Grid of Cards

              Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.5,
                  ),
                  itemBuilder: (context, index) {
                    return const WalletCard(
                      address: "0xb5f7E8dD674E8fEaA37E7817AD26dA72adadce1f",
                      name: "Super Secret Wallet",
                    );
                  },
                  itemCount: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
