import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:multisig_wallet_with_delegation/components/blockies/custom_blockie.dart';
import 'package:multisig_wallet_with_delegation/components/general/neu_box.dart';
import 'package:multisig_wallet_with_delegation/constants/keys.dart';
import 'package:multisig_wallet_with_delegation/constants/konstants.dart';
import 'package:multisig_wallet_with_delegation/screens/create_wallet.dart';
import 'package:multisig_wallet_with_delegation/utils/controllers/erc1155_transaction_controller.dart';
import 'package:multisig_wallet_with_delegation/utils/controllers/erc20_transaction_controller.dart';
import 'package:multisig_wallet_with_delegation/utils/controllers/erc721_transaction_controller.dart';
import 'package:multisig_wallet_with_delegation/utils/modals/private_key.dart';
import 'package:multisig_wallet_with_delegation/utils/modals/token_types.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web3dart/credentials.dart';

class TransactionDetailScreenArguments {
  const TransactionDetailScreenArguments({
    required this.transaction,
    required this.walletAddress,
    this.refetch,
  });

  final ERCTransaction transaction;
  final String walletAddress;
  final Future<QueryResult<Object?>?> Function()? refetch;
}

class TransactionDetailScreen extends StatefulWidget {
  static String id = "transaction_detail_screen";

  const TransactionDetailScreen({super.key});

  final String title = "Transaction";

  @override
  State<TransactionDetailScreen> createState() =>
      _TransactionDetailScreenState();
}

class _TransactionDetailScreenState extends State<TransactionDetailScreen> {
  late String signerAddress;

  bool isApprovedByUser(TransactionDetailScreenArguments args) {
    bool isApprovedBy = false;

    if (args.transaction.approvedBy.isNotEmpty) {
      if (args.transaction.approvedBy.contains(signerAddress)) {
        isApprovedBy = true;
      }
    }

    if (args.transaction.disapprovedBy.isNotEmpty) {
      if (args.transaction.disapprovedBy.contains(signerAddress)) {
        isApprovedBy = true;
      }
    }

    return isApprovedBy;
  }

  _launchURL(String uri) async {
    Uri url = Uri.parse(uri);

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      if (kDebugMode) {
        print('Could not launch $url');
      }
    }
  }

  showApprovalSnackBar(String? txnId) {
    if (txnId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Some Error Occured"),
          backgroundColor: Colors.red,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text("Transaction successfully executed"),
          action: SnackBarAction(
            label: "Show",
            onPressed: () {
              _launchURL(blockExplorerEndpoint + txnId);
            },
          ),
        ),
      );
    }

    Future.delayed(const Duration(milliseconds: 2000), () {
      Navigator.pop(context);
    });
  }

  handleApprove(TransactionDetailScreenArguments args) {
    if (args.transaction.type == ERCTransactionType.erc20) {
      approveERC20Transaction(
        address: args.walletAddress,
        txnId: BigInt.parse(args.transaction.txnId),
      ).then((value) => showApprovalSnackBar(value));
    } else if (args.transaction.type == ERCTransactionType.erc721) {
      approveERC721Transaction(
        address: args.walletAddress,
        txnId: BigInt.parse(args.transaction.txnId),
      );
    } else if (args.transaction.type == ERCTransactionType.erc1155) {
      approveERC1155Transaction(
        address: args.walletAddress,
        txnId: BigInt.parse(args.transaction.txnId),
      );
    }
  }

  handleDisapprove(TransactionDetailScreenArguments args) {
    if (args.transaction.type == ERCTransactionType.erc20) {
      disapproveERC20Transaction(
        address: args.walletAddress,
        txnId: BigInt.parse(args.transaction.txnId),
      ).then((value) => showApprovalSnackBar(value));
    } else if (args.transaction.type == ERCTransactionType.erc721) {
      disapproveERC721Transaction(
        address: args.walletAddress,
        txnId: BigInt.parse(args.transaction.txnId),
      );
    } else if (args.transaction.type == ERCTransactionType.erc1155) {
      disapproveERC1155Transaction(
        address: args.walletAddress,
        txnId: BigInt.parse(args.transaction.txnId),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as TransactionDetailScreenArguments;

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
                child: RefreshIndicator(
                  onRefresh: () async {
                    if (args.refetch != null) {
                      args.refetch!();
                    }
                  },
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        AppBar(
                            title:
                                "${widget.title} #${args.transaction.txnId}"),

                        //  Space
                        const SizedBox(height: 24),

                        InfoCard(
                          subject: "ID",
                          information: args.transaction.txnId,
                        ),
                        InfoCard(
                          subject: "To",
                          information: args.transaction.to,
                        ),
                        InfoCard(
                          subject: "Contract Address",
                          information: args.transaction.contractAddr,
                        ),
                        if (args.transaction.tokenId != null)
                          InfoCard(
                            subject: "Token Id",
                            information: args.transaction.tokenId.toString(),
                          ),
                        if (args.transaction.amount != null)
                          InfoCard(
                            subject: "Amount",
                            information: args.transaction.amount.toString(),
                          ),
                        InfoCard(
                          subject: "Txn Status",
                          information: args.transaction.txnStatus,
                        ),
                        if (args.transaction.executedOn != null)
                          InfoCard(
                            subject: "Executed On",
                            information: args.transaction.executedOn.toString(),
                          ),
                        InfoCard(
                          subject: "Created By",
                          information: args.transaction.createdBy,
                        ),
                        InfoCard(
                          subject: "Created On",
                          information: args.transaction.createdOn,
                        ),

                        //  Space
                        SignersCard(
                          signers: args.transaction.approvedBy,
                          title: "Approved By",
                        ),

                        SignersCard(
                          signers: args.transaction.disapprovedBy,
                          title: "Disapproved By",
                        ),

                        // Space
                        if (!isApprovedByUser(args))
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 28.0,
                              vertical: 12.0,
                            ),
                            child: NeuBox(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12.0,
                                  vertical: 8.0,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Approve Transaction",
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 18),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: NeuBox(
                                            child: IconButton(
                                              onPressed: () {
                                                handleDisapprove(args);
                                              },
                                              icon: const Icon(Icons.cancel),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 12.0),
                                        Expanded(
                                          child: NeuBox(
                                            child: IconButton(
                                              onPressed: () {
                                                handleApprove(args);
                                              },
                                              icon: const Icon(Icons.check),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        });
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.subject,
    required this.information,
  }) : super(key: key);

  final String subject;
  final String information;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 28.0,
        vertical: 12.0,
      ),
      child: NeuBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 8.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  "$subject: ",
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: Text(
                  information,
                  style: const TextStyle(
                    fontSize: 13.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

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
            title.toUpperCase().split('').join(" "),
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

class SignersCard extends StatelessWidget {
  const SignersCard({
    Key? key,
    required this.signers,
    required this.title,
  }) : super(key: key);

  final String title;
  final List<String> signers;
  // final Signer ownerData;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                if (signers.isEmpty)
                  const Text(
                    "No Signers",
                    style: TextStyle(
                      fontSize: 13.0,
                    ),
                  ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: CustomBlockie(
                              size: 24,
                              data: signers[index],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Flexible(
                            child: Text(
                              signers[index],
                              style: const TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                overflow: TextOverflow.ellipsis,
                              ),
                              maxLines: 1,
                            ),
                          ),
                          // if (ownerData.address == signers[index].address)
                          //   const Text(
                          //     "(Owner)",
                          //     style: TextStyle(
                          //       fontWeight: FontWeight.bold,
                          //     ),
                          //   ),
                        ],
                      ),
                    );
                  },
                  shrinkWrap: true,
                  itemCount: signers.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
