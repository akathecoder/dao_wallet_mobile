import 'package:multisig_wallet_with_delegation/utils/modals/token_types.dart';

List<ERC20Transaction> asERC20Transactions({
  required transactionsData,
}) {
  List<ERC20Transaction> erc20Transactions = [];

  for (var transaction in transactionsData) {
    List<String> approvedBy = [];
    for (var approver in transaction["approvedBy"]) {
      approvedBy.add(approver["address"].toString());
    }

    List<String> disapprovedBy = [];
    for (var disapprover in transaction["disapprovedBy"]) {
      disapprovedBy.add(disapprover["address"].toString());
    }

    ERC20Transaction erc20transaction = ERC20Transaction(
      txnId: transaction["txnId"].toString(),
      to: transaction["to"].toString(),
      contractAddr: transaction["contractAddr"].toString(),
      amount: int.parse(transaction["amount"].toString()),
      approval: int.parse(transaction["approval"].toString()),
      disapproval: int.parse(transaction["disapproval"].toString()),
      txnStatus: transaction["txnStatus"].toString(),
      createdBy: transaction["createdBy"]["address"].toString(),
      approvedBy: approvedBy,
      disapprovedBy: disapprovedBy,
      createdOn: transaction["createdOn"].toString(),
    );

    erc20Transactions.add(erc20transaction);
  }

  return erc20Transactions;
}

List<ERC721Transaction> asERC721Transactions({
  required transactionsData,
}) {
  List<ERC721Transaction> erc721Transactions = [];

  for (var transaction in transactionsData) {
    List<String> approvedBy = [];
    for (var approver in transaction["approvedBy"]) {
      approvedBy.add(approver["address"].toString());
    }

    List<String> disapprovedBy = [];
    for (var disapprover in transaction["disapprovedBy"]) {
      disapprovedBy.add(disapprover["address"].toString());
    }

    ERC721Transaction erc721transaction = ERC721Transaction(
      txnId: transaction["txnId"].toString(),
      tokenId: int.parse(transaction["tokenId"].toString()),
      to: transaction["to"].toString(),
      contractAddr: transaction["contractAddr"].toString(),
      approval: int.parse(transaction["approval"].toString()),
      disapproval: int.parse(transaction["disapproval"].toString()),
      txnStatus: transaction["txnStatus"].toString(),
      createdBy: transaction["createdBy"]["address"].toString(),
      approvedBy: approvedBy,
      disapprovedBy: disapprovedBy,
      createdOn: transaction["createdOn"].toString(),
    );

    erc721Transactions.add(erc721transaction);
  }

  return erc721Transactions;
}

List<ERC1155Transaction> asERC1155Transactions({
  required transactionsData,
}) {
  List<ERC1155Transaction> erc1155Transactions = [];

  for (var transaction in transactionsData) {
    List<String> approvedBy = [];
    for (var approver in transaction["approvedBy"]) {
      approvedBy.add(approver["address"].toString());
    }

    List<String> disapprovedBy = [];
    for (var disapprover in transaction["disapprovedBy"]) {
      disapprovedBy.add(disapprover["address"].toString());
    }

    ERC1155Transaction erc1155transaction = ERC1155Transaction(
      txnId: transaction["txnId"].toString(),
      tokenId: int.parse(transaction["tokenId"].toString()),
      to: transaction["to"].toString(),
      contractAddr: transaction["contractAddr"].toString(),
      amount: int.parse(transaction["amount"].toString()),
      approval: int.parse(transaction["approval"].toString()),
      disapproval: int.parse(transaction["disapproval"].toString()),
      txnStatus: transaction["txnStatus"].toString(),
      createdBy: transaction["createdBy"]["address"].toString(),
      approvedBy: approvedBy,
      disapprovedBy: disapprovedBy,
      createdOn: transaction["createdOn"].toString(),
    );

    erc1155Transactions.add(erc1155transaction);
  }

  return erc1155Transactions;
}
