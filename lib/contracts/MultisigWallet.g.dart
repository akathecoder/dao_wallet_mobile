// Generated code, do not modify. Run `build_runner build` to re-generate!
// @dart=2.12
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data' as _i2;

import 'package:web3dart/web3dart.dart' as _i1;

final _contractAbi = _i1.ContractAbi.fromJson(
  '[{"inputs":[{"internalType":"address","name":"owner","type":"address"}],"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"from","type":"address"},{"indexed":true,"internalType":"address","name":"to","type":"address"}],"name":"Delegate","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"uint256","name":"txnId","type":"uint256"},{"indexed":true,"internalType":"address","name":"approver","type":"address"}],"name":"ERC1155TransactionApproved","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"uint256","name":"txnId","type":"uint256"}],"name":"ERC1155TransactionCancelled","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"uint256","name":"txnId","type":"uint256"},{"indexed":true,"internalType":"address","name":"to","type":"address"},{"indexed":true,"internalType":"address","name":"contractAddr","type":"address"},{"indexed":false,"internalType":"uint256","name":"amount","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"ERC1155TransactionCreated","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"uint256","name":"txnId","type":"uint256"},{"indexed":true,"internalType":"address","name":"disapprover","type":"address"}],"name":"ERC1155TransactionDisapproved","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"uint256","name":"txnId","type":"uint256"}],"name":"ERC1155TransactionExecuted","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"uint256","name":"txnId","type":"uint256"},{"indexed":true,"internalType":"address","name":"approver","type":"address"}],"name":"ERC20TransactionApproved","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"uint256","name":"txnId","type":"uint256"}],"name":"ERC20TransactionCancelled","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"uint256","name":"txnId","type":"uint256"},{"indexed":true,"internalType":"address","name":"to","type":"address"},{"indexed":true,"internalType":"address","name":"contractAddr","type":"address"},{"indexed":false,"internalType":"uint256","name":"amount","type":"uint256"}],"name":"ERC20TransactionCreated","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"uint256","name":"txnId","type":"uint256"},{"indexed":true,"internalType":"address","name":"disapprover","type":"address"}],"name":"ERC20TransactionDisapproved","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"uint256","name":"txnId","type":"uint256"}],"name":"ERC20TransactionExecuted","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"uint256","name":"txnId","type":"uint256"},{"indexed":true,"internalType":"address","name":"approver","type":"address"}],"name":"ERC721TransactionApproved","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"uint256","name":"txnId","type":"uint256"}],"name":"ERC721TransactionCancelled","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"uint256","name":"txnId","type":"uint256"},{"indexed":true,"internalType":"address","name":"to","type":"address"},{"indexed":true,"internalType":"address","name":"contractAddr","type":"address"},{"indexed":false,"internalType":"uint256","name":"tokenId","type":"uint256"}],"name":"ERC721TransactionCreated","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"uint256","name":"txnId","type":"uint256"},{"indexed":true,"internalType":"address","name":"disapprover","type":"address"}],"name":"ERC721TransactionDisapproved","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"uint256","name":"txnId","type":"uint256"}],"name":"ERC721TransactionExecuted","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"previousOwner","type":"address"},{"indexed":true,"internalType":"address","name":"newOwner","type":"address"}],"name":"OwnershipTransferred","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"signer","type":"address"}],"name":"RevokeDelegation","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"signerAddress","type":"address"},{"indexed":false,"internalType":"string","name":"cid","type":"string"},{"indexed":false,"internalType":"int256","name":"txnCap","type":"int256"}],"name":"SignerAdded","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"signer","type":"address"},{"indexed":false,"internalType":"int256","name":"txnCap","type":"int256"}],"name":"SignerTxnCapUpdated","type":"event"},{"stateMutability":"payable","type":"fallback"},{"inputs":[],"name":"_signerCount","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"signer_","type":"address"},{"internalType":"int256","name":"txnCap_","type":"int256"},{"internalType":"string","name":"cid_","type":"string"}],"name":"addSigner","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"txnId_","type":"uint256"}],"name":"approveERC1155Transaction","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"txnId_","type":"uint256"}],"name":"approveERC20Transaction","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"txnId_","type":"uint256"}],"name":"approveERC721Transaction","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"to_","type":"address"},{"internalType":"address","name":"contractAddr_","type":"address"},{"internalType":"uint256","name":"tokenId_","type":"uint256"},{"internalType":"uint256","name":"amount_","type":"uint256"}],"name":"createERC1155Transaction","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"to_","type":"address"},{"internalType":"address","name":"contractAddr_","type":"address"},{"internalType":"uint256","name":"amount_","type":"uint256"}],"name":"createERC20Transaction","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"to_","type":"address"},{"internalType":"address","name":"contractAddr_","type":"address"},{"internalType":"uint256","name":"tokenId_","type":"uint256"}],"name":"createERC721Transaction","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"to_","type":"address"}],"name":"delegate","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"txnId_","type":"uint256"}],"name":"disapproveERC1155Trasaction","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"txnId_","type":"uint256"}],"name":"disapproveERC20Trasaction","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"txnId_","type":"uint256"}],"name":"disapproveERC721Trasaction","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"","type":"address"},{"internalType":"uint256","name":"","type":"uint256"}],"name":"erc1155LockedBalance","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"","type":"uint256"}],"name":"erc1155Transactions","outputs":[{"internalType":"enum MultisigWallet.TxnStatus","name":"status","type":"uint8"},{"internalType":"address","name":"to","type":"address"},{"internalType":"address","name":"contractAddr","type":"address"},{"internalType":"uint256","name":"tokenId","type":"uint256"},{"internalType":"uint256","name":"amount","type":"uint256"},{"internalType":"uint256","name":"approval","type":"uint256"},{"internalType":"uint256","name":"disapproval","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"","type":"address"}],"name":"erc20LockedBalance","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"","type":"uint256"}],"name":"erc20Transactions","outputs":[{"internalType":"enum MultisigWallet.TxnStatus","name":"status","type":"uint8"},{"internalType":"address","name":"to","type":"address"},{"internalType":"address","name":"contractAddr","type":"address"},{"internalType":"uint256","name":"amount","type":"uint256"},{"internalType":"uint256","name":"approval","type":"uint256"},{"internalType":"uint256","name":"disapproval","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"","type":"address"},{"internalType":"uint256","name":"","type":"uint256"}],"name":"erc721LockedBalance","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"","type":"uint256"}],"name":"erc721Transactions","outputs":[{"internalType":"enum MultisigWallet.TxnStatus","name":"status","type":"uint8"},{"internalType":"address","name":"to","type":"address"},{"internalType":"address","name":"contractAddr","type":"address"},{"internalType":"uint256","name":"tokenId","type":"uint256"},{"internalType":"uint256","name":"approval","type":"uint256"},{"internalType":"uint256","name":"disapproval","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"","type":"address"},{"internalType":"address","name":"","type":"address"},{"internalType":"uint256[]","name":"","type":"uint256[]"},{"internalType":"uint256[]","name":"","type":"uint256[]"},{"internalType":"bytes","name":"","type":"bytes"}],"name":"onERC1155BatchReceived","outputs":[{"internalType":"bytes4","name":"","type":"bytes4"}],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"","type":"address"},{"internalType":"address","name":"","type":"address"},{"internalType":"uint256","name":"","type":"uint256"},{"internalType":"uint256","name":"","type":"uint256"},{"internalType":"bytes","name":"","type":"bytes"}],"name":"onERC1155Received","outputs":[{"internalType":"bytes4","name":"","type":"bytes4"}],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"","type":"address"},{"internalType":"address","name":"","type":"address"},{"internalType":"uint256","name":"","type":"uint256"},{"internalType":"bytes","name":"","type":"bytes"}],"name":"onERC721Received","outputs":[{"internalType":"bytes4","name":"","type":"bytes4"}],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"owner","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"renounceOwnership","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"revokeDelegation","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"","type":"address"}],"name":"signers","outputs":[{"internalType":"address","name":"delegateTo","type":"address"},{"internalType":"uint256","name":"weight","type":"uint256"},{"internalType":"int256","name":"txnCap","type":"int256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"bytes4","name":"interfaceId","type":"bytes4"}],"name":"supportsInterface","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"newOwner","type":"address"}],"name":"transferOwnership","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"signer_","type":"address"},{"internalType":"int256","name":"txnCap_","type":"int256"}],"name":"updateTxnCap","outputs":[],"stateMutability":"nonpayable","type":"function"},{"stateMutability":"payable","type":"receive"}]',
  'MultisigWallet',
);

