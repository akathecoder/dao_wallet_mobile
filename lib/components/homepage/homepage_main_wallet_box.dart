import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:multisig_wallet_with_delegation/components/blockies/custom_blockie.dart';
import 'package:multisig_wallet_with_delegation/components/general/neu_box.dart';

class HomepageMainWalletBox extends StatelessWidget {
  const HomepageMainWalletBox({
    super.key,
    required this.walletAddress,
    required this.name,
    required this.role,
    required this.remarks,
  });

  final String walletAddress;
  final String name;
  final String role;
  final String remarks;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: NeuBox(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  CustomBlockie(
                    size: 128,
                    data: walletAddress.toLowerCase(),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          role,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          remarks,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                            color: Colors.black45,
                          ),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: NeuBox(
            child: Tooltip(
              message: "Copy to clipboard",
              child: TextButton(
                onPressed: () async {
                  await Clipboard.setData(
                    ClipboardData(text: walletAddress),
                  ).then(
                    (value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Wallet address copied to clipboard"),
                        ),
                      );
                    },
                  );
                },
                style: TextButton.styleFrom(
                  splashFactory: NoSplash.splashFactory,
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.copy,
                      color: Colors.black54,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Text(
                        walletAddress,
                        style: const TextStyle(
                          color: Colors.black54,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
