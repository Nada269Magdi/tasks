import 'package:hive/hive.dart';

part 'billmodel.g.dart';
@HiveType(typeId: 0)
class Billmodel extends HiveObject{
  @HiveField(0)
  final String title;
  @HiveField(1)
  final double price;
  @HiveField(2)
  final int dueday;
  @HiveField(3)
  final bool ispaid;
  @HiveField(4)
  final bool isimportant;
  @HiveField(5)
  final bool ismonthly;

  Billmodel({required this.title, 
  required this.price, 
  required this.dueday, 
  required this.ispaid, 
  required this.isimportant, 
  required this.ismonthly
  });
}