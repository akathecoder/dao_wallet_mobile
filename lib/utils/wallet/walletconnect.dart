import 'package:url_launcher/url_launcher.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';

Future<String> connectWallet() async {
  late SessionStatus sessionStatus;

  final connector = WalletConnect(
    bridge: 'https://bridge.walletconnect.org',
    clientId: "a940c7f9bee39387cb5e78f3c9896f04",
    clientMeta: const PeerMeta(
      name: 'any name',
      description: 'any description',
      url: 'any url',
      icons: ['logo url'],
    ),
  );

  // Subscribe to events
  connector.on('connect', (session) {
    print("connect: $session");

    var address = sessionStatus.accounts[0];
    var chainId = sessionStatus.chainId;

    print("Address: $address");
    print("Chain Id: $chainId");
  });

  connector.on('session_request', (payload) {
    print("session request: $payload");
  });

  connector.on('disconnect', (session) {
    print("disconnect: $session");
  });

  // Create a new session
  if (!connector.connected) {
    sessionStatus = await connector.createSession(
      chainId: 1,
      onDisplayUri: (uri) {
        _launchURL(uri);
      },
    );
  }

  return sessionStatus.toString();
}

_launchURL(String uri) async {
  Uri url = Uri.parse(uri);

  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    print('Could not launch $url');
  }
}
