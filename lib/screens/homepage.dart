import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:multisig_wallet_with_delegation/components/general/neu_box.dart';
import 'package:multisig_wallet_with_delegation/components/homepage/homepage_main_wallet_box.dart';
import 'package:multisig_wallet_with_delegation/components/homepage/wallet_card.dart';
import 'package:multisig_wallet_with_delegation/constants/keys.dart';
import 'package:multisig_wallet_with_delegation/screens/connect_wallet.dart';
import 'package:multisig_wallet_with_delegation/screens/profile.dart';
import 'package:multisig_wallet_with_delegation/utils/modals/wallet.dart';

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
    return ValueListenableBuilder(
      valueListenable:
          Hive.box<Wallet>('walletBox').listenable(keys: [primaryWalletKey]),
      builder: (BuildContext context, Box<Wallet> box, Widget? child) {
        if (box.get(primaryWalletKey) == null) {
          return ConnectWallet(title: widget.title);
        } else {
          return Scaffold(
            backgroundColor: Colors.grey[300],
            body: SafeArea(
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 10),
                  ),

                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
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
                          SizedBox(
                            height: 60,
                            width: 60,
                            child: NeuBox(
                              child: IconButton(
                                icon: const Icon(Icons.link),
                                onPressed: () {
                                  Navigator.pushNamed(context, Profile.id);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  //  Space

                  const SliverToBoxAdapter(
                    child: SizedBox(height: 25),
                  ),

                  // Information Card

                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child:
                          HomepageMainWalletBox(walletAddress: walletAddress),
                    ),
                  ),

                  //

                  // Space

                  // Headline

                  // Padding
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25.0,
                        vertical: 8.0,
                      ),
                      child: Text(
                        "Wallets".toUpperCase().split('').join(" "),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),

                  const SliverToBoxAdapter(
                    child: SizedBox(height: 14),
                  ),

                  // Grid of Cards

                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    sliver: SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return const WalletCard(
                            address:
                                "0xb5f7E8dD674E8fEaA37E7817AD26dA72adadce1f",
                            name: "Super Secret Wallet",
                          );
                        },
                        childCount: 12,
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
