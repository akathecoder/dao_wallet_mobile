import 'package:flutter/material.dart';
import 'package:multisig_wallet_with_delegation/components/appbar/custom_app_bar.dart';
import 'package:multisig_wallet_with_delegation/components/homepage/profile_info_app_bar_bottom.dart';

class Homepage extends StatefulWidget {
  static String id = "homepage";

  const Homepage({super.key, required this.title});

  final String title;

  @override
  State<Homepage> createState() => _HomepageState();
}

enum Layout {
  grid,
  list,
}

class _HomepageState extends State<Homepage> {
  Layout walletLayout = Layout.grid;

  void swapWalletlayout() {
    if (walletLayout == Layout.grid) {
      setState(() {
        walletLayout = Layout.list;
      });
    } else {
      setState(() {
        walletLayout = Layout.grid;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: widget.title,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.help_outline),
              tooltip: "Help",
            ),
          ),
        ],
        bottom: profileInfoAppBarBottom(context: context),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 4.0),
                child: IconButton(
                  onPressed: () {
                    swapWalletlayout();
                  },
                  icon: Icon(
                    walletLayout == Layout.grid
                        ? Icons.view_list_rounded
                        : Icons.grid_view_rounded,
                    size: 32,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                20,
                (index) {
                  return Center(
                    child: Text(
                      'Item $index',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
