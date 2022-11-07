import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multisig_wallet_with_delegation/screens/faq_screen.dart';

PreferredSize homepageAppBar({
  required BuildContext context,
  required String title,
}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(56.0),
    child: ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: AppBar(
          backgroundColor: Colors.black.withOpacity(0.2),
          title: Text(title),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, FaqScreen.id);
                },
                icon: const Icon(Icons.help_outline),
                tooltip: "Help",
              ),
            ),
          ],
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
  );
}
