import 'package:hive/hive.dart';

part 'private_key.g.dart';

@HiveType(typeId: 2)
class PrivateKey {
  PrivateKey({
    required this.privateKey,
  });

  @HiveField(0)
  String privateKey;
}
