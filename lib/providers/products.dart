import 'package:flutter/material.dart';

import '../models/product.dart';

class Products with ChangeNotifier {
  final List<Product> _items = [
    //   Producti(
    //     id: 'p1',
    //     name: 'Red Shirt',
    //     category: 'A red shirt - it is pretty red!',
    //     price: '29.99',
    //   ),
    //   Producti(
    //     id: 'p2',
    //     name: 'Yellow Scarf',
    //     category: 'A red shirt - it is pretty red!',
    //     price: '19.99',
    //   ),
    //   Producti(
    //     id: 'p3',
    //     name: 'A Pan',
    //     category: 'A red shirt - it is pretty red!',
    //     price: '59.99',
    //   ),
    //   Producti(
    //     id: 'p4',
    //     name: 'Trousers',
    //     category: 'A red shirt - it is pretty red!',
    //     price: '59.99',
    //   ),
  ];
  List<Product> get items => _items;
  // void addProduc(Product product) {
  //   final newProd = Product(
  //     name: product.name,
  //     category: product.category,
  //     price: product.price,
  //   );
  //   _items.add(newProd);
  //   notifyListeners();
  // }
  Future<void> saveProduct(Product newProduct) async {}
}
