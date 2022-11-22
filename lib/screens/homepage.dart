import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:multisig_wallet_with_delegation/components/general/loading_screen_with_circular_progress_indicator.dart';
import 'package:multisig_wallet_with_delegation/components/homepage/homepage_appbar.dart';
import 'package:multisig_wallet_with_delegation/components/homepage/homepage_main_wallet_box.dart';
import 'package:multisig_wallet_with_delegation/components/homepage/wallet_card.dart';
import 'package:multisig_wallet_with_delegation/constants/keys.dart';
import 'package:multisig_wallet_with_delegation/screens/connect_wallet.dart';
import 'package:multisig_wallet_with_delegation/utils/graphql/homepage_wallet_details_query.dart';
import 'package:multisig_wallet_with_delegation/utils/modals/wallet.dart';

class Homepage extends StatefulWidget {
  static String id = "homepage";

  const Homepage({super.key, required this.title});

  final String title;

  @override
  State<Homepage> createState() => _HomePageState();
}

class _HomePageState extends State<Homepage> {
  late String signerAddress;

  // getTokenData(walletAddress: walletAddress, chainId: chainId).then((value) {
  //     setState(() {
  //       tokens = value;
  //     });
  //   });

  // Future<void> fetchData() async {
  //   QueryResult<Object?> result = await gqlClient.query(QueryOptions(
  //     document: gql(homepageWalletDetailsQuery),
  //     variables: {
  //       'signerAddress': signerAddress.toLowerCase(),
  //     },
  //   ));

  //   final Map<String, dynamic>? graphData = result.data;

  //   if (kDebugMode) {
  //     print("==========================================");
  //     print(graphData);
  //     print("==========================================");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable:
          Hive.box<Wallet>('walletBox').listenable(keys: [primaryWalletKey]),
      builder: (BuildContext context, Box<Wallet> box, Widget? child) {
        Wallet? signerMetamaskWallet = box.get(primaryWalletKey);

        if (signerMetamaskWallet == null) {
          return ConnectWallet(title: widget.title);
        } else {
          signerAddress = signerMetamaskWallet.accounts[0];

          if (kDebugMode) {
            print(signerAddress);
          }

          // fetchData();

          return Query(
            options: QueryOptions(
              document: gql(homepageWalletDetailsQuery),
              variables: {
                'signerAddress': signerAddress.toLowerCase(),
              },
            ),
            builder: (
              QueryResult<Object?> result, {
              Future<QueryResult<Object?>> Function(FetchMoreOptions)?
                  fetchMore,
              Future<QueryResult<Object?>?> Function()? refetch,
            }) {
              if (result.hasException) {
                if (kDebugMode) {
                  print(result.exception.toString());
                }
                return Text(result.exception.toString());
              }

              if (result.isLoading) {
                return LoadingScreenWithCircularProgressIndicator(
                  title: widget.title,
                  text: "Fetching data . . .",
                );
              }

              // if (kDebugMode) {
              //   print("==========================================");
              //   print(result.data?['wallets']);
              //   print("==========================================");
              // }

              if (result.data?['wallets'] == null) {
                return const Text("Error");
              }

              final List signerData = result.data!['wallets'] as List;

              return Scaffold(
                backgroundColor: Colors.grey[300],
                body: SafeArea(
                  child: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      const SliverToBoxAdapter(
                        child: SizedBox(height: 10),
                      ),
                      SliverToBoxAdapter(
                        child: HomepageAppBar(title: widget.title),
                      ),
                      const SliverToBoxAdapter(
                        child: SizedBox(height: 25),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: HomepageMainWalletBox(
                            signerAddress: signerAddress,
                            name: "Sparsh Agarwal",
                            role: "Web3 Developer",
                            remarks: "Lorem Ipsum",
                            // name: walletData['owner']['metadata']['name'],
                            // role: walletData['owner']['metadata']['role'],
                            // remarks: walletData['owner']['metadata']['remarks'],
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25.0,
                            vertical: 8.0,
                          ),
                          child: Text(
                            "Wallets".toUpperCase().split('').join(" "),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      const SliverToBoxAdapter(
                        child: SizedBox(height: 14),
                      ),

                      // Grid of Cards
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        sliver: SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              return WalletCard(
                                address: signerData[index]["id"],
                                name: signerData[index]["metadata"]["title"],
                              );
                            },
                            childCount: signerData.length,
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1 / 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
