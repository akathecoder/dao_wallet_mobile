import 'package:walletconnect_dart/walletconnect_dart.dart';

final connector = WalletConnect(
  bridge: 'https://bridge.walletconnect.org',
  clientId: "a940c7f9bee39387cb5e78f3c9896f04",
  clientMeta: const PeerMeta(
    name: 'Multisig Wallet with Delegation',
    description:
        'This is a multisig wallet with the added functionality of delegation where signers of a wallet can assign their voting rights to another signer.',
    url: 'https://multisig-wallet-w-delegation.vercel.app/',
    icons: ['logo url'],
  ),
);
