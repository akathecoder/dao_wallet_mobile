class Signer {
  String address;
  int weight;
  int txnCap;
  String? delegateTo;
  SignerMetadata metadata;

  Signer({
    required this.address,
    required this.weight,
    required this.txnCap,
    this.delegateTo,
    required this.metadata,
  });
}

class SignerMetadata {
  String name;
  String contactNo;
  String email;
  String walletAddress;
  String role;
  String remarks;

  SignerMetadata({
    required this.name,
    required this.contactNo,
    required this.email,
    required this.walletAddress,
    required this.role,
    required this.remarks,
  });
}

class WalletMetadata {
  String title;
  String description;

  WalletMetadata({
    required this.title,
    required this.description,
  });
}

class WalletSigner {}
