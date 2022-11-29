import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:multisig_wallet_with_delegation/constants/konstants.dart';
import 'package:multisig_wallet_with_delegation/screens/connect_wallet.dart';
import 'package:multisig_wallet_with_delegation/screens/contract_wallet_screen.dart';
import 'package:multisig_wallet_with_delegation/screens/contract_wallet_settings_screen.dart';
import 'package:multisig_wallet_with_delegation/screens/create_wallet.dart';
import 'package:multisig_wallet_with_delegation/screens/faq_screen.dart';
import 'package:multisig_wallet_with_delegation/screens/homepage.dart';
import 'package:multisig_wallet_with_delegation/screens/nft_screen.dart';
import 'package:multisig_wallet_with_delegation/screens/transaction_detail_screen.dart';
import 'package:multisig_wallet_with_delegation/utils/graphql/gql_client.dart';
import 'package:multisig_wallet_with_delegation/utils/modals/private_key.dart';
import 'package:multisig_wallet_with_delegation/utils/modals/wallet.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await initHiveForFlutter();

  Hive.registerAdapter(WalletAdapter());
  Hive.registerAdapter(PrivateKeyAdapter());

  // Open Wallet Box
  await Hive.openBox<Wallet>('walletBox');
  await Hive.openBox<PrivateKey>('privateKeyBox');

  // Check Metamask connection
  // await checkWalletConnection();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: gqlClientValueNotifier,
      child: MaterialApp(
        title: kAppName,
        debugShowCheckedModeBanner: false,
        routes: {
          Homepage.id: (context) => Homepage(title: kAppName),
          ContractWalletScreen.id: (context) => const ContractWalletScreen(),
          ContractWalletSettingsScreen.id: (context) =>
              const ContractWalletSettingsScreen(),
          FaqScreen.id: (context) => const FaqScreen(),
          ConnectWallet.id: (context) => ConnectWallet(title: kAppName),
          CreateWallet.id: (context) => CreateWallet(title: kAppName),
          TransactionDetailScreen.id: (context) =>
              const TransactionDetailScreen(),
          NftScreen.id: (context) => const NftScreen(),
        },
        initialRoute: Homepage.id,
        // initialRoute: CreateWallet.id,
      ),
    );
  }
}
