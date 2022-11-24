import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:multisig_wallet_with_delegation/components/general/neu_box.dart';
import 'package:multisig_wallet_with_delegation/constants/keys.dart';
import 'package:multisig_wallet_with_delegation/constants/konstants.dart';
import 'package:multisig_wallet_with_delegation/screens/connect_wallet.dart';
import 'package:multisig_wallet_with_delegation/utils/data_apis/metadata_converter_functions.dart';
import 'package:multisig_wallet_with_delegation/utils/graphql/wallet_settings_query.dart';
import 'package:multisig_wallet_with_delegation/utils/modals/wallet.dart';
import 'package:multisig_wallet_with_delegation/utils/modals/wallet_metadata_types.dart';

class ContractWalletSettingsScreenArguments {
  const ContractWalletSettingsScreenArguments({
    required this.address,
    required this.title,
  });

  final String title;
  final String address;
}

class ContractWalletSettingsScreen extends StatefulWidget {
  static String id = "contract_wallet_settings_screen";

  const ContractWalletSettingsScreen({super.key});

  final String title = "Settings";

  @override
  State<ContractWalletSettingsScreen> createState() =>
      _ContractWalletSettingsScreenState();
}

class _ContractWalletSettingsScreenState
    extends State<ContractWalletSettingsScreen> {
  late String signerAddress;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as ContractWalletSettingsScreenArguments;

    return ValueListenableBuilder(
      valueListenable:
          Hive.box<Wallet>('walletBox').listenable(keys: [primaryWalletKey]),
      builder: (BuildContext context, Box<Wallet> box, Widget? child) {
        Wallet? signerMetamaskWallet = box.get(primaryWalletKey);

        if (signerMetamaskWallet == null) {
          return ConnectWallet(title: kAppName);
        } else {
          signerAddress = signerMetamaskWallet.accounts[0];

          return Scaffold(
            backgroundColor: Colors.grey[300],
            body: SafeArea(
              child: Query(
                options: QueryOptions(
                  document: gql(walletSettingsQuery),
                  variables: {
                    "walletAddress": args.address.toLowerCase(),
                  },
                ),
                builder: (QueryResult<Object?> result,
                    {Future<QueryResult<Object?>> Function(FetchMoreOptions)?
                        fetchMore,
                    Future<QueryResult<Object?>?> Function()? refetch}) {
                  if (result.hasException) {
                    if (kDebugMode) {
                      print(result.exception.toString());
                    }
                    return Text(result.exception.toString());
                  }

                  if (result.isLoading) {
                    return const Text("Loading . . .");
                  }

                  // if (kDebugMode) {
                  //   print("==========================================");
                  //   log(result.data!["wallet"]["owner"]["weight"].runtimeType
                  //       .toString());
                  //   print("==========================================");
                  // }

                  Signer signerData = asSigner(
                    ownerData: result.data!["wallet"]["owner"],
                  );

                  WalletMetadata walletMetadata = asWalletMetadata(
                    metadata: result.data!["wallet"]["metadata"],
                  );

                  List<Signer> signers = [];

                  for (var signer in result.data!["wallet"]["signers"]) {
                    signers.add(asSigner(ownerData: signer));
                  }

                  //
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Padding(
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
                      ),

                      //  Space
                      const SizedBox(height: 24),

                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return const FaqBox();
                          },
                          itemCount: 10,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}

class FaqBox extends StatefulWidget {
  const FaqBox({super.key});

  @override
  State<FaqBox> createState() => _FaqBoxState();
}

class _FaqBoxState extends State<FaqBox> {
  bool isOpen = false;

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
                    "Title",
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
                  children: const [
                    SizedBox(height: 8),
                    Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
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
