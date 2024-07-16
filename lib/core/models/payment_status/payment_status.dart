import 'package:hive_flutter/hive_flutter.dart';

part 'payment_status.g.dart';

@HiveType(typeId: 5)
enum PaymentStatus {
  @HiveField(0)
  active,
  @HiveField(1)
  paid,
  @HiveField(2)
  terminated,
}
