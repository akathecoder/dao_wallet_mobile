class ERC20Token {
  int balance;
  int lockedBalance;
  String contractName;
  String contractTickerSymbol;
  String contractAddr;
  String logoUrl;
  int decimals;
  int quoteRate;

  ERC20Token({
    required this.balance,
    required this.lockedBalance,
    required this.contractName,
    required this.contractTickerSymbol,
    required this.contractAddr,
    required this.logoUrl,
    required this.decimals,
    required this.quoteRate,
  });
}

class ERC721Token {
  String contractName;
  String contractAddr;
  String contractTickerSymbol;
  String nftName;
  String description;
  String url;
  int tokenId;
  bool locked;

  ERC721Token({
    required this.contractName,
    required this.contractAddr,
    required this.contractTickerSymbol,
    required this.nftName,
    required this.description,
    required this.url,
    required this.tokenId,
    required this.locked,
  });
}

class ERC1155Token {
  String contractName;
  String contractAddr;
  String contractTickerSymbol;
  String nftName;
  String description;
  int tokenBalance;
  String url;
  int tokenId;
  int lockedBalance;

  ERC1155Token({
    required this.contractName,
    required this.contractAddr,
    required this.contractTickerSymbol,
    required this.nftName,
    required this.description,
    required this.tokenBalance,
    required this.url,
    required this.tokenId,
    required this.lockedBalance,
  });
}

class ERC20Transaction {
  String txnId;
  String to;
  String contractAddr;
  int amount;
  int approval;
  int disapproval;
  String txnStatus;
  String createdBy;
  List<String> approvedBy;
  List<String> disapprovedBy;
  String createdOn;
  String? executedOn;

  ERC20Transaction({
    required this.txnId,
    required this.to,
    required this.contractAddr,
    required this.amount,
    required this.approval,
    required this.disapproval,
    required this.txnStatus,
    required this.createdBy,
    required this.approvedBy,
    required this.disapprovedBy,
    required this.createdOn,
    this.executedOn,
  });

  ERCTransaction asERCTransaction() {
    return ERCTransaction(
      txnId: txnId,
      to: to,
      contractAddr: contractAddr,
      approval: approval,
      disapproval: disapproval,
      txnStatus: txnStatus,
      createdBy: createdBy,
      approvedBy: approvedBy,
      disapprovedBy: disapprovedBy,
      createdOn: createdOn,
      amount: amount,
      executedOn: executedOn,
      type: ERCTransactionType.erc20,
    );
  }
}

class ERC721Transaction {
  String txnId;
  String to;
  String contractAddr;
  int tokenId;
  int approval;
  int disapproval;
  String txnStatus;
  String createdBy;
  List<String> approvedBy;
  List<String> disapprovedBy;
  String createdOn;
  String? executedOn;

  ERC721Transaction({
    required this.txnId,
    required this.to,
    required this.contractAddr,
    required this.tokenId,
    required this.approval,
    required this.disapproval,
    required this.txnStatus,
    required this.createdBy,
    required this.approvedBy,
    required this.disapprovedBy,
    required this.createdOn,
    this.executedOn,
  });

  ERCTransaction asERCTransaction() {
    return ERCTransaction(
      txnId: txnId,
      to: to,
      contractAddr: contractAddr,
      approval: approval,
      disapproval: disapproval,
      txnStatus: txnStatus,
      createdBy: createdBy,
      approvedBy: approvedBy,
      disapprovedBy: disapprovedBy,
      createdOn: createdOn,
      tokenId: tokenId,
      executedOn: executedOn,
      type: ERCTransactionType.erc721,
    );
  }
}

class ERC1155Transaction {
  String txnId;
  String to;
  String contractAddr;
  int tokenId;
  int amount;
  int approval;
  int disapproval;
  String txnStatus;
  String createdBy;
  List<String> approvedBy;
  List<String> disapprovedBy;
  String createdOn;
  String? executedOn;

  ERC1155Transaction({
    required this.txnId,
    required this.to,
    required this.contractAddr,
    required this.tokenId,
    required this.amount,
    required this.approval,
    required this.disapproval,
    required this.txnStatus,
    required this.createdBy,
    required this.approvedBy,
    required this.disapprovedBy,
    required this.createdOn,
    this.executedOn,
  });

  ERCTransaction asERCTransaction() {
    return ERCTransaction(
      txnId: txnId,
      to: to,
      contractAddr: contractAddr,
      approval: approval,
      disapproval: disapproval,
      txnStatus: txnStatus,
      createdBy: createdBy,
      approvedBy: approvedBy,
      disapprovedBy: disapprovedBy,
      createdOn: createdOn,
      amount: amount,
      executedOn: executedOn,
      tokenId: tokenId,
      type: ERCTransactionType.erc1155,
    );
  }
}

enum ERCTransactionType {
  erc20,
  erc721,
  erc1155,
}

class ERCTransaction {
  String txnId;
  String to;
  String contractAddr;
  int? tokenId;
  int? amount;
  int approval;
  int disapproval;
  String txnStatus;
  String createdBy;
  List<String> approvedBy;
  List<String> disapprovedBy;
  String createdOn;
  String? executedOn;
  ERCTransactionType type;

  ERCTransaction({
    required this.txnId,
    required this.to,
    required this.contractAddr,
    this.tokenId,
    this.amount,
    required this.approval,
    required this.disapproval,
    required this.txnStatus,
    required this.createdBy,
    required this.approvedBy,
    required this.disapprovedBy,
    required this.createdOn,
    required this.type,
    this.executedOn,
  });
}
