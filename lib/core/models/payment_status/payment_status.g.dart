// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_status.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PaymentStatusAdapter extends TypeAdapter<PaymentStatus> {
  @override
  final int typeId = 5;

  @override
  PaymentStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return PaymentStatus.active;
      case 1:
        return PaymentStatus.paid;
      case 2:
        return PaymentStatus.terminated;
      default:
        return PaymentStatus.active;
    }
  }

  @override
  void write(BinaryWriter writer, PaymentStatus obj) {
    switch (obj) {
      case PaymentStatus.active:
        writer.writeByte(0);
        break;
      case PaymentStatus.paid:
        writer.writeByte(1);
        break;
      case PaymentStatus.terminated:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaymentStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
