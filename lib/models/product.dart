import 'package:boutique/models/category.dart';
import 'package:isar/isar.dart';
part 'product.g.dart';

@Collection()
class Product {
  Id id = Isar.autoIncrement;
  late String name;
  late String category;
  late String price;
}
