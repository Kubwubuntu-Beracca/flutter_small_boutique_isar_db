import 'package:boutique/models/category.dart';
import 'package:boutique/models/product.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

class Categories with ChangeNotifier {
  late Future<Isar> db;
  Categories() {
    db = openDB();
  }
  List<Category> _categories = [];
  List<Category> get categories => _categories;

  Future<void> saveCategory(Category newCategory) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.categorys.putSync(newCategory));
    _categories.add(newCategory);
    notifyListeners();
  }

  Future<List<Category>> getAllCategories() async {
    final isar = await db;
    return await isar.categorys.where().findAll();
  }

  Future<void> getCategories() async {
    final isar = await db;
    final response = await isar.categorys.where().findAll();
    _categories = response;
    notifyListeners();
  }

  Future<Isar> openDB() async {
    //check if has an instance already running
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [CategorySchema],
        inspector: true,
      );
    }
    throw UnimplementedError();
  }
}
