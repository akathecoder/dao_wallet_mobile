import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:multisig_wallet_with_delegation/components/blockies/custom_blockie.dart';
import 'package:multisig_wallet_with_delegation/components/general/neu_box.dart';
import 'package:multisig_wallet_with_delegation/screens/token_screen.dart';
import 'package:multisig_wallet_with_delegation/utils/modals/token_types.dart';

class CryptoTabView extends StatefulWidget {
  const CryptoTabView({
    super.key,
    required this.erc20Tokens,
    required this.walletAddress,
  });

  @override
  State<CryptoTabView> createState() => _CryptoTabViewState();

  final List<ERC20Token> erc20Tokens;
  final String walletAddress;
}

class _CryptoTabViewState extends State<CryptoTabView> {
  @override
  Widget build(BuildContext context) {
    if (widget.erc20Tokens.isEmpty) {
      return Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                "No Tokens Available".toUpperCase().split('').join(" "),
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ],
      );
    }

    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.45,
      ),
      itemCount: widget.erc20Tokens.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(14.0),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                TokenScreen.id,
                arguments: TokenScreenArguments(
                  token: widget.erc20Tokens[index],
                  address: widget.walletAddress,
                ),
              );
            },
            child: NeuBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 140,
                    height: 140,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.network(
                          widget.erc20Tokens[index].logoUrl,
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
                              data: widget.erc20Tokens[index].contractAddr,
                            );
                          },
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.erc20Tokens[index].contractName,
                          style: Theme.of(context).textTheme.titleLarge,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          widget.erc20Tokens[index].contractTickerSymbol,
                          style: Theme.of(context).textTheme.bodySmall,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Balance: ${widget.erc20Tokens[index].balance / math.pow(10, widget.erc20Tokens[index].decimals)}",
                          style: Theme.of(context).textTheme.bodyMedium,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "Locked : ${widget.erc20Tokens[index].lockedBalance / math.pow(10, widget.erc20Tokens[index].decimals)}",
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
