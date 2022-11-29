import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:multisig_wallet_with_delegation/components/blockies/custom_blockie.dart';
import 'package:multisig_wallet_with_delegation/components/general/neu_box.dart';
import 'package:multisig_wallet_with_delegation/constants/keys.dart';
import 'package:multisig_wallet_with_delegation/constants/konstants.dart';
import 'package:multisig_wallet_with_delegation/screens/create_wallet.dart';
import 'package:multisig_wallet_with_delegation/utils/controllers/erc20_transaction_controller.dart';
import 'package:multisig_wallet_with_delegation/utils/modals/private_key.dart';
import 'package:multisig_wallet_with_delegation/utils/modals/token_types.dart';
import 'package:web3dart/web3dart.dart';

class TokenScreenArguments {
  final ERC20Token token;
  final String address;

  TokenScreenArguments({
    required this.address,
    required this.token,
  });
}

class TokenScreen extends StatefulWidget {
  static String id = "token_screen";

  const TokenScreen({super.key});

  final String title = "Token";

  @override
  State<TokenScreen> createState() => _TokenScreenState();
}

class _TokenScreenState extends State<TokenScreen> {
  late String signerAddress;

  void handleTransfer({
    required String deployedContractAddress,
    required String contractAddress,
    required String to,
    required double amount,
    required int decimals,
  }) {
    // log(deployedContractAddress);
    // log(contractAddress);
    // log(to);
    // log(amount.toString());
    // log(decimals.toString());

    createERC20Transaction(
      deployedContractAddress: deployedContractAddress,
      contractAddress: contractAddress,
      to: to,
      amount: BigInt.from(amount),
      // amount: BigInt.from(amount * math.pow(10, decimals)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as TokenScreenArguments;

    return ValueListenableBuilder(
      valueListenable: Hive.box<PrivateKey>('privateKeyBox')
          .listenable(keys: [privateKeyHiveKey]),
      builder: (BuildContext context, Box<PrivateKey> box, Widget? child) {
        PrivateKey? signerPrivateKey = box.get(privateKeyHiveKey);

        if (signerPrivateKey == null) {
          return CreateWallet(title: kAppName);
        } else {
          Credentials credentials =
              EthPrivateKey.fromHex(signerPrivateKey.privateKey);

          credentials.extractAddress().then((ethereumAddress) {
            setState(() {
              signerAddress = ethereumAddress.hex;
            });
          });

          return Scaffold(
            backgroundColor: Colors.grey[300],
            body: SafeArea(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    AppBar(widget: widget),

                    //  Space
                    const SizedBox(height: 24),

                    InformationCard(args: args),

                    TransferCard(
                      handleTransfer: (to, amount) {
                        handleTransfer(
                          deployedContractAddress: args.address,
                          to: to,
                          contractAddress: args.token.contractAddr,
                          amount: amount,
                          decimals: args.token.decimals,
                        );
                      },
                    ),

                    //
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

class InformationCard extends StatelessWidget {
  const InformationCard({
    Key? key,
    required this.args,
  }) : super(key: key);

  final TokenScreenArguments args;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: NeuBox(
        child: Row(
          children: [
            SizedBox(
              width: 140,
              height: 140,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.network(
                    args.token.logoUrl,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;

                      return const Padding(
                        padding: EdgeInsets.all(48.0),
                        child: CircularProgressIndicator(
                          color: Colors.grey,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return CustomBlockie(
                        size: 140,
                        data: args.token.contractAddr,
                      );
                    },
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    args.token.contractName,
                    style: Theme.of(context).textTheme.titleLarge,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    args.token.contractTickerSymbol,
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Balance: ${args.token.balance / math.pow(10, args.token.decimals)}",
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "Locked : ${args.token.lockedBalance / math.pow(10, args.token.decimals)}",
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TransferCard extends StatefulWidget {
  const TransferCard({
    Key? key,
    required this.handleTransfer,
  }) : super(key: key);

  @override
  State<TransferCard> createState() => _TransferCardState();

  final void Function(String to, double amount) handleTransfer;
}

class _TransferCardState extends State<TransferCard> {
  String to = "";
  double amount = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Transfer Crypto",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'To',
              hintText: 'Enter Address to Transfer Token',
            ),
            onChanged: (value) {
              setState(() {
                to = value;
              });
            },
            autofocus: true,
          ),
          const SizedBox(height: 12),
          TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Amount',
              hintText: 'Enter Amount to Transfer',
            ),
            onChanged: (value) {
              setState(() {
                amount = double.parse(value);
              });
            },
            keyboardType: TextInputType.number,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: InkWell(
              onTap: () {
                widget.handleTransfer(to, amount);
              },
              child: const NeuBox(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    "Transfer",
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final TokenScreen widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 60,
            width: 60,
            child: Navigator.canPop(context)
                ? NeuBox(
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  )
                : null,
          ),
          Text(
            widget.title.toUpperCase().split('').join(" "),
          ),
          const SizedBox(
            height: 60,
            width: 60,
            // child: NeuBox(child: Icon(Icons.question_mark)),
          ),
        ],
      ),
    );
  }
}
