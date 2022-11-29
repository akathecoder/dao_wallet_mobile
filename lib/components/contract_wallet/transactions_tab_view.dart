import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:multisig_wallet_with_delegation/components/general/neu_box.dart';
import 'package:multisig_wallet_with_delegation/screens/transaction_detail_screen.dart';
import 'package:multisig_wallet_with_delegation/utils/data_apis/transactions_converter_functions.dart';
import 'package:multisig_wallet_with_delegation/utils/graphql/transactions_tab_query.dart';
import 'package:multisig_wallet_with_delegation/utils/modals/token_types.dart';

class TransactionsTabView extends StatefulWidget {
  const TransactionsTabView({super.key, required this.walletAddress});

  @override
  State<TransactionsTabView> createState() => _TransactionsTabViewState();

  final String walletAddress;
}

class _TransactionsTabViewState extends State<TransactionsTabView> {
  @override
  Widget build(BuildContext context) {
    return Query(
      options: QueryOptions(
        document: gql(transactionsTabQuery),
        variables: {
          "walletAddress": widget.walletAddress.toLowerCase(),
        },
      ),
      builder: (QueryResult<Object?> result,
          {Future<QueryResult<Object?>> Function(FetchMoreOptions)? fetchMore,
          Future<QueryResult<Object?>?> Function()? refetch}) {
        if (result.hasException) {
          if (kDebugMode) {
            print(result.exception.toString());
          }
          return Text(result.exception.toString());
        }

        if (result.isLoading) {
          return const Center(
            child: Text("Loading . . ."),
          );
        }

        // if (kDebugMode) {
        //   print("==========================================");
        //   log(result.data!["wallet"].toString());
        //   print("==========================================");
        // }

        List<ERCTransaction> transactions = [];

        List<ERC20Transaction> erc20Transactions = asERC20Transactions(
          transactionsData: result.data!["wallet"]["erc20Transactions"],
        );

        for (var txn in erc20Transactions) {
          transactions.add(txn.asERCTransaction());
        }

        List<ERC721Transaction> erc721Transactions = asERC721Transactions(
          transactionsData: result.data!["wallet"]["erc721Transactions"],
        );

        for (var txn in erc721Transactions) {
          transactions.add(txn.asERCTransaction());
        }

        List<ERC1155Transaction> erc1155Transactions = asERC1155Transactions(
          transactionsData: result.data!["wallet"]["erc721Transactions"],
        );

        for (var txn in erc1155Transactions) {
          transactions.add(txn.asERCTransaction());
        }

        transactions.sort(
          (a, b) => int.parse(a.txnId) - int.parse(b.txnId),
        );

        if (transactions.isEmpty) {
          return Expanded(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("No Transactions"),
                  IconButton(
                    onPressed: () {
                      if (refetch != null) {
                        refetch();
                      }
                    },
                    icon: const Icon(Icons.refresh),
                  ),
                ],
              ),
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            if (refetch != null) {
              refetch();
            }
          },
          child: ListView.builder(
            itemBuilder: (context, index) {
              Icon txnStatusIcon;

              switch (transactions[index].txnStatus) {
                case "EXECUTED":
                  txnStatusIcon = const Icon(
                    Icons.done,
                    color: Colors.green,
                  );
                  break;
                case "WAITING_APPROVAL":
                  txnStatusIcon = const Icon(
                    Icons.hourglass_top,
                    color: Colors.orange,
                  );
                  break;
                case "CANCELLED":
                  txnStatusIcon = const Icon(
                    Icons.close,
                    color: Colors.red,
                  );
                  break;
                default:
                  txnStatusIcon = const Icon(
                    Icons.error,
                    color: Colors.redAccent,
                  );
              }

              Text txnTitle;

              switch (transactions[index].type) {
                case ERCTransactionType.erc20:
                  txnTitle = Text(
                    (transactions[index].amount! / math.pow(10, 18)).toString(),
                  );
                  break;

                case ERCTransactionType.erc721:
                  txnTitle = Text("ERC721 #${transactions[index].tokenId}");
                  break;

                case ERCTransactionType.erc1155:
                  txnTitle = txnTitle = Text(
                    "ERC1155 #${transactions[index].tokenId} - ${transactions[index].amount}",
                  );
                  break;
                default:
                  txnTitle = const Text("Error");
              }

              return InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    TransactionDetailScreen.id,
                    arguments: TransactionDetailScreenArguments(
                      transaction: transactions[index],
                      walletAddress: widget.walletAddress,
                      refetch: refetch,
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 8.0),
                  child: NeuBox(
                    child: ListTile(
                      title: txnTitle,
                      leading: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "# ${transactions[index].txnId}",
                            style: const TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          txnStatusIcon,
                        ],
                      ),
                      subtitle: Text(transactions[index].to.toString()),
                      isThreeLine: true,
                    ),
                  ),
                ),
              );
            },
            itemCount: transactions.length,
            physics: const AlwaysScrollableScrollPhysics(),
          ),
        );
      },
    );
  }
}
