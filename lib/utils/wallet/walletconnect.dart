import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:multisig_wallet_with_delegation/constants/keys.dart';
import 'package:multisig_wallet_with_delegation/utils/modals/wallet.dart';
import 'package:multisig_wallet_with_delegation/utils/wallet/walletconnect_connector.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';

Future<String> connectWallet() async {
  late SessionStatus sessionStatus;
  Box walletBox = Hive.box<Wallet>('walletBox');

  // Subscribe to events
  connector.on('connect', (session) {
    if (kDebugMode) {
      print("connect: $session");
      print("Address: ${sessionStatus.accounts[0]}");
      print("Chain Id: ${sessionStatus.chainId}");
    }

    walletBox.put(
      primaryWalletKey,
      Wallet(
        chainId: sessionStatus.chainId,
        accounts: sessionStatus.accounts,
        networkId: sessionStatus.networkId,
        rpcUrl: sessionStatus.rpcUrl,
      ),
    );
  });

  connector.on('session_request', (payload) {
    if (kDebugMode) {
      print("session request: $payload");
    }
  });

  connector.on('disconnect', (session) {
    if (kDebugMode) {
      print("disconnect: $session");
    }

    walletBox.delete(primaryWalletKey);
  });

  // Create a new session
  if (!connector.connected) {
    sessionStatus = await connector.createSession(
      chainId: 1,
      onDisplayUri: (uri) {
        _launchURL(uri);
      },
    );
  }

  return sessionStatus.toString();
}

_launchURL(String uri) async {
  Uri url = Uri.parse(uri);

  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    if (kDebugMode) {
      print('Could not launch $url');
    }
  }
}
