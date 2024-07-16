import 'package:app_p_81/core/models/payment_status/payment_status.dart';
import 'package:hive/hive.dart';

part 'payments.g.dart';

@HiveType(typeId: 6)
class PaymentModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final DateTime date;

  @HiveField(2)
  final PaymentStatus status;

  @HiveField(3)
  final String subscriptionId;

  const PaymentModel({
    required this.id,
    required this.date,
    required this.status,
    required this.subscriptionId,
  });

  PaymentModel copyWith({
    String? id,
    DateTime? date,
    PaymentStatus? status,
    String? subscriptionId,
  }) {
    return PaymentModel(
      id: id ?? this.id,
      subscriptionId: subscriptionId ?? this.subscriptionId,
      date: date ?? this.date,
      status: status ?? this.status,
    );
  }
}
