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
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
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
            ];
          },
          body: TabBarView(children: [
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1 / 1.5,
              ),
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text("Hello"),
                    tileColor: Colors.amber,
                  ),
                );
              },
            ),
          ]),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   final args = ModalRoute.of(context)!.settings.arguments as WalletArguments;

  //   return DefaultTabController(
  //     length: 2,
  //     child: Scaffold(
  //       extendBodyBehindAppBar: true,
  //       appBar: walletAppbar(args),
  //       bottomNavigationBar:  (
  //         currentIndex: _currentBottonIndex,
  //         onTap: _handleIndexChanged,
  //       ),
  //       body: CustomScrollView(
  //         physics: const BouncingScrollPhysics(),
  //         slivers: [
  //           const SliverToBoxAdapter(
  //             child: SizedBox(
  //               height: (106 + 56),
  //             ),
  //           ),
  //           SliverGrid(
  //             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //               crossAxisCount: 3,
  //               childAspectRatio: 1 / 1.5,
  //             ),
  //             delegate: SliverChildBuilderDelegate(
  //               (context, index) {
  //                 return Padding(
  //                   padding: const EdgeInsets.all(8.0),
  //                   child: ListTile(
  //                     tileColor: Colors.red,
  //                     title: Text("Item ${index + 1}"),
  //                   ),
  //                 );
  //               },
  //               childCount: 20,
  //             ),
  //           ),
  //           const SliverPadding(
  //             padding: EdgeInsets.only(bottom: 80.0),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