class MultisigWallet extends _i1.GeneratedContract {
  MultisigWallet({
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

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> _signerCount({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[2];
    assert(checkSignature(function, '50f1dedc'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as BigInt);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> addSigner(
    _i1.EthereumAddress signer_,
    BigInt txnCap_,
    String cid_, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[3];
    assert(checkSignature(function, 'c986b076'));
    final params = [
      signer_,
      txnCap_,
      cid_,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> approveERC1155Transaction(
    BigInt txnId_, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[4];
    assert(checkSignature(function, '758509b6'));
    final params = [txnId_];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> approveERC20Transaction(
    BigInt txnId_, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[5];
    assert(checkSignature(function, '769d3379'));
    final params = [txnId_];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> approveERC721Transaction(
    BigInt txnId_, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[6];
    assert(checkSignature(function, 'eb07e2f2'));
    final params = [txnId_];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> createERC1155Transaction(
    _i1.EthereumAddress to_,
    _i1.EthereumAddress contractAddr_,
    BigInt tokenId_,
    BigInt amount_, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[7];
    assert(checkSignature(function, '4b17280e'));
    final params = [
      to_,
      contractAddr_,
      tokenId_,
      amount_,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> createERC20Transaction(
    _i1.EthereumAddress to_,
    _i1.EthereumAddress contractAddr_,
    BigInt amount_, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[8];
    assert(checkSignature(function, 'fecb2d77'));
    final params = [
      to_,
      contractAddr_,
      amount_,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> createERC721Transaction(
    _i1.EthereumAddress to_,
    _i1.EthereumAddress contractAddr_,
    BigInt tokenId_, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[9];
    assert(checkSignature(function, 'e4b66fb8'));
    final params = [
      to_,
      contractAddr_,
      tokenId_,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> delegate(
    _i1.EthereumAddress to_, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[10];
    assert(checkSignature(function, '5c19a95c'));
    final params = [to_];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> disapproveERC1155Trasaction(
    BigInt txnId_, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[11];
    assert(checkSignature(function, '081d686f'));
    final params = [txnId_];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> disapproveERC20Trasaction(
    BigInt txnId_, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[12];
    assert(checkSignature(function, '8254b56d'));
    final params = [txnId_];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> disapproveERC721Trasaction(
    BigInt txnId_, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[13];
    assert(checkSignature(function, 'd10a9059'));
    final params = [txnId_];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> erc1155LockedBalance(
    _i1.EthereumAddress $param20,
    BigInt $param21, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[14];
    assert(checkSignature(function, '8784566a'));
    final params = [
      $param20,
      $param21,
    ];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as BigInt);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<Erc1155Transactions> erc1155Transactions(
    BigInt $param22, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[15];
    assert(checkSignature(function, '501322e0'));
    final params = [$param22];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return Erc1155Transactions(response);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> erc20LockedBalance(
    _i1.EthereumAddress $param23, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[16];
    assert(checkSignature(function, 'd2db92be'));
    final params = [$param23];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as BigInt);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<Erc20Transactions> erc20Transactions(
    BigInt $param24, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[17];
    assert(checkSignature(function, 'c040d363'));
    final params = [$param24];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return Erc20Transactions(response);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<bool> erc721LockedBalance(
    _i1.EthereumAddress $param25,
    BigInt $param26, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[18];
    assert(checkSignature(function, '2384c838'));
    final params = [
      $param25,
      $param26,
    ];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as bool);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<Erc721Transactions> erc721Transactions(
    BigInt $param27, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[19];
    assert(checkSignature(function, 'f56f0354'));
    final params = [$param27];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return Erc721Transactions(response);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> onERC1155BatchReceived(
    _i1.EthereumAddress $param28,
    _i1.EthereumAddress $param29,
    List<BigInt> $param30,
    List<BigInt> $param31,
    _i2.Uint8List $param32, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[20];
    assert(checkSignature(function, 'bc197c81'));
    final params = [];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> onERC1155Received(
    _i1.EthereumAddress $param33,
    _i1.EthereumAddress $param34,
    BigInt $param35,
    BigInt $param36,
    _i2.Uint8List $param37, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[21];
    assert(checkSignature(function, 'f23a6e61'));
    final params = [];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> onERC721Received(
    _i1.EthereumAddress $param38,
    _i1.EthereumAddress $param39,
    BigInt $param40,
    _i2.Uint8List $param41, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[22];
    assert(checkSignature(function, '150b7a02'));
    final params = [];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<_i1.EthereumAddress> owner({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[23];
    assert(checkSignature(function, '8da5cb5b'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as _i1.EthereumAddress);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> renounceOwnership({
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[24];
    assert(checkSignature(function, '715018a6'));
    final params = [];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> revokeDelegation({
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[25];
    assert(checkSignature(function, 'a4d31805'));
    final params = [];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<Signers> signers(
    _i1.EthereumAddress $param42, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[26];
    assert(checkSignature(function, '736c0d5b'));
    final params = [$param42];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return Signers(response);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<bool> supportsInterface(
    _i2.Uint8List interfaceId, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[27];
    assert(checkSignature(function, '01ffc9a7'));
    final params = [interfaceId];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as bool);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> transferOwnership(
    _i1.EthereumAddress newOwner, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[28];
    assert(checkSignature(function, 'f2fde38b'));
    final params = [newOwner];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> updateTxnCap(
    _i1.EthereumAddress signer_,
    BigInt txnCap_, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[29];
    assert(checkSignature(function, 'e96cdc69'));
    final params = [
      signer_,
      txnCap_,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// Returns a live stream of all Delegate events emitted by this contract.
  Stream<Delegate> delegateEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('Delegate');
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
      return Delegate(decoded);
    });
  }

  /// Returns a live stream of all ERC1155TransactionApproved events emitted by this contract.
  Stream<ERC1155TransactionApproved> eRC1155TransactionApprovedEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('ERC1155TransactionApproved');
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
      return ERC1155TransactionApproved(decoded);
    });
  }

  /// Returns a live stream of all ERC1155TransactionCancelled events emitted by this contract.
  Stream<ERC1155TransactionCancelled> eRC1155TransactionCancelledEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('ERC1155TransactionCancelled');
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
      return ERC1155TransactionCancelled(decoded);
    });
  }

  /// Returns a live stream of all ERC1155TransactionCreated events emitted by this contract.
  Stream<ERC1155TransactionCreated> eRC1155TransactionCreatedEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('ERC1155TransactionCreated');
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
      return ERC1155TransactionCreated(decoded);
    });
  }

  /// Returns a live stream of all ERC1155TransactionDisapproved events emitted by this contract.
  Stream<ERC1155TransactionDisapproved> eRC1155TransactionDisapprovedEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('ERC1155TransactionDisapproved');
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
      return ERC1155TransactionDisapproved(decoded);
    });
  }

  /// Returns a live stream of all ERC1155TransactionExecuted events emitted by this contract.
  Stream<ERC1155TransactionExecuted> eRC1155TransactionExecutedEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('ERC1155TransactionExecuted');
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
      return ERC1155TransactionExecuted(decoded);
    });
  }

  /// Returns a live stream of all ERC20TransactionApproved events emitted by this contract.
  Stream<ERC20TransactionApproved> eRC20TransactionApprovedEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('ERC20TransactionApproved');
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
      return ERC20TransactionApproved(decoded);
    });
  }

  /// Returns a live stream of all ERC20TransactionCancelled events emitted by this contract.
  Stream<ERC20TransactionCancelled> eRC20TransactionCancelledEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('ERC20TransactionCancelled');
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
      return ERC20TransactionCancelled(decoded);
    });
  }

  /// Returns a live stream of all ERC20TransactionCreated events emitted by this contract.
  Stream<ERC20TransactionCreated> eRC20TransactionCreatedEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('ERC20TransactionCreated');
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
      return ERC20TransactionCreated(decoded);
    });
  }

  /// Returns a live stream of all ERC20TransactionDisapproved events emitted by this contract.
  Stream<ERC20TransactionDisapproved> eRC20TransactionDisapprovedEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('ERC20TransactionDisapproved');
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
      return ERC20TransactionDisapproved(decoded);
    });
  }

  /// Returns a live stream of all ERC20TransactionExecuted events emitted by this contract.
  Stream<ERC20TransactionExecuted> eRC20TransactionExecutedEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('ERC20TransactionExecuted');
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
      return ERC20TransactionExecuted(decoded);
    });
  }

  /// Returns a live stream of all ERC721TransactionApproved events emitted by this contract.
  Stream<ERC721TransactionApproved> eRC721TransactionApprovedEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('ERC721TransactionApproved');
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
      return ERC721TransactionApproved(decoded);
    });
  }

  /// Returns a live stream of all ERC721TransactionCancelled events emitted by this contract.
  Stream<ERC721TransactionCancelled> eRC721TransactionCancelledEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('ERC721TransactionCancelled');
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
      return ERC721TransactionCancelled(decoded);
    });
  }

  /// Returns a live stream of all ERC721TransactionCreated events emitted by this contract.
  Stream<ERC721TransactionCreated> eRC721TransactionCreatedEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('ERC721TransactionCreated');
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
      return ERC721TransactionCreated(decoded);
    });
  }

  /// Returns a live stream of all ERC721TransactionDisapproved events emitted by this contract.
  Stream<ERC721TransactionDisapproved> eRC721TransactionDisapprovedEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('ERC721TransactionDisapproved');
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
      return ERC721TransactionDisapproved(decoded);
    });
  }

  /// Returns a live stream of all ERC721TransactionExecuted events emitted by this contract.
  Stream<ERC721TransactionExecuted> eRC721TransactionExecutedEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('ERC721TransactionExecuted');
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
      return ERC721TransactionExecuted(decoded);
    });
  }

  /// Returns a live stream of all OwnershipTransferred events emitted by this contract.
  Stream<OwnershipTransferred> ownershipTransferredEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('OwnershipTransferred');
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
      return OwnershipTransferred(decoded);
    });
  }

  /// Returns a live stream of all RevokeDelegation events emitted by this contract.
  Stream<RevokeDelegation> revokeDelegationEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('RevokeDelegation');
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
      return RevokeDelegation(decoded);
    });
  }

  /// Returns a live stream of all SignerAdded events emitted by this contract.
  Stream<SignerAdded> signerAddedEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('SignerAdded');
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
      return SignerAdded(decoded);
    });
  }

  /// Returns a live stream of all SignerTxnCapUpdated events emitted by this contract.
  Stream<SignerTxnCapUpdated> signerTxnCapUpdatedEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('SignerTxnCapUpdated');
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
      return SignerTxnCapUpdated(decoded);
    });
  }
}

