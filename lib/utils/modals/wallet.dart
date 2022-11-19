import 'package:hive/hive.dart';

part 'wallet.g.dart';

@HiveType(typeId: 1)
class Wallet {
  Wallet({
    required this.chainId,
    required this.accounts,
    this.networkId,
    this.rpcUrl,
  });

  @HiveField(0)
  int chainId;

  @HiveField(1)
  List<String> accounts;

  @HiveField(2)
  int? networkId;

  @HiveField(3)
  String? rpcUrl;
}
