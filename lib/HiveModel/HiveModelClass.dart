import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class ToDoModel extends HiveObject {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late DateTime dateTime;

  @HiveField(2)
  late String memo;

  ToDoModel({required this.title, required this.dateTime, required this.memo});
}