// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'private_key.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PrivateKeyAdapter extends TypeAdapter<PrivateKey> {
  @override
  final int typeId = 2;

  @override
  PrivateKey read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PrivateKey(
      privateKey: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PrivateKey obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.privateKey);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrivateKeyAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
