import 'package:flutter/material.dart';
import 'package:multisig_wallet_with_delegation/components/appbar/custom_app_bar.dart';
import 'package:multisig_wallet_with_delegation/utils/wallet/walletconnect.dart';

class Profile extends StatefulWidget {
  static String id = "profile_screen";

  const Profile({super.key});

  final String title = "Profile";

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String sessionStatusString = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: widget.title,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Center(child: Text(sessionStatusString))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  connectWallet().then((value) {
                    setState(() {
                      sessionStatusString = value;
                    });
                  });
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 60),
                ),
                child: const Text("Connect Wallet"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
