import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';
import 'package:multisig_wallet_with_delegation/constants/keys.dart';
import 'package:multisig_wallet_with_delegation/constants/konstants.dart';
import 'package:multisig_wallet_with_delegation/contracts/MultisigWallet.g.dart';
import 'package:multisig_wallet_with_delegation/utils/modals/private_key.dart';
import 'package:web3dart/web3dart.dart';

Future<void> approveERC20Transaction({
  required String address,
  required BigInt txnId,
}) async {
  final client = Web3Client(kRpcUrl, Client());

  Box privateKeyBox = Hive.box<PrivateKey>('privateKeyBox');

  String privateKey = privateKeyBox.get(privateKeyHiveKey);

  final credentials = EthPrivateKey.fromHex(privateKey);

  final multisigWallet = MultisigWallet(
    address: EthereumAddress.fromHex(address),
    client: client,
    chainId: kChainId,
  );

  String result = await multisigWallet.approveERC20Transaction(
    txnId,
    credentials: credentials,
  );

  log(result);
}

Future<void> disapproveERC20Transaction({
  required String address,
  required BigInt txnId,
}) async {
  final client = Web3Client(kRpcUrl, Client());

  Box privateKeyBox = Hive.box<PrivateKey>('privateKeyBox');

  String privateKey = privateKeyBox.get(privateKeyHiveKey);

  final credentials = EthPrivateKey.fromHex(privateKey);

  final multisigWallet = MultisigWallet(
    address: EthereumAddress.fromHex(address),
    client: client,
    chainId: kChainId,
  );

  String result = await multisigWallet.disapproveERC20Trasaction(
    txnId,
    credentials: credentials,
  );

  log(result);
}
