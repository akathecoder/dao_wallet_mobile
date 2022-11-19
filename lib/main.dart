import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:multisig_wallet_with_delegation/constants/konstants.dart';
import 'package:multisig_wallet_with_delegation/screens/connect_wallet.dart';
import 'package:multisig_wallet_with_delegation/screens/contract_wallet_screen.dart';
import 'package:multisig_wallet_with_delegation/screens/faq_screen.dart';
import 'package:multisig_wallet_with_delegation/screens/homepage.dart';
import 'package:multisig_wallet_with_delegation/screens/profile.dart';
import 'package:multisig_wallet_with_delegation/utils/modals/wallet.dart';
import 'package:multisig_wallet_with_delegation/utils/wallet/check_wallet_connection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(WalletAdapter());

  // Open Wallet Box
  await Hive.openBox<Wallet>('walletBox');

  // Check Metamask connection
  await checkWalletConnection();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: kAppName,
      debugShowCheckedModeBanner: false,
      routes: {
        Homepage.id: (context) => Homepage(title: kAppName),
        Profile.id: (context) => const Profile(),
        ContractWalletScreen.id: (context) => const ContractWalletScreen(),
        FaqScreen.id: (context) => const FaqScreen(),
        ConnectWallet.id: (context) => ConnectWallet(title: kAppName),
      },
      initialRoute: Homepage.id,
    );
  }
}
