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

class _HomepageState extends State<Homepage> {
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
      body: GridView.count(
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
    );
  }
}
