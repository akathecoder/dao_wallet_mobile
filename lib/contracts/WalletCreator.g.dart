// Generated code, do not modify. Run `build_runner build` to re-generate!
// @dart=2.12
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:web3dart/web3dart.dart' as _i1;

final _contractAbi = _i1.ContractAbi.fromJson(
  '[{"inputs":[],"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"ownerAddress","type":"address"},{"indexed":true,"internalType":"address","name":"walletAddress","type":"address"},{"indexed":false,"internalType":"string","name":"walletCid","type":"string"},{"indexed":false,"internalType":"string","name":"ownerCid","type":"string"}],"name":"WalletCreated","type":"event"},{"inputs":[{"internalType":"string","name":"walletCid_","type":"string"},{"internalType":"string","name":"ownerCid_","type":"string"}],"name":"createWallet","outputs":[],"stateMutability":"nonpayable","type":"function"}]',
  'WalletCreator',
);

class WalletCreator extends _i1.GeneratedContract {
  WalletCreator({
    required _i1.EthereumAddress address,
    required _i1.Web3Client client,
    int? chainId,
  }) : super(
          _i1.DeployedContract(
            _contractAbi,
            address,
          ),
          client,
          chainId,
        );

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> createWallet(
    String walletCid_,
    String ownerCid_, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[1];
    assert(checkSignature(function, '81277079'));
    final params = [
      walletCid_,
      ownerCid_,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// Returns a live stream of all WalletCreated events emitted by this contract.
  Stream<WalletCreated> walletCreatedEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('WalletCreated');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return WalletCreated(decoded);
    });
  }
}

class WalletCreated {
  WalletCreated(List<dynamic> response)
      : ownerAddress = (response[0] as _i1.EthereumAddress),
        walletAddress = (response[1] as _i1.EthereumAddress),
        walletCid = (response[2] as String),
        ownerCid = (response[3] as String);

  final _i1.EthereumAddress ownerAddress;

  final _i1.EthereumAddress walletAddress;

  final String walletCid;

  final String ownerCid;
}
