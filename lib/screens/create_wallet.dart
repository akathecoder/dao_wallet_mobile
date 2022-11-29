import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:multisig_wallet_with_delegation/components/general/neu_box.dart';
import 'package:multisig_wallet_with_delegation/constants/keys.dart';
import 'package:multisig_wallet_with_delegation/screens/homepage.dart';
import 'package:multisig_wallet_with_delegation/utils/modals/private_key.dart';
import 'package:web3dart/credentials.dart';
import 'package:web3dart/crypto.dart';

class CreateWallet extends StatefulWidget {
  static String id = "create_wallet_screen";

  const CreateWallet({super.key, required this.title});

  final String title;

  @override
  State<CreateWallet> createState() => _CreateWalletState();
}

enum CurrentState {
  none,
  createWallet,
  importWallet,
}

class _CreateWalletState extends State<CreateWallet> {
  bool isConnecting = false;

  late CurrentState currentState;
  late String ethPrivateKey;
  String mainText = "Wallet not Connected";
  String enteredPrivateKey = "";

  @override
  void initState() {
    super.initState();
    currentState = CurrentState.none;
  }

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
                    mainText.toUpperCase().split('').join(" "),
                    style: const TextStyle(
                      fontSize: 14.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            if (currentState == CurrentState.none)
              buttonsWidget()
            else if (currentState == CurrentState.createWallet)
              createWalletWidget()
            else if (currentState == CurrentState.importWallet)
              importWalletWidget(context),
          ],
        ),
      ),
    );
  }

  Column importWalletWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Private Key',
              hintText: 'Enter Private Key',
            ),
            minLines: 3,
            maxLines: 3,
            onChanged: (value) {
              setState(() {
                enteredPrivateKey = value;
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: 72,
            child: InkWell(
              onTap: () {
                setState(() {
                  ethPrivateKey =
                      createWalletUsingPrivateKey(enteredPrivateKey);
                });
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Homepage.id,
                  (route) => false,
                );
              },
              child: const NeuBox(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Icon(Icons.arrow_forward),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column createWalletWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: InkWell(
            onTap: () async {
              await Clipboard.setData(
                ClipboardData(text: ethPrivateKey),
              ).then(
                (value) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Private Key copied to clipboard"),
                    ),
                  );
                },
              );
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade500,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 18.0,
                  horizontal: 12.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Private Key".toUpperCase().split('').join(" "),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      ethPrivateKey,
                    ),
                    const Divider(
                      color: Colors.grey,
                      thickness: 1.0,
                      height: 20,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.copy,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 12.0),
                        Text("Click to copy to Clipboard"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: 72,
            child: InkWell(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Homepage.id,
                  (route) => false,
                );
              },
              child: const NeuBox(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Icon(Icons.arrow_forward),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buttonsWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: InkWell(
              onTap: () async {
                setState(() {
                  currentState = CurrentState.createWallet;
                  ethPrivateKey = createWallet();
                  mainText = "Wallet Created";
                });
              },
              child: const NeuBox(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    "Create Wallet",
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
        ),
        const Text("O R"),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: InkWell(
              onTap: () async {
                setState(() {
                  currentState = CurrentState.importWallet;
                  mainText = "Enter Private Key";
                });
              },
              child: const NeuBox(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Text(
                    "Import Wallet",
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
        ),
      ],
    );
  }

  String createWallet() {
    Box privateKeyBox = Hive.box<PrivateKey>('privateKeyBox');

    var rng = math.Random.secure();
    EthPrivateKey randomKey = EthPrivateKey.createRandom(rng);

    privateKeyBox.put(
      privateKeyHiveKey,
      PrivateKey(
        privateKey: bytesToHex(randomKey.privateKey),
      ),
    );

    return bytesToHex(randomKey.privateKey);
  }

  String createWalletUsingPrivateKey(String privateKey) {
    Box privateKeyBox = Hive.box<PrivateKey>('privateKeyBox');

    EthPrivateKey randomKey = EthPrivateKey.fromHex(privateKey);

    privateKeyBox.put(
      privateKeyHiveKey,
      PrivateKey(
        privateKey: bytesToHex(randomKey.privateKey),
      ),
    );

    return bytesToHex(randomKey.privateKey);
  }
}