class Erc1155Transactions {
  Erc1155Transactions(List<dynamic> response)
      : status = (response[0] as BigInt),
        to = (response[1] as _i1.EthereumAddress),
        contractAddr = (response[2] as _i1.EthereumAddress),
        tokenId = (response[3] as BigInt),
        amount = (response[4] as BigInt),
        approval = (response[5] as BigInt),
        disapproval = (response[6] as BigInt);

  final BigInt status;

  final _i1.EthereumAddress to;

  final _i1.EthereumAddress contractAddr;

  final BigInt tokenId;

  final BigInt amount;

  final BigInt approval;

  final BigInt disapproval;
}

class Erc20Transactions {
  Erc20Transactions(List<dynamic> response)
      : status = (response[0] as BigInt),
        to = (response[1] as _i1.EthereumAddress),
        contractAddr = (response[2] as _i1.EthereumAddress),
        amount = (response[3] as BigInt),
        approval = (response[4] as BigInt),
        disapproval = (response[5] as BigInt);

  final BigInt status;

  final _i1.EthereumAddress to;

  final _i1.EthereumAddress contractAddr;

  final BigInt amount;

  final BigInt approval;

  final BigInt disapproval;
}

class Erc721Transactions {
  Erc721Transactions(List<dynamic> response)
      : status = (response[0] as BigInt),
        to = (response[1] as _i1.EthereumAddress),
        contractAddr = (response[2] as _i1.EthereumAddress),
        tokenId = (response[3] as BigInt),
        approval = (response[4] as BigInt),
        disapproval = (response[5] as BigInt);

