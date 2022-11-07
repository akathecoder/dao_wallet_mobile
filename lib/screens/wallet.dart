import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
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
            ),
          ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: BottomNavigationBar(
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey[300],
            backgroundColor: Colors.black.withOpacity(0.2),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentBottonIndex,
            onTap: _handleIndexChanged,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.notifications), label: "Label 1"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.access_alarm_rounded), label: "Label 2"),
            ],
          ),
        ),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 106,
            ),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1 / 1.5,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ListTile(
                    tileColor: Colors.red,
                    title: Text("Loda"),
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
    );
  }
}
