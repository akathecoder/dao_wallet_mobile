import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multisig_wallet_with_delegation/screens/wallet.dart';

PreferredSize walletAppbar(WalletArguments args) {
  return PreferredSize(
    // preferredSize: const Size.fromHeight(56.0),
    preferredSize: const Size.fromHeight(112.0),
    child: ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: AppBar(
          backgroundColor: Colors.black.withOpacity(0.2),
          title: Text(args.title),
          centerTitle: true,
          elevation: 0.0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness:
                Brightness.dark, // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(56.0),
            child: TabBar(
              tabs: const [
                Tab(
                  text: "Crypto",
                  icon: Icon(Icons.currency_bitcoin),
                ),
                Tab(
                  text: "NFTs",
                  icon: Icon(Icons.filter_frames),
                ),
              ],
              indicatorWeight: 4,
              indicatorColor: Colors.black.withOpacity(0.25),
            ),
          ),
        ),
      ),
    ),
  );
}
