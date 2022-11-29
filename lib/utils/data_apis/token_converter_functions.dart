import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:multisig_wallet_with_delegation/utils/data_apis/fetch_ipfs_nft_data.dart';
import 'package:multisig_wallet_with_delegation/utils/graphql/gql_client.dart';
import 'package:multisig_wallet_with_delegation/utils/modals/token_types.dart';
import 'package:multisig_wallet_with_delegation/utils/modals/tokens.dart';

Future<ERC20Token?> asERC20Token({
  required String walletAddress,
  required Items tokenData,
}) async {
  String id = tokenData.nativeToken != null
      ? "${walletAddress.toLowerCase()}0x0000000000000000000000000000000000000000"
      : walletAddress.toLowerCase() + tokenData.contractAddress!.toLowerCase();

  String gqlQuery = """
    query Query(\$id: String!){
      erc20LockedBalance(id : "\$id"){
        id
        contractAddr
        lockedBalance
      }
    }
  """;

  QueryOptions<Object?> queryOptions = QueryOptions(
    document: gql(gqlQuery),
    variables: {
      "id": id,
    },
  );

  QueryResult<Object?> result = await gqlClient.query(queryOptions);

  if (result.hasException) {
    log(result.exception.toString());
    return null;
  }

  final Map<String, dynamic>? graphData = result.data;

  ERC20Token erc20token = ERC20Token(
    balance: tokenData.balance != null ? int.parse(tokenData.balance!) : 0,
    lockedBalance: graphData?["erc20LockedBalance"] != null
        ? graphData!["erc20LockedBalance"]["lockedBalance"]
        : 0,
    contractName: tokenData.contractName ?? "",
    contractTickerSymbol: tokenData.contractTickerSymbol ?? "",
    // contractAddr: tokenData.contractAddress ?? "",
    contractAddr: tokenData.nativeToken == true
        ? "0x0000000000000000000000000000000000000000"
        : tokenData.contractAddress!.toLowerCase(),
    logoUrl: tokenData.logoUrl ?? "",
    decimals: tokenData.contractDecimals ?? 0,
    quoteRate: tokenData.quoteRate?.toInt() ?? 0,
  );

  return erc20token;
}

Future<List<ERC721Token>> asERC721Token({
  required String walletAddress,
  required Items tokenData,
}) async {
  List<ERC721Token> erc721Tokens = [];

  if (tokenData.nftData == null) {
    return erc721Tokens;
  }

  for (NftData nft in tokenData.nftData!) {
    if (tokenData.contractAddress == null || nft.tokenId == null) {
      continue;
    }

    String gqlQuery = """
    query Query(\$id: String!){
      erc721LockedBalance(id : \$id){
        id
        contractAddr
        tokenId
        lockedBool
      }
    }
    """;

    QueryOptions<Object?> queryOptions = QueryOptions(
      document: gql(gqlQuery),
      variables: {
        "id": walletAddress.toLowerCase() +
            tokenData.contractAddress!.toLowerCase() +
            nft.tokenId!,
      },
    );

    QueryResult<Object?> result = await gqlClient.query(queryOptions);

    if (result.hasException) {
      log(result.exception.toString());
      continue;
    }

    final Map<String, dynamic>? graphData = result.data;

    NFT nftData = await fetchIPFSNftData(nft: nft);

    ERC721Token erc721token = ERC721Token(
      contractName: tokenData.contractName ?? "",
      contractTickerSymbol: tokenData.contractTickerSymbol ?? "",
      contractAddr: tokenData.contractAddress ?? "",
      locked: graphData?["erc721LockedBalance"] != null
          ? graphData!["erc721LockedBalance"]["lockedBool"]
          : false,
      tokenId: nft.tokenId != null ? int.parse(nft.tokenId!) : 0,
      nftName: nftData.name,
      description: nftData.description,
      url: nftData.image,
    );

    erc721Tokens.add(erc721token);
  }

  return erc721Tokens;
}

Future<List<ERC1155Token>> asERC1155Token({
  required String walletAddress,
  required Items tokenData,
}) async {
  List<ERC1155Token> erc1155Tokens = [];

  if (tokenData.nftData == null) {
    return erc1155Tokens;
  }

  for (NftData nft in tokenData.nftData!) {
    if (tokenData.contractAddress == null || nft.tokenId == null) {
      continue;
    }

    String gqlQuery = """
    query Query(\$id: String!){
      erc1155LockedBalance(id : \$id){
        id
        contractAddr
        tokenId
        lockedBalance
      }
    }
    """;

    QueryOptions<Object?> queryOptions = QueryOptions(
      document: gql(gqlQuery),
      variables: {
        "id": walletAddress.toLowerCase() +
            tokenData.contractAddress!.toLowerCase() +
            nft.tokenId!,
      },
    );

    QueryResult<Object?> result = await gqlClient.query(queryOptions);

    if (result.hasException) {
      log(result.exception.toString());
      continue;
    }

    final Map<String, dynamic>? graphData = result.data;

    NFT nftData = await fetchIPFSNftData(nft: nft);

    ERC1155Token erc721token = ERC1155Token(
      contractName: tokenData.contractName ?? "",
      contractTickerSymbol: tokenData.contractTickerSymbol ?? "",
      contractAddr: tokenData.contractAddress ?? "",
      lockedBalance: graphData?["erc1155LockedBalance"] != null
          ? graphData!["erc1155LockedBalance"]["lockedBalance"]
          : 0,
      tokenBalance: nft.tokenBalance != null ? int.parse(nft.tokenBalance!) : 0,
      tokenId: nft.tokenId != null ? int.parse(nft.tokenId!) : 0,
      nftName: nftData.name,
      description: nftData.description,
      url: nftData.image,
    );

    erc1155Tokens.add(erc721token);
  }

  return erc1155Tokens;
}