  final BigInt status;

  final _i1.EthereumAddress to;

  final _i1.EthereumAddress contractAddr;

  final BigInt tokenId;

  final BigInt approval;

  final BigInt disapproval;
}

class Signers {
  Signers(List<dynamic> response)
      : delegateTo = (response[0] as _i1.EthereumAddress),
        weight = (response[1] as BigInt),
        txnCap = (response[2] as BigInt);

  final _i1.EthereumAddress delegateTo;

  final BigInt weight;

  final BigInt txnCap;
}

class Delegate {
  Delegate(List<dynamic> response)
      : from = (response[0] as _i1.EthereumAddress),
        to = (response[1] as _i1.EthereumAddress);

  final _i1.EthereumAddress from;

  final _i1.EthereumAddress to;
}

class ERC1155TransactionApproved {
  ERC1155TransactionApproved(List<dynamic> response)
      : txnId = (response[0] as BigInt),
        approver = (response[1] as _i1.EthereumAddress);

  final BigInt txnId;

  final _i1.EthereumAddress approver;
}

class ERC1155TransactionCancelled {
  ERC1155TransactionCancelled(List<dynamic> response)
      : txnId = (response[0] as BigInt);

  final BigInt txnId;
}

class ERC1155TransactionCreated {
  ERC1155TransactionCreated(List<dynamic> response)
      : txnId = (response[0] as BigInt),
        to = (response[1] as _i1.EthereumAddress),
        contractAddr = (response[2] as _i1.EthereumAddress),
        amount = (response[3] as BigInt),
        tokenId = (response[4] as BigInt);

