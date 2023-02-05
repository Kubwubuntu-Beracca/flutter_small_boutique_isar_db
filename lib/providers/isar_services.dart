import 'package:boutique/models/category.dart';
import 'package:boutique/models/product.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

class IsarServices with ChangeNotifier {
  late Future<Isar> db;
  IsarServices() {
    db = openDB();
  }
  List<Category> _categories = [];
  List<Category> get categories => _categories;
  List<Product> _products = [];
  List<Product> get products => _products;

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

//============================PRODUCT SECTION=============================
  Future<void> saveProduct(Product newProduct) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.products.putSync(newProduct));
    _products.add(newProduct);
    notifyListeners();
  }

  Future<void> getAllProducts() async {
    final isar = await db;
    final response = await isar.products.where().findAll();
    _products = response;
    notifyListeners();
  }

  Future<void> deleteProduct(id) async {
    final isar = await db;
    isar.writeTxn(() async {
      final success = await isar.products.delete(id);
      final existingProdIndex = _products.indexWhere((cat) => cat.id == id);
      Product existingProd = _products[existingProdIndex];
      print('Product deleted:${success}');
      if (success == true) {
        _products.removeAt(existingProdIndex);
        notifyListeners();
      } else {
        _products.insert(existingProdIndex, existingProd);
        notifyListeners();
      }
    });
  }

  Product findProdById(id) {
    return _products.firstWhere((cat) => cat.id == id);
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
