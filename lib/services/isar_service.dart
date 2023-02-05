import 'package:boutique/models/category.dart';
import 'package:isar/isar.dart';

import '../models/product.dart';

class IsarService {
  static Future<Isar>? db;
  IsarService() {
    db = openDB();
  }
  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [CategorySchema, ProductSchema],
        inspector: true,
      );
    }
    throw UnimplementedError();
  }
}