  final BigInt txnId;

  final _i1.EthereumAddress to;

  final _i1.EthereumAddress contractAddr;

  final BigInt amount;

  final BigInt tokenId;
}

class ERC1155TransactionDisapproved {
  ERC1155TransactionDisapproved(List<dynamic> response)
      : txnId = (response[0] as BigInt),
        disapprover = (response[1] as _i1.EthereumAddress);

  final BigInt txnId;

  final _i1.EthereumAddress disapprover;
}

class ERC1155TransactionExecuted {
  ERC1155TransactionExecuted(List<dynamic> response)
      : txnId = (response[0] as BigInt);

  final BigInt txnId;
}

class ERC20TransactionApproved {
  ERC20TransactionApproved(List<dynamic> response)
      : txnId = (response[0] as BigInt),
        approver = (response[1] as _i1.EthereumAddress);

  final BigInt txnId;

  final _i1.EthereumAddress approver;
}

class ERC20TransactionCancelled {
  ERC20TransactionCancelled(List<dynamic> response)
      : txnId = (response[0] as BigInt);

  final BigInt txnId;
}

class ERC20TransactionCreated {
  ERC20TransactionCreated(List<dynamic> response)
      : txnId = (response[0] as BigInt),
        to = (response[1] as _i1.EthereumAddress),
        contractAddr = (response[2] as _i1.EthereumAddress),
        amount = (response[3] as BigInt);

