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

  Future<void> getAllCategories() async {
    final isar = await db;
    final response = await isar.categorys.where().findAll();
    _categories = response;
    notifyListeners();
  }

  Future<void> deleteCategory(id) async {
    final isar = await db;
    isar.writeTxn(() async {
      final success = await isar.categorys.delete(id);
      final existingCategoryIndex =
          _categories.indexWhere((cat) => cat.id == id);
      Category existingCategory = _categories[existingCategoryIndex];
      print('Category deleted:${success}');
      if (success == true) {
        _categories.removeAt(existingCategoryIndex);
        notifyListeners();
      } else {
        _categories.insert(existingCategoryIndex, existingCategory);
        notifyListeners();
      }
    });
  }

  Future<void> updateCategory(id, Category updatedCategory) async {
    final isar = await db;
    isar.writeTxn(() async {
      final category = await isar.categorys.get(id);
    });
  }

  Category findById(id) {
    return _categories.firstWhere((cat) => cat.id == id);
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
