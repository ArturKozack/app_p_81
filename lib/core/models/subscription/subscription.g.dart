// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubscriptionModelAdapter extends TypeAdapter<SubscriptionModel> {
  @override
  final int typeId = 2;

  @override
  SubscriptionModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubscriptionModel(
      id: fields[0] as String,
      name: fields[1] as String,
      amount: fields[2] as int,
      type: fields[3] as SubscriptionType,
      startDate: fields[4] as DateTime,
      category: fields[5] as CategoryType,
      isReminderSet: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, SubscriptionModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.startDate)
      ..writeByte(5)
      ..write(obj.category)
      ..writeByte(6)
      ..write(obj.isReminderSet);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubscriptionModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
