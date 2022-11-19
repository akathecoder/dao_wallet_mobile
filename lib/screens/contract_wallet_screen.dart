import 'package:flutter/material.dart';
import 'package:multisig_wallet_with_delegation/components/general/neu_box.dart';

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

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight + 144),
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: Navigator.canPop(context)
                            ? NeuBox(
                                child: IconButton(
                                  icon: const Icon(Icons.arrow_back),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              )
                            : null,
                      ),
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Text(
                            args.title.toUpperCase().split('').join(" "),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                        width: 60,
                        child: NeuBox(
                          child: IconButton(
                            icon: const Icon(Icons.settings),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                PreferredSize(
                  preferredSize: const Size.fromHeight(56.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 25.0,
                    ),
                    child: NeuBox(
                      child: TabBar(
                        labelColor: Colors.black87,
                        tabs: const [
                          Tab(
                            text: "Crypto",
                            icon: Icon(Icons.currency_bitcoin),
                          ),
                          Tab(
                            text: "NFTs",
                            icon: Icon(Icons.filter_frames),
                          ),
                          Tab(
                            text: "Updates",
                            icon: Icon(Icons.notifications),
                          ),
                        ],
                        indicator: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        indicatorWeight: 1,
                        indicatorColor: Colors.black.withOpacity(0.25),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
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
}