  final BigInt txnId;

  final _i1.EthereumAddress to;

  final _i1.EthereumAddress contractAddr;

  final BigInt amount;
}

class ERC20TransactionDisapproved {
  ERC20TransactionDisapproved(List<dynamic> response)
      : txnId = (response[0] as BigInt),
        disapprover = (response[1] as _i1.EthereumAddress);

  final BigInt txnId;

  final _i1.EthereumAddress disapprover;
}

class ERC20TransactionExecuted {
  ERC20TransactionExecuted(List<dynamic> response)
      : txnId = (response[0] as BigInt);

  final BigInt txnId;
}

class ERC721TransactionApproved {
  ERC721TransactionApproved(List<dynamic> response)
      : txnId = (response[0] as BigInt),
        approver = (response[1] as _i1.EthereumAddress);

  final BigInt txnId;

  final _i1.EthereumAddress approver;
}

class ERC721TransactionCancelled {
  ERC721TransactionCancelled(List<dynamic> response)
      : txnId = (response[0] as BigInt);

  final BigInt txnId;
}

class ERC721TransactionCreated {
  ERC721TransactionCreated(List<dynamic> response)
      : txnId = (response[0] as BigInt),
        to = (response[1] as _i1.EthereumAddress),
        contractAddr = (response[2] as _i1.EthereumAddress),
        tokenId = (response[3] as BigInt);

