import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:multisig_wallet_with_delegation/components/blockies/custom_blockie.dart';
import 'package:multisig_wallet_with_delegation/components/general/neu_box.dart';
import 'package:multisig_wallet_with_delegation/constants/keys.dart';
import 'package:multisig_wallet_with_delegation/constants/konstants.dart';
import 'package:multisig_wallet_with_delegation/screens/create_wallet.dart';
import 'package:multisig_wallet_with_delegation/utils/modals/private_key.dart';
import 'package:multisig_wallet_with_delegation/utils/modals/token_types.dart';
import 'package:web3dart/credentials.dart';

class NftScreenArguments {
  final ERC721Token? nft721;
  final ERC1155Token? nft1155;

  NftScreenArguments({
    this.nft721,
    this.nft1155,
  }) : assert(nft721 != null || nft1155 != null);
}

class NftScreen extends StatefulWidget {
  static String id = "nft_screen";

  const NftScreen({super.key});

  final String title = "NFT";

  @override
  State<NftScreen> createState() => _NftScreenState();
}

class _NftScreenState extends State<NftScreen> {
  late String signerAddress;

  void handleTransfer(String address) {
    //
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as NftScreenArguments;

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

                    NftImageCard(args: args),

                    InformationCard(args: args),

                    TransferCard(handleTransfer: handleTransfer),

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

  final NftScreenArguments args;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 12.0,
      ),
      child: NeuBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 12.0,
          ),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  args.nft721 != null
                      ? args.nft721!.contractName
                      : args.nft1155!.contractName,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  args.nft721 != null
                      ? args.nft721!.nftName
                      : args.nft1155!.nftName,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                Text(
                  "# ${args.nft721 != null ? args.nft721!.tokenId.toString() : args.nft1155!.tokenId.toString()}",
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TransferCard extends StatefulWidget {
  const TransferCard({
    super.key,
    required this.handleTransfer,
  });

  @override
  State<TransferCard> createState() => _TransferCardState();

  final void Function(String address) handleTransfer;
}

class _TransferCardState extends State<TransferCard> {
  bool isOpen = false;
  String to = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 12.0,
      ),
      child: NeuBox(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Transfer",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isOpen = !isOpen;
                      });
                    },
                    icon: Icon(
                      isOpen ? Icons.expand_less : Icons.expand_more,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: isOpen,
                child: Column(
                  children: [
                    const SizedBox(height: 8),

                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'To',
                              hintText: 'Enter Address to Transfer Nft',
                            ),
                            onChanged: (value) {
                              setState(() {
                                to = value;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 8),
                        NeuBox(
                          child: IconButton(
                            onPressed: () {
                              widget.handleTransfer(to);
                            },
                            icon: const Icon(Icons.arrow_forward),
                          ),
                        ),
                      ],
                    ),

                    //
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NftImageCard extends StatelessWidget {
  const NftImageCard({
    Key? key,
    required this.args,
  }) : super(key: key);

  final NftScreenArguments args;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 12.0,
      ),
      child: NeuBox(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              args.nft721 != null ? args.nft721!.url : args.nft1155!.url,
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
                  data: args.nft721 != null
                      ? (args.nft721!.contractAddr +
                          args.nft721!.tokenId.toString())
                      : (args.nft1155!.contractAddr +
                          args.nft1155!.tokenId.toString()),
                );
              },
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final NftScreen widget;

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
