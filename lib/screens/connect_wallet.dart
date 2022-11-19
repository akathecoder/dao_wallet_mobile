import 'package:flutter/material.dart';
import 'package:multisig_wallet_with_delegation/components/general/neu_box.dart';
import 'package:multisig_wallet_with_delegation/utils/wallet/walletconnect.dart';

class ConnectWallet extends StatefulWidget {
  static String id = "connect_wallet_screen";

  const ConnectWallet({super.key, required this.title});

  final String title;

  @override
  State<ConnectWallet> createState() => _ConnectWalletState();
}

class _ConnectWalletState extends State<ConnectWallet> {
  bool isConnecting = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.title.toUpperCase().split('').join(" "),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      'assets/images/metamask_icon.png',
                      color: Colors.grey[700],
                    ),
                  ),
                  Text(
                    isConnecting
                        ? "Metamask is connecting . . ."
                            .toUpperCase()
                            .split('')
                            .join(" ")
                        : "Metamask not connected"
                            .toUpperCase()
                            .split('')
                            .join(" "),
                    style: const TextStyle(
                      fontSize: 14.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                onTap: () async {
                  if (isConnecting) return;

                  setState(() {
                    isConnecting = true;
                  });

                  connectWallet().then((value) {
                    //
                  });
                },
                child: const NeuBox(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      "Connect Wallet",
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
