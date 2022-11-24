import 'package:multisig_wallet_with_delegation/utils/modals/wallet_metadata_types.dart';

Signer asSigner({required ownerData}) {
  SignerMetadata signerMetadata = SignerMetadata(
    name: ownerData["metadata"]["name"],
    contactNo: ownerData["metadata"]["contactNo"],
    email: ownerData["metadata"]["email"],
    walletAddress: ownerData["metadata"]["walletAddress"],
    role: ownerData["metadata"]["role"],
    remarks: ownerData["metadata"]["remarks"],
  );

  Signer owner = Signer(
    address: ownerData["address"],
    weight: int.parse(ownerData["weight"]),
    txnCap: int.parse(ownerData["txnCap"]),
    metadata: signerMetadata,
    delegateTo: ownerData["delegateTo"],
  );

  return owner;
}

WalletMetadata asWalletMetadata({required metadata}) {
  WalletMetadata walletMetadata = WalletMetadata(
    title: metadata["title"],
    description: metadata["description"],
  );

  return walletMetadata;
}
