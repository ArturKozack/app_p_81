import 'package:hive_flutter/hive_flutter.dart';

part 'category_type.g.dart';

@HiveType(typeId: 4)
enum CategoryType {
  @HiveField(0)
  all,
  @HiveField(1)
  other,
  @HiveField(2)
  work,
  @HiveField(3)
  sport,
  @HiveField(4)
  music,
  @HiveField(5)
  education,
  @HiveField(6)
  messengers,
  @HiveField(7)
  movies,
  @HiveField(8)
  books,
  @HiveField(9)
  games,
}
