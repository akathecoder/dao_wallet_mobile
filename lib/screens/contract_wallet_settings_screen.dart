import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:multisig_wallet_with_delegation/components/blockies/custom_blockie.dart';
import 'package:multisig_wallet_with_delegation/components/general/neu_box.dart';
import 'package:multisig_wallet_with_delegation/constants/keys.dart';
import 'package:multisig_wallet_with_delegation/constants/konstants.dart';
import 'package:multisig_wallet_with_delegation/screens/create_wallet.dart';
import 'package:multisig_wallet_with_delegation/utils/data_apis/metadata_converter_functions.dart';
import 'package:multisig_wallet_with_delegation/utils/graphql/wallet_settings_query.dart';
import 'package:multisig_wallet_with_delegation/utils/modals/private_key.dart';
import 'package:multisig_wallet_with_delegation/utils/modals/wallet_metadata_types.dart';
import 'package:web3dart/credentials.dart';

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
                    return const Center(child: Text("Loading . . ."));
                  }

                  // if (kDebugMode) {
                  //   print("==========================================");
                  //   log(result.data!["wallet"]["owner"]["weight"].runtimeType
                  //       .toString());
                  //   print("==========================================");
                  // }

                  Signer ownerData = asSigner(
                    ownerData: result.data!["wallet"]["owner"],
                  );

                  WalletMetadata walletMetadata = asWalletMetadata(
                    metadata: result.data!["wallet"]["metadata"],
                  );

                  List<Signer> signers = [];

                  for (var signer in result.data!["wallet"]["signers"]) {
                    signers.add(asSigner(ownerData: signer));
                  }

                  // log(signerMetamaskWallet.accounts[0]);
                  // log()

                  Signer userSigner = signers.firstWhere(
                    (element) {
                      return element.address == signerAddress.toLowerCase();
                    },
                  );

                  String userSignerDelegatedTo = "";
                  if (userSigner.delegateTo != null) {
                    userSignerDelegatedTo =
                        "0x${userSigner.delegateTo!.split("0x")[2]}";
                  }

                  //
                  return SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
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

                        // Items

                        // Metadata
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25.0,
                            vertical: 12.0,
                          ),
                          child: NeuBox(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SizedBox(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      walletMetadata.title,
                                      style: const TextStyle(
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      maxLines: 1,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      walletMetadata.description,
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      maxLines: 7,
                                      textAlign: TextAlign.justify,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Delegation Details

                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25.0,
                            vertical: 12.0,
                          ),
                          child: NeuBox(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SizedBox(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Delegated to",
                                      style: TextStyle(
                                        fontSize: 19.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    if (userSignerDelegatedTo.isNotEmpty)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 8.0,
                                        ),
                                        child: Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              child: CustomBlockie(
                                                size: 24,
                                                data: userSignerDelegatedTo,
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            Flexible(
                                              child: Text(
                                                userSignerDelegatedTo,
                                                style: const TextStyle(
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w400,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                maxLines: 1,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    else
                                      const Text(
                                        "NOT DELEGATED",
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),

                        // Signers

                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25.0,
                            vertical: 12.0,
                          ),
                          child: NeuBox(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SizedBox(
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Signers",
                                      style: TextStyle(
                                        fontSize: 19.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 8.0,
                                          ),
                                          child: Row(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                child: CustomBlockie(
                                                  size: 24,
                                                  data: signers[index].address,
                                                ),
                                              ),
                                              const SizedBox(width: 12),
                                              Flexible(
                                                child: Text(
                                                  signers[index].address,
                                                  style: const TextStyle(
                                                    fontSize: 14.0,
                                                    fontWeight: FontWeight.w400,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                  maxLines: 1,
                                                ),
                                              ),
                                              if (ownerData.address ==
                                                  signers[index].address)
                                                const Text(
                                                  "(Owner)",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                            ],
                                          ),
                                        );
                                      },
                                      shrinkWrap: true,
                                      itemCount: signers.length,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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
