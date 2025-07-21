// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'billmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BillmodelAdapter extends TypeAdapter<Billmodel> {
  @override
  final int typeId = 0;

  @override
  Billmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Billmodel(
      title: fields[0] as String,
      price: fields[1] as double,
      dueday: fields[2] as int,
      ispaid: fields[3] as bool,
      isimportant: fields[4] as bool,
      ismonthly: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Billmodel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.price)
      ..writeByte(2)
      ..write(obj.dueday)
      ..writeByte(3)
      ..write(obj.ispaid)
      ..writeByte(4)
      ..write(obj.isimportant)
      ..writeByte(5)
      ..write(obj.ismonthly);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BillmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
