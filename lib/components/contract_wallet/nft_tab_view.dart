import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:multisig_wallet_with_delegation/components/blockies/custom_blockie.dart';
import 'package:multisig_wallet_with_delegation/components/general/neu_box.dart';
import 'package:multisig_wallet_with_delegation/utils/modals/token_types.dart';

class NftTabView extends StatefulWidget {
  const NftTabView({
    super.key,
    required this.erc721Tokens,
    required this.erc1155Tokens,
  });

  @override
  State<NftTabView> createState() => _NftTabViewState();

  final List<ERC721Token> erc721Tokens;
  final List<ERC1155Token> erc1155Tokens;
}

class _NftTabViewState extends State<NftTabView> {
  @override
  Widget build(BuildContext context) {
    log(widget.erc1155Tokens.toString());

    if (widget.erc721Tokens.length + widget.erc1155Tokens.length == 0) {
      return Expanded(
        child: Center(
          child: Text(
            "No NFTs Available".toUpperCase().split('').join(" "),
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 15.0,
            ),
          ),
        ),
      );
    }

    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.45,
      ),
      itemCount: widget.erc721Tokens.length + widget.erc1155Tokens.length,
      itemBuilder: (BuildContext context, int index) {
        bool is721 = index < widget.erc721Tokens.length;

        ERC721Token? nft721 = is721 ? widget.erc721Tokens[index] : null;
        ERC1155Token? nft1155 = is721
            ? null
            : widget.erc1155Tokens[index - widget.erc721Tokens.length];

        return Padding(
          padding: const EdgeInsets.all(14.0),
          child: InkWell(
            onTap: () {},
            child: NeuBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 140,
                    height: 140,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.network(
                          is721 ? nft721!.url : nft1155!.url,
                          errorBuilder: (context, error, stackTrace) {
                            return CustomBlockie(
                              size: 140,
                              data: is721
                                  ? (nft721!.contractAddr +
                                      nft721.tokenId.toString())
                                  : (nft1155!.contractAddr +
                                      nft1155.tokenId.toString()),
                            );
                          },
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 12.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          is721 ? nft721!.contractName : nft1155!.contractName,
                          style: Theme.of(context).textTheme.titleLarge,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          is721 ? nft721!.nftName : nft1155!.nftName,
                          style: Theme.of(context).textTheme.bodySmall,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "#${is721 ? nft721!.tokenId.toString() : nft1155!.tokenId.toString()}",
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
          ),
        );
      },
    );
  }
}
