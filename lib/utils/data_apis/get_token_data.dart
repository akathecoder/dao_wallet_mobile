import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:multisig_wallet_with_delegation/constants/keys.dart';
import 'package:multisig_wallet_with_delegation/utils/data_apis/token_converter_functions.dart';
import 'package:multisig_wallet_with_delegation/utils/modals/token_types.dart';
import 'package:multisig_wallet_with_delegation/utils/modals/tokens.dart';

Future<Map<dynamic, Object>?> getTokenData({
  required String walletAddress,
  required int chainId,
}) async {
  late List<Items>? allTokens;

  String httpUri =
      "$covalentEndPointUri$chainId/address/$walletAddress/balances_v2/?key=$covalentApiKey&format=json&nft=true&no-nft-fetch=false";

  http.Response response = await http.get(Uri.parse(httpUri));

  if (response.statusCode == 200) {
    allTokens = Tokens.fromJson(jsonDecode(response.body)).data?.items;
    // log(
    //   allTokens.toString(),
    //   name: "getTokenData Log",
    // );
  } else {
    throw Exception('Failed to load data');
  }

  if (allTokens == null) {
    return null;
  }

  List<ERC20Token> erc20Tokens = [];
  List<ERC721Token> erc721Tokens = [];
  List<ERC1155Token> erc1155Tokens = [];

  // TODO: Format the data ::sad_emoji

  for (var token in allTokens) {
    if (token.type == "nft" &&
        token.nftData != null &&
        token.nftData!.isNotEmpty &&
        token.supportsErc != null &&
        token.supportsErc!.isNotEmpty) {
      if (token.supportsErc!.contains("ERC1155")) {
        erc721Tokens.addAll(await asERC721Token(
          walletAddress: walletAddress,
          tokenData: token,
        ));
      } else {
        erc1155Tokens.addAll(await asERC1155Token(
          walletAddress: walletAddress,
          tokenData: token,
        ));
      }
    } else if (token.type == "cryptocurrency" ||
        token.type == "stablecoin" ||
        token.type == "dust") {
      ERC20Token? erc20Token = await asERC20Token(
        walletAddress: walletAddress,
        tokenData: token,
      );
      if (erc20Token != null) {
        erc20Tokens.add(erc20Token);
      }
    }
  }

  return {
    "erc20Tokens": erc20Tokens,
    "erc721Tokens": erc721Tokens,
    "erc1155Tokens": erc1155Tokens,
  };
}
