import 'package:hive_flutter/hive_flutter.dart';

part 'subscription_type.g.dart';

@HiveType(typeId: 3)
enum SubscriptionType {
  @HiveField(0)
  yearly,
  @HiveField(1)
  monthly,
}
