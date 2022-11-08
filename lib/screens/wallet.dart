import 'package:flutter/material.dart';
import 'package:multisig_wallet_with_delegation/components/wallet/wallet_appbar.dart';
import 'package:multisig_wallet_with_delegation/components/wallet/wallet_bottom_navigation_bar.dart';

class WalletArguments {
  const WalletArguments({required this.address, required this.title});

  final String title;
  final String address;
}

class Wallet extends StatefulWidget {
  static String id = "wallet_page";

  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  int _currentBottonIndex = 0;
  void _handleIndexChanged(int? index) {
    setState(() {
      _currentBottonIndex = index!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as WalletArguments;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: walletAppbar(args),
        bottomNavigationBar: walletBottomNavigationBar(
          currentIndex: _currentBottonIndex,
          onTap: _handleIndexChanged,
        ),
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(
                height: (106 + 56),
              ),
            ),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1 / 1.5,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      tileColor: Colors.red,
                      title: Text("Item ${index + 1}"),
                    ),
                  );
                },
                childCount: 20,
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
