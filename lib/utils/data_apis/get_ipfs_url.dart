String getIpfsUrl({required String url}) {
  String ipfsLink = url;

  if (url.contains('http') && url.contains('ipfs')) {
    ipfsLink = "https://ipfs.io/ipfs/$url";
  } else if (url.contains('ipfs')) {
    RegExp rEx = RegExp(r'/ipfs:?\/+/');
    String hash = url.split(rEx)[1];
    ipfsLink = "https://ipfs.io/ipfs/$hash";
  }

  return ipfsLink;
}
