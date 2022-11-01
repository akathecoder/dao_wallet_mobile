import 'package:flutter/material.dart';
import 'package:multisig_wallet_with_delegation/components/appbar/custom_app_bar.dart';
import 'package:multisig_wallet_with_delegation/components/homepage/profileInfoAppBarBottom.dart';

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
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.symmetric(horizontal: 8.0),
        //     child: IconButton(
        //         onPressed: () {
        //           Navigator.pushNamed(context, Profile.id);
        //         },
        //         icon: const Icon(
        //           Icons.account_circle,
        //           size: 32,
        //         )),
        //   ),
        // ],

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
