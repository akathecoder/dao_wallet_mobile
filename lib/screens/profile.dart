import 'package:flutter/material.dart';
import 'package:multisig_wallet_with_delegation/components/appbar/custom_app_bar.dart';

class Profile extends StatefulWidget {
  static String id = "profile_screen";

  const Profile({super.key});

  final String title = "Profile";

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context: context,
        title: widget.title,
      ),
      body: const Center(
        child: Text("Hello World!"),
      ),
    );
  }
}
