import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:multisig_wallet_with_delegation/utils/data_apis/get_ipfs_url.dart';
import 'package:multisig_wallet_with_delegation/utils/modals/tokens.dart';

class NFT {
  late String name;
  late String description;
  late String image;

  NFT({required this.name, required this.description, required this.image});

  NFT.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    return data;
  }
}

Future<NFT> fetchIPFSNftData({required NftData nft}) async {
  NFT nftFetchedData = NFT(name: "", description: "", image: "");

  if (nft.externalData != null) {
    if (nft.externalData!.name != null ||
        nft.externalData!.description != null ||
        nft.externalData!.image != null) {
      nftFetchedData.name = nft.externalData?.name ?? "";
      nftFetchedData.description = nft.externalData?.description ?? "";
      nftFetchedData.image = nft.externalData?.image ?? "";
    } else if (nft.externalData!.externalUrl != null) {
      http.Response response = await http.get(
        Uri.parse(
          getIpfsUrl(url: nft.externalData!.externalUrl!),
        ),
        headers: {
          "Accept": "application/json",
        },
      );

      if (response.statusCode == 200) {
        nftFetchedData = NFT.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load data');
      }
    }
  }

  return nftFetchedData;
}
