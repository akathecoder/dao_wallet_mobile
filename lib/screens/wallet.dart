import 'package:flutter/material.dart';
import 'package:multisig_wallet_with_delegation/components/appbar/custom_app_bar.dart';
import 'package:multisig_wallet_with_delegation/components/general/glass_box.dart';

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

    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: args.title,
      ),
      bottomNavigationBar: GlassBox(
        child: BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey[300],
          backgroundColor: Colors.transparent,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentBottonIndex,
          onTap: _handleIndexChanged,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.abc), label: "Label 1"),
            BottomNavigationBarItem(
                icon: Icon(Icons.access_alarm_rounded), label: "Label 2"),
          ],
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: Colors.red,
              title: Text("Loda"),
            ),
          );
        },
      ),
    );
  }
}
