import 'package:hive_flutter/hive_flutter.dart';
import 'package:multisig_wallet_with_delegation/constants/keys.dart';
import 'package:multisig_wallet_with_delegation/utils/modals/wallet.dart';
import 'package:multisig_wallet_with_delegation/utils/wallet/walletconnect_connector.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';

Future<void> checkWalletConnection() async {
  Box walletBox = Hive.box<Wallet>('walletBox');

  if (connector.connected) {
    SessionStatus sessionStatus = connector.session as SessionStatus;

    walletBox.put(
      primaryWalletKey,
      Wallet(
        chainId: sessionStatus.chainId,
        accounts: sessionStatus.accounts,
        networkId: sessionStatus.networkId,
        rpcUrl: sessionStatus.rpcUrl,
      ),
    );
  } else {
    walletBox.delete(primaryWalletKey);
  }
}
