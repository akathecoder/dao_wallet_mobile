import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_theme/json_theme.dart';
import 'package:multisig_wallet_with_delegation/screens/homepage.dart';
import 'package:multisig_wallet_with_delegation/screens/profile.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeStr =
      await rootBundle.loadString('assets/theme/appainter_theme.json');
  final themeJson = jsonDecode(themeStr);
  final theme = ThemeDecoder.decodeThemeData(themeJson)!;

  runApp(MyApp(theme: theme));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.theme}) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multisig Wallet',
      debugShowCheckedModeBanner: false,
      theme: theme,
      routes: {
        Homepage.id: (context) => const Homepage(title: "Multisig Wallet"),
        Profile.id: (context) => const Profile(),
      },
      initialRoute: Homepage.id,
    );
  }
}
