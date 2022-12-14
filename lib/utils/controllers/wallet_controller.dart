import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';
import 'package:multisig_wallet_with_delegation/constants/keys.dart';
import 'package:multisig_wallet_with_delegation/constants/konstants.dart';
import 'package:multisig_wallet_with_delegation/contracts/WalletCreator.g.dart';
import 'package:multisig_wallet_with_delegation/utils/modals/private_key.dart';
import 'package:web3dart/web3dart.dart';

void createWallet() async {
  // https://coinsbench.com/flutter-web3-smart-contract-interaction-in-dart-5669595a0068

  final client = Web3Client(kRpcUrl, Client());

  Box privateKeyBox = Hive.box<PrivateKey>('privateKeyBox');

  String privateKey = privateKeyBox.get(privateKeyHiveKey);

  final credentials = EthPrivateKey.fromHex(privateKey);

  final walletCreator = WalletCreator(
    address:
        EthereumAddress.fromHex("0x9355F2206BD3c2d199aD88F0F56766c86851A9a3"),
    client: client,
    chainId: 80001,
  );

  await walletCreator.createWallet("", "", credentials: credentials);
}