  final BigInt txnId;

  final _i1.EthereumAddress to;

  final _i1.EthereumAddress contractAddr;

  final BigInt tokenId;
}

class ERC721TransactionDisapproved {
  ERC721TransactionDisapproved(List<dynamic> response)
      : txnId = (response[0] as BigInt),
        disapprover = (response[1] as _i1.EthereumAddress);

  final BigInt txnId;

  final _i1.EthereumAddress disapprover;
}

class ERC721TransactionExecuted {
  ERC721TransactionExecuted(List<dynamic> response)
      : txnId = (response[0] as BigInt);

  final BigInt txnId;
}

class OwnershipTransferred {
  OwnershipTransferred(List<dynamic> response)
      : previousOwner = (response[0] as _i1.EthereumAddress),
        newOwner = (response[1] as _i1.EthereumAddress);

  final _i1.EthereumAddress previousOwner;

  final _i1.EthereumAddress newOwner;
}

class RevokeDelegation {
  RevokeDelegation(List<dynamic> response)
      : signer = (response[0] as _i1.EthereumAddress);

  final _i1.EthereumAddress signer;
}

class SignerAdded {
  SignerAdded(List<dynamic> response)
      : signerAddress = (response[0] as _i1.EthereumAddress),
        cid = (response[1] as String),
        txnCap = (response[2] as BigInt);

  final _i1.EthereumAddress signerAddress;

  final String cid;

  final BigInt txnCap;
}

class SignerTxnCapUpdated {
  SignerTxnCapUpdated(List<dynamic> response)
      : signer = (response[0] as _i1.EthereumAddress),
        txnCap = (response[1] as BigInt);

  final _i1.EthereumAddress signer;

  final BigInt txnCap;
}
