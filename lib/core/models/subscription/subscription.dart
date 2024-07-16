import 'package:app_p_81/core/models/category_type/category_type.dart';
import 'package:app_p_81/core/models/subscription_type/subscription_type.dart';
import 'package:hive/hive.dart';

part 'subscription.g.dart';

@HiveType(typeId: 2)
class SubscriptionModel {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final int amount;

  @HiveField(3)
  final SubscriptionType type;

  @HiveField(4)
  final DateTime startDate;

  @HiveField(5)
  final CategoryType category;

  @HiveField(6)
  final bool isReminderSet;

  const SubscriptionModel({
    required this.id,
    required this.name,
    required this.amount,
    required this.type,
    required this.startDate,
    required this.category,
    required this.isReminderSet,
  });

  SubscriptionModel copyWith({
    String? id,
    String? name,
    int? amount,
    SubscriptionType? type,
    DateTime? startDate,
    CategoryType? category,
    bool? isReminderSet,
  }) {
    return SubscriptionModel(
      id: id ?? this.id,
      name: name ?? this.name,
      amount: amount ?? this.amount,
      type: type ?? this.type,
      startDate: startDate ?? this.startDate,
      category: category ?? this.category,
      isReminderSet: isReminderSet ?? this.isReminderSet,
    );
  }

  @override
  String toString() => name;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SubscriptionModel &&
        other.id == id &&
        other.name == name &&
        other.amount == amount &&
        other.type == type &&
        other.startDate == startDate &&
        other.category == category &&
        other.isReminderSet == isReminderSet;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        amount.hashCode ^
        type.hashCode ^
        startDate.hashCode ^
        category.hashCode ^
        isReminderSet.hashCode;
  }
}
