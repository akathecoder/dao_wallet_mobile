import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:multisig_wallet_with_delegation/components/contract_wallet/contract_wallet_appbar.dart';
import 'package:multisig_wallet_with_delegation/components/contract_wallet/crypto_tab_view.dart';
import 'package:multisig_wallet_with_delegation/components/contract_wallet/nft_tab_view.dart';
import 'package:multisig_wallet_with_delegation/components/contract_wallet/transactions_tab_view.dart';
import 'package:multisig_wallet_with_delegation/constants/keys.dart';
import 'package:multisig_wallet_with_delegation/constants/konstants.dart';
import 'package:multisig_wallet_with_delegation/screens/connect_wallet.dart';
import 'package:multisig_wallet_with_delegation/utils/data_apis/get_token_data.dart';
import 'package:multisig_wallet_with_delegation/utils/modals/token_types.dart';
import 'package:multisig_wallet_with_delegation/utils/modals/wallet.dart';

class ContractWalletScreenArguments {
  const ContractWalletScreenArguments({
    required this.address,
    required this.title,
  });

  final String title;
  final String address;
}

class ContractWalletScreen extends StatefulWidget {
  static String id = "wallet_page";

  const ContractWalletScreen({super.key});

  @override
  State<ContractWalletScreen> createState() => _ContractWalletScreenState();
}

class _ContractWalletScreenState extends State<ContractWalletScreen> {
  late String signerAddress;
  Map<dynamic, Object>? tokens;

  Future<void> fetchData({
    required String walletAddress,
    required int chainId,
  }) async {
    getTokenData(walletAddress: walletAddress, chainId: chainId).then((value) {
      setState(() {
        tokens = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as ContractWalletScreenArguments;

    return ValueListenableBuilder(
      valueListenable:
          Hive.box<Wallet>('walletBox').listenable(keys: [primaryWalletKey]),
      builder: (BuildContext context, Box<Wallet> box, Widget? child) {
        Wallet? signerMetamaskWallet = box.get(primaryWalletKey);

        if (signerMetamaskWallet == null) {
          return ConnectWallet(title: kAppName);
        } else {
          signerAddress = signerMetamaskWallet.accounts[0];

          fetchData(
            walletAddress: args.address,
            chainId: signerMetamaskWallet.chainId,
          );

          return DefaultTabController(
            length: 3,
            child: Scaffold(
              backgroundColor: Colors.grey[300],
              appBar: contractWalletAppbar(context: context, args: args),
              body: TabBarView(
                children: [
                  CryptoTabView(
                    erc20Tokens: tokens != null
                        ? tokens!["erc20Tokens"] as List<ERC20Token>
                        : [],
                  ),
                  NftTabView(
                    erc721Tokens: tokens != null
                        ? tokens!["erc721Tokens"] as List<ERC721Token>
                        : [],
                    erc1155Tokens: tokens != null
                        ? tokens!["erc1155Tokens"] as List<ERC1155Token>
                        : [],
                  ),
                  TransactionsTabView(walletAddress: args.address),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
