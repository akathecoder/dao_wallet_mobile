import 'package:flutter/material.dart';
import 'package:multisig_wallet_with_delegation/components/general/neu_box.dart';
import 'package:multisig_wallet_with_delegation/screens/contract_wallet_screen.dart';
import 'package:multisig_wallet_with_delegation/screens/contract_wallet_settings_screen.dart';

PreferredSize contractWalletAppbar({
  required BuildContext context,
  required ContractWalletScreenArguments args,
}) {
  return PreferredSize(
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
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          ContractWalletSettingsScreen.id,
                          arguments: ContractWalletSettingsScreenArguments(
                            title: args.title,
                            address: args.address,
                          ),
                        );
                      },
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
  );
}
